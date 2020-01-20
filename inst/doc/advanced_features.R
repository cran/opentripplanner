## ----eval =FALSE--------------------------------------------------------------
#  library(opentripplanner)
#  # Path to a folder containing the OTP.jar file, change to where you saved the file.
#  path_data <- file.path(tempdir(),"OTP")
#  path_otp <- file.path(path_data,"otp.jar")
#  # Build Graph and start OTP
#  log1 <- otp_build_graph(otp = path_otp, dir = path_data)
#  log2 <- otp_setup(otp = path_otp, dir = path_data)
#  otpcon <- otp_connect()
#  

## ---- eval=FALSE--------------------------------------------------------------
#  lsoa <- sf::st_read("https://github.com/ropensci/opentripplanner/releases/download/0.1/centroids.gpkg",
#                      stringsAsFactors = FALSE)
#  head(lsoa)

## ---- eval=FALSE--------------------------------------------------------------
#  toPlace <- c(-1.159494,50.732429)

## ---- eval=FALSE--------------------------------------------------------------
#  routes <- otp_plan(otpcon = otpcon,
#                      fromPlace = lsoa,
#                      toPlace = toPlace)

## ---- echo=FALSE, fig.align='center', fig.cap="\\label{fig:route2airport}Driving Routes to Ryde Ferry"----
knitr::include_graphics("images/routes_to_ferry.jpg")

## ---- eval=FALSE--------------------------------------------------------------
#  toPlace   = lsoa[rep(seq(1, nrow(lsoa)), times = nrow(lsoa)),]
#  fromPlace = lsoa[rep(seq(1, nrow(lsoa)), each  = nrow(lsoa)),]

## ---- eval=FALSE--------------------------------------------------------------
#  routes <- otp_plan(otpcon = otpcon,
#                     fromPlace = fromPlace,
#                     toPlace = toPlace,
#                     fromID = fromPlace$geo_code,
#                     toID = toPlace$geo_code,
#                     get_geometry = FALSE)
#  routes <- routes[,c("fromPlace","toPlace","duration")]
#  # Use the tidyr package to go from long to wide format
#  routes_matrix <- tidyr::pivot_wider(routes,
#                                 key = "toPlace",
#                                 value = "duration")

## ---- echo=FALSE, fig.align='center', fig.cap="\\label{fig:multicore} Multicore performance improvements"----
knitr::include_graphics("images/multicore.jpeg")

## ---- eval=FALSE--------------------------------------------------------------
#  route <- otp_plan(otpcon = otpcon,
#                      fromPlace = c(-1.18968, 50.60096),
#                      toPlace = c(-1.19105, 50.60439),
#                      mode = "WALK",
#                      full_elevation = TRUE)

## ---- eval=FALSE--------------------------------------------------------------
#  profile_raw <- route$elevation[[1]]
#  plot(profile_raw$distance, profile_raw$second, type = "p",
#       xlab = "distance along route", ylab = "elevation")

## ---- echo=FALSE, fig.align='center', fig.cap="\\label{fig:ele1}Elevation profile from raw data"----
knitr::include_graphics("images/elevation1.png")

## ---- eval=FALSE--------------------------------------------------------------
#  profile_xyz <- sf::st_coordinates(route)
#  dists <- geodist::geodist(profile_xyz[,c("X","Y")], sequential = TRUE)
#  dists <- cumsum(dists)
#  plot(dists, profile_xyz[2:nrow(profile_xyz),"Z"], type = "p",
#       xlab = "distance along route", ylab = "elevation")

## ---- echo=FALSE, fig.align='center', fig.cap="\\label{fig:ele2}Elevation profile from XZY coordinates"----
knitr::include_graphics("images/elevation2.png")

## ----eval=FALSE---------------------------------------------------------------
#  ferry_current  <- otp_isochrone(otpcon = otpcon,
#              fromPlace = c(-1.159494, 50.732429), # lng/lat of Ryde ferry
#              mode = c("WALK","TRANSIT"),
#              maxWalkDistance = 2000,
#              date_time = as.POSIXct(strptime("2018-06-03 13:30", "%Y-%m-%d %H:%M")),
#              cutoffSec = c(15, 30, 45, 60, 75, 90) * 60 ) # Cut offs in seconds
#  ferry_current$minutes = ferry_current$time / 60 # Convert back to minutes
#  

## ---- eval=FALSE--------------------------------------------------------------
#  library(tmap)                       # Load the tmap package
#  tmap_mode("view")                   # Set tmap to interative viewing
#  map <- tm_shape(ferry_current) +  # Build the map
#    tm_fill("minutes",
#            breaks = c(0, 15.01, 30.01, 45.01, 60.01, 75.01, 90.01),
#            style = "fixed",
#            palette = "-RdYlBu") +
#    tm_borders()
#  map                                 # Plot the map

## ---- echo=FALSE, fig.align='center', fig.cap="\\label{fig:otpgui}Isochrones from Ryde ferry"----
knitr::include_graphics("images/isochrone.jpg")

## ---- eval=FALSE--------------------------------------------------------------
#  stations <- otp_geocode(otpcon = otpcon, query = "station")
#  head(stations)

## ---- eval=FALSE--------------------------------------------------------------
#  router_config <- otp_make_config("router")     # Make a config object
#  router_config$routingDefaults$walkSpeed        # Currently 1.34 m/s
#  router_config$routingDefaults$walkSpeed <- 1.5 # Increase the walking speed
#  otp_validate_config(router_config)             # Check the new config is valid
#  otp_write_config(router_config,                # Save the config file
#                   dir = path_data,
#                   router = "default")
#  

