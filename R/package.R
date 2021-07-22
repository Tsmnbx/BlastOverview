#Need certain packages to build the R package.
install.packages(c("devtools", "roxygen2", "testthat", "knitr"))
# attach packages
library(devtools)
library(roxygen2)
library(testthat)
library(knitr)

# Check that you have everything installed
devtools::has_devel()
#pkgbuild::check_build_tools(debug = TRUE)
#Name BLAST Overview

#To start an R package: Recommended method:

#Via RStudio by selecting “File” → “New Project...” 
#→ “New Directory” → “R Package” (check create git repository).