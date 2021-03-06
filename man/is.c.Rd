% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities.eval.R
\name{is.c}
\alias{is.c}
\title{Determine if the first element of a parse tree is identical to the \code{c}
function.}
\usage{
is.c(expr)
}
\arguments{
\item{expr}{A parse tree generated by \code{substitute()}.}
}
\description{
This provides a quick way to evaluate whether the \code{x} or \code{y}
vectors have a \code{c()} wrapping. This is important for subsequent
subsetting of the respective vectors. Those vectors without a \code{c()}
wrapping will be wrapped by \code{list()}. Symbols are not passed to
\code{is.c()} due to the subsetting of the first element of the parse-tree.
}

