% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/otp-download.R
\name{otp_dl_jar}
\alias{otp_dl_jar}
\title{Download OTP Jar File}
\usage{
otp_dl_jar(
  path = NULL,
  version = "1.5.0",
  file_name = paste0("otp-", version, "-shaded.jar"),
  url = "https://repo1.maven.org/maven2/org/opentripplanner/otp",
  quiet = FALSE,
  cache = TRUE
)
}
\arguments{
\item{path}{path to folder where OTP is to be stored}

\item{version}{a character string of the version number default is "1.5.0"}

\item{file_name}{file name to give the otp default "otp.jar"}

\item{url}{URL to the download server}

\item{quiet}{logical, passed to download.file, default FALSE}

\item{cache}{logical, default TRUE, see details}
}
\value{
The path to the OTP file
}
\description{
Download the OTP jar file from maven.org
}
\details{
As of version 0.3.0.0 `otp_dl_jar` will cache the JAR file within
the package and ignore the `path` argument. You can force a new download to
be saved in the `path` location by setting `cache = FALSE`.
}
\examples{
\dontrun{
otp_dl_jar(tempdir())
}
}
\seealso{
Other setup: 
\code{\link{otp_build_graph}()},
\code{\link{otp_check_java}()},
\code{\link{otp_check_version}()},
\code{\link{otp_dl_demo}()},
\code{\link{otp_make_config}()},
\code{\link{otp_setup}()},
\code{\link{otp_stop}()},
\code{\link{otp_validate_config}()},
\code{\link{otp_write_config}()}
}
\concept{setup}
