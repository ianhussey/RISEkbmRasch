% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RISEkbmRasch.R
\name{RIitemfitPCM2}
\alias{RIitemfitPCM2}
\title{Create table with Rasch PCM model item fit values for each item.}
\usage{
RIitemfitPCM2(
  dfin,
  samplesize = 300,
  nsamples = 10,
  cpu = 4,
  zstd_min = -2,
  zstd_max = 2,
  msq_min = 0.7,
  msq_max = 1.3,
  fontsize = 15
)
}
\arguments{
\item{dfin}{Dataframe with item data only}

\item{samplesize}{Desired sample size in multisampling (recommended range 250-500)}

\item{nsamples}{Desired number of samples (recommended range 10-50)}

\item{cpu}{Number of CPU cores to utilize (default = 4)}

\item{zstd_min}{Lower cutoff level for ZSTD}

\item{zstd_max}{Upper cutoff level for ZSTD}

\item{msq_min}{Lower cutoff level for MSQ}

\item{msq_max}{Upper cutoff level for MSQ}

\item{fontsize}{Set fontsize for table}
}
\description{
Special version of RIitemfitPCM that utilizes multiple CPU cores to improve
performance. Requires \code{library(doParallel)}. To find how many cores you
have on your computer, use \code{parallel::detectCores()}, but remember to keep
some cores free.
}
\details{
ZSTD is inflated with large samples (N > 500). Optional function to reduce
sample size and run analysis using multiple random samples to get average ZSTD
25 samples seems to give a stable output, but 10 is probably
sufficient for a reliable look at the approximate ZSTD statistics.
It is recommended #' to use sample size 250-500, based on
Hagell & Westergren, 2016.
}
