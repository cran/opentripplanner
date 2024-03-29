#' Get travel times between points
#'
#'
#' @description This function requires OTP 1.x and the analyst
#'
#' @param otpcon OTP connection object produced by otp_connect()
#' @param path_data Path to data used in otp_build_graph()
#' @param fromPlace Numeric vector, Longitude/Latitude pair, e.g.
#'   `c(-0.134649,51.529258)`, or 2 column matrix of Longitude/Latitude pairs,
#'   or sf data frame of POINTS with CRS 4326
#' @param toPlace Numeric vector, Longitude/Latitude pair, e.g.
#'   `c(-0.088780,51.506383)`, or 2 column matrix of Longitude/Latitude pairs,
#'   or sf data frame of POINTS with CRS 4326
#' @param fromID character vector same length as fromPlace
#' @param toID character vector same length as toPlace
#' @param mode character vector of one or more modes of travel valid values
#'   TRANSIT, WALK, BICYCLE, CAR, BUS, RAIL, default CAR. Not all combinations
#'   are valid e.g. c("WALK","BUS") is valid but c("WALK","CAR") is not.
#' @param date_time POSIXct, a date and time, defaults to current date and time
#' @param arriveBy Logical, Whether the trip should depart or arrive at the
#'   specified date and time, default FALSE
#' @param maxWalkDistance Numeric passed to OTP in metres
#' @param routeOptions Named list of values passed to OTP use
#'   `otp_route_options()` to make template object.
#' @param numItineraries The maximum number of possible itineraries to return
#' @param ncores Numeric, number of cores to use when batch processing, default
#'   1, see details
#' @param timezone Character, what timezone to use, see as.POSIXct, default is
#'   local timezone
#'
#' @export
#' @family analyst
#' @return Returns an  data frame
#'
#' @details
#'
#' Make a travel time matrix using the analyst features in OPT 1.x
#'
otp_traveltime <- function(otpcon = NA,
                           path_data = NULL,
                           fromPlace = NA,
                           toPlace = NA,
                           fromID = NULL,
                           toID = NULL,
                           mode = "CAR",
                           date_time = Sys.time(),
                           arriveBy = FALSE,
                           maxWalkDistance = 1000,
                           numItineraries = 3,
                           routeOptions = NULL,
                           ncores = max(round(parallel::detectCores() * 1.25) - 1,1),
                           timezone = otpcon$timezone) {
  # Check Valid Inputs

  # Back compatibility with 0.2.1
  if (is.null(timezone)) {
    warning("otpcon is missing the timezone variaible, assuming local timezone")
    timezone <- Sys.timezone()
  }

  checkmate::assert_subset(timezone, choices = OlsonNames(tzdir = NULL))

  checkmate::assert_class(otpcon, "otpconnect")
  mode <- toupper(mode)
  checkmate::assert_subset(mode,
                           choices = c(
                             "TRANSIT", "WALK", "BICYCLE",
                             "CAR", "BUS", "RAIL", "SUBWAY",
                             "TRAM", "FERRY"
                           ),
                           empty.ok = FALSE
  )
  #checkmate::assert_character(mode, len = 1)
  #mode <- paste(mode, collapse = ",")
  checkmate::assert_posixct(date_time)
  date <- format(date_time, "%m-%d-%Y", tz = timezone)
  time <- tolower(format(date_time, "%I:%M%p", tz = timezone))
  checkmate::assert_numeric(maxWalkDistance, lower = 0, len = 1)
  checkmate::assert_numeric(numItineraries, lower = 1, len = 1)
  checkmate::assert_character(fromID, null.ok = FALSE)
  checkmate::assert_character(toID, null.ok = FALSE)
  checkmate::assert_logical(arriveBy)
  checkmate::assert_numeric(ncores, lower = 1, len = 1, upper = max(c(round(parallel::detectCores() * 1.25 ) - 1,1)))
  #arriveBy <- tolower(arriveBy)

  # Check Route Options
  if (!is.null(routeOptions)) {
    routeOptions <- otp_validate_routing_options(routeOptions)
  }

  # Special checks for fromPlace and toPlace
  fromPlace <- otp_clean_input(fromPlace, "fromPlace")
  fromPlace <- fromPlace[,2:1]

  if (!is.null(fromID)) {
    if (length(fromID) != nrow(fromPlace)) {
      stop("The length of fromID and fromPlace are not the same")
    }
  }

  if (!is.null(toID)) {
    if (length(toID) != nrow(toPlace)) {
      stop("The length of toID and toPlace are not the same")
    }
  }


  # Make a pointset for each fromPLACE
  toPlace <- sf::st_sf(data.frame(geometry = sf::st_geometry(toPlace)))
  pointsetname <- paste(sample(LETTERS, 10, TRUE), collapse = "")
  otp_pointset(toPlace, pointsetname, path_data)

  # Make surfaces
  surfaces <- otp_make_surface(otpcon = otpcon,
                               fromPlace = fromPlace,
                               mode = mode,
                               date_time = date_time,
                               arriveBy = arriveBy,
                               maxWalkDistance = maxWalkDistance,
                               routeOptions = routeOptions)

  times <- otp_surface(otpcon = otpcon,
                       surface = surfaces,
                       pointsset = pointsetname,
                       get_data = FALSE,
                       ncores = ncores)

  names(times) <- fromID

  times <- purrr::map(times, `[[`, "times")

  times <- times[lengths(times) > 0]
  times <- list2df(times)
  rownames(times) <- toID
  return(times)
}

