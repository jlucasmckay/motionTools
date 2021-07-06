# notify user when calling library(motionTools)
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(hrule())
  packageStartupMessage("motionTools is maintained by lucas@dbmi.emory.edu")
  packageStartupMessage(hrule())
}

# set options when calling library(motionTools) or calling motionTools:: functions
.onLoad <- function(libname, pkgname) {
  op.user <- options()
  op.motionTools <- list(knitr.kable.NA = "")
  toset <- !(names(op.motionTools) %in% names(op.user))
  if (any(toset)) options(op.motionTools[toset])
  invisible()
}


