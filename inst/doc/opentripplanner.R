## ----install, eval=FALSE------------------------------------------------------
#  # If you do not already have the devtools package
#  install.packages("devtools")
#  # Install the package from GitHub
#  devtools::install_github("ropensci/opentripplanner")
#  # Load the package
#  library(opentripplanner)

## ---- eval=FALSE--------------------------------------------------------------
#  path_data <- file.path(tempdir(), "OTP")
#  dir.create(path_data)

## ---- eval=FALSE--------------------------------------------------------------
#  path_data <- file.path("C:/Users/Public", "OTP")
#  dir.create(path_data)

## ---- eval=FALSE--------------------------------------------------------------
#  path_otp <- otp_dl_jar(path_data)

## ----eval=FALSE---------------------------------------------------------------
#  otp_dl_demo(path_data)

## ----eval=FALSE---------------------------------------------------------------
#  log1 <- otp_build_graph(otp = path_otp, dir = path_data)

## ----eval=FALSE---------------------------------------------------------------
#  log1 <- otp_build_graph(otp = path_otp, dir = path_data, memory = 10240)

## ---- eval = FALSE------------------------------------------------------------
#  log2 <- otp_setup(otp = path_otp, dir = path_data)

## ---- eval = FALSE------------------------------------------------------------
#  log2 <- otp_setup(otp = path_otp, dir = path_data, port = 8801, securePort = 8802)

## ---- echo = FALSE, fig.align='center', fig.cap="\\label{fig:otpgui}OTP Web GUI"----
knitr::include_graphics("images/otpwebgui.jpg")

## ---- eval = FALSE------------------------------------------------------------
#  otpcon <- otp_connect()

## ---- eval = FALSE------------------------------------------------------------
#  otpcon <- otp_connect(hostname =  "localhost",
#                        router = "default",
#                        port = 8801)

## ---- eval = FALSE------------------------------------------------------------
#  otpcon <- otp_connect(url = "https://api.digitransit.fi/routing/v1/routers/hsl")

## ---- eval = FALSE------------------------------------------------------------
#  route <- otp_plan(otpcon,
#                    fromPlace = c(-1.17502, 50.64590),
#                    toPlace = c(-1.15339, 50.72266))

## ---- eval = FALSE------------------------------------------------------------
#  # install.packages("tmap") # Only needed if you don't have tmap
#  library(tmap)              # Load the tmap package
#  tmap_mode("view")          # Set tmap to interactive viewing
#  qtm(sf::st_zm(route))      # Plot the route on a map

## ---- eval = FALSE------------------------------------------------------------
#  otp_stop()

