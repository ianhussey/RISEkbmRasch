% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RISEkbmRasch.R
\name{RItargeting}
\alias{RItargeting}
\title{Targeting, Wright map derivative.}
\usage{
RItargeting(dfin, dich, xlim = c(-5, 6))
}
\arguments{
\item{dfin}{Dataframe with item data only}

\item{dich}{Set to TRUE if your data is dichotomous}

\item{xlim}{Optionally, set lower/upper limits for x axis}
}
\description{
Outputs a figure consisting of three figures with the
same scale on top of each other.
At the top is a histogram of Person Locations, with a dotted line and
gray field indicating mean/SD. In the middle is a similar histogram with
Item Thresholds. At the bottom is a figure showing the individual
item thresholds as dots.
}
