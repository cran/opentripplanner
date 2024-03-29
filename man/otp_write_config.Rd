% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/otp-config.R
\name{otp_write_config}
\alias{otp_write_config}
\title{Write config object as json file}
\usage{
otp_write_config(config, dir = NULL, router = "default")
}
\arguments{
\item{config}{A named list made/modified from `otp_make_config()`}

\item{dir}{Path to folder where data for OTP is to be stored}

\item{router}{name of the router, default is "default", must be a subfolder
of dir/graphs}
}
\description{
Takes a config list produced by `otp_make_config()` and saves it
as json file for OTP
}
\examples{
\dontrun{
conf <- otp_make_config("build")
otp_write_config(conf, dir = tempdir())
}
}
\seealso{
Other setup: 
\code{\link{otp_build_graph}()},
\code{\link{otp_check_java}()},
\code{\link{otp_check_version}()},
\code{\link{otp_dl_demo}()},
\code{\link{otp_dl_jar}()},
\code{\link{otp_make_config}()},
\code{\link{otp_setup}()},
\code{\link{otp_stop}()},
\code{\link{otp_validate_config}()}
}
\concept{setup}
