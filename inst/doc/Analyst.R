## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  # Get OTP and the Demo Data in the normal way
#  library(opentripplanner)
#  path_data <- file.path(tempdir(), "OTP")
#  dir.create(path_data)
#  path_otp <- otp_dl_jar(version = "1.5.0") #Must use OTP 1.x
#  otp_dl_demo(path_data)
#  log1 <- otp_build_graph(otp = path_otp, dir = path_data)
#  
#  # Setup OTP with the analyst and pointsets enabled
#  log2 <- otp_setup(otp = path_otp, dir = path_data, analyst = TRUE, pointsets = TRUE)
#  otpcon <- otp_connect(timezone = "Europe/London")

## ---- echo = FALSE, fig.align='center', fig.cap="\\label{fig:analystui}OTP Web Interface in Analyst Mode"----
knitr::include_graphics("images/analyst.jpg")

## ---- eval=FALSE--------------------------------------------------------------
#  download.file("https://github.com/ropensci/opentripplanner/releases/download/0.1/centroids.gpkg",
#                "centroids.gpkg", mode = "wb")
#  lsoa <- sf::st_read("centroids.gpkg", stringsAsFactors = FALSE)
#  lsoa$jobs <- sample(100:500, nrow(lsoa))
#  otp_pointset(lsoa, "lsoa", path_data)

## ----eval=FALSE---------------------------------------------------------------
#  surfaceid <- otp_make_surface(otpcon, c(-1.17502, 50.64590))

## ----eval=FALSE---------------------------------------------------------------
#  ttimes <- otp_surface(otpcon, surfaceid, "lsoa")

## ----eval=FALSE---------------------------------------------------------------
#  ttimes <- otp_surface(otpcon, surfaceid, "lsoa", get_data = FALSE)

## ----eval=FALSE---------------------------------------------------------------
#  lsoa$time <- ttimes$times / 60
#  library(tmap)
#  tmap_mode("view")
#  tm_shape(lsoa) +
#    tm_dots(col = "time")

## ---- echo = FALSE, fig.align='center', fig.cap="\\label{fig:ttimes}Travel times to LSOA points"----
knitr::include_graphics("images/ttimes.jpg")

## ----eval=FALSE---------------------------------------------------------------
#  ttmatrix <- otp_traveltime(otpcon,
#                             path_data,
#                             fromPlace = lsoa,
#                             toPlace = lsoa,
#                             fromID = lsoa$geo_code,
#                             toID = lsoa$geo_code)

## ----eval=FALSE---------------------------------------------------------------
#  isochone <- otp_surface_isochrone(otpcon, surfaceid)

## ----eval=FALSE---------------------------------------------------------------
#  library(terra)
#  plot(isochone)

## ---- echo = FALSE, fig.align='center', fig.cap="\\label{fig:ttimes}Isochone Raster"----
knitr::include_graphics("images/raster.jpg")

