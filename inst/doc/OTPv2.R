## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  otp_check_java(2)
#  [1] FALSE
#  Warning message:
#  In otp_check_java(2) : You have OTP 2.0 or 2.1 but the version of Java for OTP 1.x
#  

## ----setup, eval=FALSE--------------------------------------------------------
#  library(opentripplanner)
#  # Path to a folder containing the OTP.jar file, change to where you saved the file.
#  path_data <- file.path(tempdir(), "OTP")
#  dir.create(path_data)
#  path_otp <- otp_dl_jar(version = "2.2.0")
#  otp_dl_demo(path_data)
#  # Build Graph and start OTP
#  log1 <- otp_build_graph(otp = path_otp, dir = path_data)
#  log2 <- otp_setup(otp = path_otp, dir = path_data)
#  otpcon <- otp_connect(timezone = "Europe/London")

