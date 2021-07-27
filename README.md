
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BlastOverview

<!-- badges: start -->
<!-- badges: end -->

The goal of BlastOverview is to See what terms tend to pop up with your
Blast search

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Tsmnbx/BlastOverview")
#> Downloading GitHub repo Tsmnbx/BlastOverview@HEAD
#> Skipping 4 packages not available: Biostrings, IRanges, AnnotationDbi, annotate
#>      checking for file ‘/private/var/folders/mh/gcs_71797dx5nslkdhs3dnw00000gn/T/RtmpkVd8tf/remoteseb8838543389/Tsmnbx-BlastOverview-522f018/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/mh/gcs_71797dx5nslkdhs3dnw00000gn/T/RtmpkVd8tf/remoteseb8838543389/Tsmnbx-BlastOverview-522f018/DESCRIPTION’
#>   ─  preparing ‘BlastOverview’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘BlastOverview_0.1.0.tar.gz’
#>      
#> 
#> Installing package into '/private/var/folders/mh/gcs_71797dx5nslkdhs3dnw00000gn/T/RtmplnLaJn/temp_libpathc9601e4f2648'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(BlastOverview)
## basic example code
```

First you have to Blast the results to Create a Data Frame of a Blast
search

``` r
library(BlastOverview)
#Here is the TakifuguRubripesChromosome12 which as a gene on Chrosome 12 of
# a Takifugu Rubripes a type of puffer fish
db<-Blast(TakifuguRubripesChromosome12)
```

Next you can create a wordcloud from the results

``` r
library(BlastOverview)
#Here is the TakifuguRubripesChromosome12 which as a gene on Chrosome 12 of
# a Takifugu Rubripes a type of puffer fish
db<-Blast(TakifuguRubripesChromosome12)
WordGraph(db)
```
