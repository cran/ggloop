% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aes.remap.R
\name{remap_xy_TRUE}
\alias{remap_xy_TRUE}
\title{Uses \code{expand.grid()} to create all possible combinations of xy pairings.}
\usage{
remap_xy_TRUE(lst)
}
\arguments{
\item{lst}{A list. The list passe will be the raw list generated from calling
\code{aes_assign()} and is ran before a remap function for the any "dots"
in the list.}
}
\description{
Matching duplicates (xy pairings that contain identical xy values) will be
tossed, and unordered duplicate pairs (xy pairings which match another xy
pair (i.e. (mpg, cyl) == (cyl, mpg))) will be tossed.
}

