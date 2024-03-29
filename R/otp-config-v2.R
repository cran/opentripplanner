#' Validate Config Object
#' @description
#' Checks if the list of OTP configuration options is valid
#'
#' @param config A named list made/modified from `otp_make_config()`
#' @param type type of config file
#' @family setup
#' @details
#'
#' Performs basic validity checks on class, max/min values etc as appropriate,
#' some of more complex parameters are not checked. For more details see:
#'
#' http://docs.opentripplanner.org/en/latest/Configuration
#' http://dev.opentripplanner.org/javadoc/1.3.0/org/opentripplanner/routing/core/RoutingRequest.html
#' @examples
#' \dontrun{
#' conf <- otp_make_config("build")
#' otp_validate_config(conf)
#' }
#' @noRd

otp_validate_config_v2 <- function(config, type = attributes(config)$config_type) {
  checkmate::assert_subset(type,
    choices = c("otp", "build", "router"),
    empty.ok = FALSE
  )

  if (type == "router") {
    # Logical
    checkmate::assert_logical(config$routingDefaults$allowBikeRental,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$arriveBy,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$batch,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$compactLegsByReversedSearch,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$disableAlertFiltering,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$disableRemainingWeightHeuristic,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$driveOnRight,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$geoidElevation,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$ignoreRealtimeUpdates,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$kissAndRide,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$longDistance,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$onlyTransitTrips,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$parkAndRide,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$reverseOptimizeOnTheFly,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$reverseOptimizing,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$showIntermediateStops,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$softPreTransitLimiting,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$softWalkLimiting,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$useBikeRentalAvailabilityInformation,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$useRequestedDateTimeInMaxHours,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$useTraffic,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$walkingBike,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$routingDefaults$wheelchairAccessible,
      len = 1, null.ok = TRUE
    )

    # Integer
    checkmate::assert_integer(config$routingDefaults$alightSlack,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeBoardCost,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeSwitchCost,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeSwitchTime,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_integer(config$routingDefaults$carDropoffTime,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$elevatorBoardCost,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeParkAndRide,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeParkCost,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeParkTime,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeRentalDropoffCost,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeRentalDropoffTime,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeRentalPickupCost,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeRentalPickupTime,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$bikeWalkingOptions,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$elevatorBoardTime,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$elevatorHopCost,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$elevatorHopTime,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$maxPreTransitTime,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$maxTransfers,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$MIN_SIMILARITY,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$nonpreferredTransferPenalty,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$numItineraries,
      len = 1, null.ok = TRUE, lower = 1
    )
    checkmate::assert_integer(config$routingDefaults$otherThanPreferredRoutesPenalty,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$transferPenalty,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$transferSlack,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$useUnpreferredRoutesPenalty,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_integer(config$routingDefaults$walkBoardCost,
      len = 1, null.ok = TRUE
    )



    # Character
    checkmate::assert_character(config$routingDefaults$bannedAgencies,
      null.ok = TRUE
    )
    checkmate::assert_character(config$routingDefaults$bannedRoutes,
      null.ok = TRUE
    )
    checkmate::assert_character(config$routingDefaults$bannedStops,
      null.ok = TRUE
    )
    checkmate::assert_character(config$routingDefaults$bannedStopsHard,
      null.ok = TRUE
    )
    checkmate::assert_character(config$routingDefaults$bannedTrips,
      null.ok = TRUE
    )
    checkmate::assert_character(config$routingDefaults$boardSlack,
      null.ok = TRUE
    )
    checkmate::assert_character(config$routingDefaults$preferredAgencies,
      null.ok = TRUE
    )
    checkmate::assert_character(config$routingDefaults$preferredRoutes,
      null.ok = TRUE
    )

    # Numeric
    checkmate::assert_numeric(config$routingDefaults$bikeSpeed,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$carSpeed,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$clampInitialWait,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$carAccelerationSpeed,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$carDecelerationSpeed,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$maxHours,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$maxSlope,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$maxTransferWalkDistance,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$maxWalkDistance,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$routingDefaults$maxWeight,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$preTransitOverageRate,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$preTransitPenalty,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$softWalkOverageRate,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$softWalkPenalty,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$stairsReluctance,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$triangleSafetyFactor,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$triangleSlopeFactor,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$triangleTimeFactor,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$turnReluctance,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$waitAtBeginningFactor,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$waitReluctance,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$walkReluctance,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$routingDefaults$walkSpeed,
      len = 1, null.ok = TRUE
    )

    # Not Checked
    not_checked <- c(
      "worstTime",
      "unpreferredAgencies",
      "unpreferredRoutes",
      "traversalCostModel",
      "startingTransitStopId",
      "startingTransitTripId",
      "to",
      "routerId",
      "dateTime",
      "dominanceFunction",
      "extensions",
      "intermediatePlaces",
      "locale",
      "modes",
      "optimize",
      "rctx"
    )
    message(paste0(
      "The folloing values where not checked: ",
      paste(not_checked, collapse = ", ")
    ))
  } else if (type == "build") {
    # logical
    checkmate::assert_logical(config$transit,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$streets,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$embedRouterConfig,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$areaVisibility,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$staticParkAndRide,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$dataImportReport,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_null(config$useTransfersTxt) # Rem v2.1
    checkmate::assert_null(config$parentStopLinking)# Rem v2.0
    checkmate::assert_null(config$stationTransfers)# Rem v2.0
    checkmate::assert_logical(config$platformEntriesLinking,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$matchBusRoutesToStreets,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_null(config$fetchElevationUS) # Rem v2.1
    checkmate::assert_null(config$staticBikeRental) # Rem v2.1
    checkmate::assert_logical(config$staticBikeParkAndRide,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$banDiscouragedWalking,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$banDiscouragedBiking,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_logical(config$extraEdgesStopPlatformLink,
      len = 1, null.ok = TRUE
    )

    # Interger
    checkmate::assert_integer(config$maxDataImportIssuesPerFile,
      len = 1, null.ok = TRUE, lower = 1
    )
    checkmate::assert_integer(config$maxInterlineDistance,
      len = 1, null.ok = TRUE, lower = 1
    )
    checkmate::assert_integer(config$islandWithStopsMaxSize,
      len = 1, null.ok = TRUE, lower = 1
    )
    checkmate::assert_integer(config$islandWithoutStopsMaxSize,
      len = 1, null.ok = TRUE, lower = 1
    )

    # Numeric
    checkmate::assert_numeric(config$elevationUnitMultiplier,
      len = 1, null.ok = TRUE
    )
    checkmate::assert_numeric(config$subwayAccessTime,
      len = 1, null.ok = TRUE, lower = 0
    )
    checkmate::assert_numeric(config$maxTransferDurationSeconds,
      len = 1, null.ok = TRUE,
      lower = 0
    )

    # Character
    checkmate::assert_subset(config$osmWayPropertySet,
      empty.ok = TRUE,
      choices = c("default", "norway", "uk","finland",
                  "germany","atlanta","houston")
    )
    checkmate::assert_null(config$stopClusterMode) # Rem V2.0
  } else if (type == "otp") {
    otp_validate_config(config, type = "build")
    otp_validate_config(config, type = "router")
  }
  return(TRUE)
}

#' Make Config Object
#' @description
#' OTP can be configured using three json files `otp-config.json`,
#' `build-config.json`, and `router-config.json`. This function
#' creates a named list for each config file and
#' populates the defaults values.
#'
#' @param type Which type of config file to create, "otp", "build", "router"
#' @family internal
#' @details
#' For more details see:
#' http://docs.opentripplanner.org/en/latest/Configuration
#' @examples
#' {
#'   conf <- otp_make_config("build")
#'   conf <- otp_make_config("router")
#' }
#' @noRd

otp_make_config_v2 <- function(type) {
  checkmate::assert_subset(type,
    choices = c("otp", "build", "router"),
    empty.ok = FALSE
  )

  if (type == "otp") {
    otpFeatures <- list(SandboxAPITravelTime = FALSE,
                        SandboxAPIGeocoder = FALSE)
    config <- list(otpFeatures = otpFeatures)
  } else if (type == "build") {
    config_names <- c(
      "dataImportReport", "transit",
      "subwayAccessTime", "streets",
      "embedRouterConfig", "areaVisibility", "platformEntriesLinking",
      "matchBusRoutesToStreets", "elevationBucket",
      "elevationUnitMultiplier", "fares", "osmNaming",
      "staticParkAndRide",
      "staticBikeParkAndRide", "maxDataImportIssuesPerFile",
      "maxInterlineDistance", "islandWithoutStopsMaxSize",
      "islandWithStopsMaxSize", "banDiscouragedWalking",
      "banDiscouragedBiking", "maxTransferDurationSeconds",
      "extraEdgesStopPlatformLink",
      "configVersion","dataOverlay","maxAreaNodes",
      "maxJourneyDuration","maxStopToShapeSnapDistance",
      "transferRequests","transitServiceStart","transitServiceEnd"
    )
    config <- rep(list(NULL), times = length(config_names))
    names(config) <- config_names
    # Assign Default Values
    # Logical
    config[c(
      "transit", "streets", "embedRouterConfig",
      "areaVisibility", "staticParkAndRide"
    )] <- TRUE
    config[c(
      "dataImportReport",
      "platformEntriesLinking",
      "matchBusRoutesToStreets",
      "staticBikeParkAndRide", "banDiscouragedWalking",
      "banDiscouragedBiking", "extraEdgesStopPlatformLink"
    )] <- FALSE

    # Interger
    config[["maxDataImportIssuesPerFile"]] <- 1000L
    config[["maxInterlineDistance"]] <- 200L
    config[["islandWithStopsMaxSize"]] <- 30L
    config[["islandWithoutStopsMaxSize"]] <- 40L

    # Numeric
    config[["elevationUnitMultiplier"]] <- 1
    config[["subwayAccessTime"]] <- 2
    config[["maxTransferDurationSeconds"]] <- 2000

    # Character
    config[["transitServiceStart"]] <- "-P1Y"
    config[["transitServiceEnd"]] <- "P3Y"

    # Other
    config["elevationBucket"] <- NULL
    config["fares"] <- NULL
    config["osmNaming"] <- NULL

    osmDefaults <- list(osmTagMapping = "default",
                        timeZone = NULL)

    config$osmDefaults <- osmDefaults

  } else if (type == "router") {
    config_names <- c(
      "routingDefaults", "timeout", "timeouts",
      "requestLogFile", "boardTimes", "updaters"
    )
    config <- rep(list(NULL), times = length(config_names))
    names(config) <- config_names

    routingDefaults_names <- c(
      "alightSlackForMode",
      "alightSlack",
      "allowBikeRental",
      "arriveBy",
      "bannedAgencies",
      "bannedRoutes",
      "bannedStops",
      "bannedStopsHard",
      "bannedTrips",
      "batch",
      "bikeBoardCost",
      "bikeParkAndRide",
      "bikeParkCost",
      "bikeParkTime",
      "bikeRentalDropoffCost",
      "bikeRentalDropoffTime",
      "bikeRentalPickupCost",
      "bikeRentalPickupTime",
      "bikeSpeed",
      "bikeSwitchCost",
      "bikeSwitchTime",
      "bikeWalkingOptions",
      "boardSlack",
      "boardSlackForMode",
      "carAccelerationSpeed",
      "carDecelerationSpeed",
      "carDropoffTime",
      "carSpeed",
      "clampInitialWait",
      "compactLegsByReversedSearch",
      "dateTime",
      "disableAlertFiltering",
      "disableRemainingWeightHeuristic",
      "dominanceFunction",
      "driveOnRight",
      "elevatorBoardCost",
      "elevatorBoardTime",
      "elevatorHopCost",
      "elevatorHopTime",
      "extensions",
      "from",
      "geoidElevation",
      "ignoreRealtimeUpdates",
      "intermediatePlaces",
      "kissAndRide",
      "locale",
      "longDistance",
      "maxHours",
      "maxPreTransitTime",
      "maxSlope",
      "maxTransfers",
      "maxTransferWalkDistance",
      "maxWalkDistance",
      "maxWeight",
      "MIN_SIMILARITY",
      "modes",
      "nonpreferredTransferPenalty",
      "numItineraries",
      "onlyTransitTrips",
      "optimize",
      "otherThanPreferredRoutesPenalty",
      "parameters",
      "parkAndRide",
      "preferredAgencies",
      "preferredRoutes",
      "preTransitOverageRate",
      "preTransitPenalty",
      "rctx",
      "reverseOptimizeOnTheFly",
      "reverseOptimizing",
      "routerId",
      "showIntermediateStops",
      "softPreTransitLimiting",
      "softWalkLimiting",
      "softWalkOverageRate",
      "softWalkPenalty",
      "stairsReluctance",
      "startingTransitStopId",
      "startingTransitTripId",
      "to",
      "transferPenalty",
      "transferSlack",
      "traversalCostModel",
      "triangleSafetyFactor",
      "triangleSlopeFactor",
      "triangleTimeFactor",
      "turnReluctance",
      "unpreferredAgencies",
      "unpreferredRoutes",
      "useBikeRentalAvailabilityInformation",
      "useRequestedDateTimeInMaxHours",
      "useTraffic",
      "useUnpreferredRoutesPenalty",
      "waitAtBeginningFactor",
      "waitReluctance",
      "walkBoardCost",
      "walkingBike",
      "walkReluctance",
      "walkSpeed",
      "wheelchairAccessible",
      "worstTime"
    )

    routingDefaults <- rep(list(NULL),
      times = length(routingDefaults_names)
    )
    names(routingDefaults) <- routingDefaults_names
    routingDefaults[["bikeSpeed"]] <- 5
    routingDefaults[["bikeSwitchCost"]] <- 0L
    routingDefaults[["bikeSwitchTime"]] <- 0L
    routingDefaults[["clampInitialWait"]] <- -1
    routingDefaults[["walkReluctance"]] <- 2
    routingDefaults[["walkSpeed"]] <- 1.34


    config[["routingDefaults"]] <- routingDefaults

    config[["timeout"]] <- NULL
    config[["timeouts"]] <- c(5, 4, 3, 1)
    config[["requestLogFile"]] <- NULL

    alightTimes <- rep(list(NULL), times = 2)
    names(alightTimes) <- c("boardTimes", "alightTimes")

    boardTimes <- rep(list(NULL), times = 2)
    names(boardTimes) <- c("boardTimes", "alightTimes")
    boardTimes_sub <- list(NULL)
    names(boardTimes_sub) <- "AIRPLANE"
    alightTimes_sub <- list(NULL)
    names(alightTimes_sub) <- "AIRPLANE"
    boardTimes[["boardTimes"]] <- boardTimes_sub
    alightTimes[["alightTimes"]] <- alightTimes_sub

    config$routingDefaults[["boardSlackForMode"]] <- boardTimes
    config$routingDefaults[["alightSlackForMode"]] <- alightTimes

    config$routingDefaults$itineraryFilters$accessibilityScore <- FALSE

    config[["updaters"]] <- NULL
  }

  att <- list(type)
  names(att) <- "config_type"
  attributes(config) <- c(attributes(config), att)
  return(config)
}
