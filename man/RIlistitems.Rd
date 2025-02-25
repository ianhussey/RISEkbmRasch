% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RISEkbmRasch.R
\name{RIlistitems}
\alias{RIlistitems}
\title{Show items based on itemlabels file}
\usage{
RIlistitems(dfin, all.items)
}
\arguments{
\item{dfin}{Dataframe with item data only}

\item{all.items}{Set to TRUE to list all items in 'itemlabels' df}
}
\value{
A table with items used in dataframe
}
\description{
Requires a dataframe with two columns, labeled "itemnr" and "item",
containing information on the item numbers (qN) and item content.
This dataframe has to be labeled "itemlabels".
}
\details{
Default behavior is to only list items that are in the dataframe.
Any items eliminated during analysis process will not be included.

If all items in the original dataset are to be shown, use option
"all.items = TRUE".
}
