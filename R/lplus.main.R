# `%L%+`() ----------------------------------------------------------------
#
#' Add components to a ggloop object.
#'
#' The \code{\%L+\%} (L-plus) operator allows you to add components to a ggloop
#' object - whether that object is a:
#' \itemize{
#'  \item{nested list of ggplot plots}
#'  \item{list of ggplot plots}
#'  \item{single ggplot.}
#' }
#'
#' \code{\%L+\%} is a substitute for \code{+} and is used in the same fashion:
#' to add geoms, stats, aesthetics, facets, and other features to \code{ggplot}
#' object. The returned object from \code{ggloop()} is often a nested list of
#' \code{ggplot} objects. However it is possible to use \code{\%L+\%} in place
#' of where \code{+} would normally be used. This is due to the conditional
#' statements present in \code{\%L+\%}'s structure.
#'
#' @param lhs Typically the returned object by \code{ggloop()}: either a nested
#'   list of \code{ggplot} objects or a list of \code{ggplot} object, but can
#'   also be a single \code{ggplot} object.
#' @param rhs A geom, stat, or other layer feature from the \code{ggplot2}
#'   package.
#' @examples
#' # Add component to entire list.
#' g <- ggloop(mtcars, aes_loop(x = mpg:hp, y = mpg:hp))
#' g <- g %L+% ggplot2::geom_point()
#'
#' # Add component to a subset of a list
#' g2 <- ggloop(mtcars, aes_loop(x = disp:wt, y = disp:wt, color = c(cyl, gear)))
#' g2$color.gear <- g2$color.gear %L+% ggplot2::geom_point()
#' g2$color.cyl[1:3] <- g2$color.cyl[1:3] %L+% ggplot2::geom_point()
#' g2$color.cyl$x.hp_y.drat <- g2$color.cyl$x.hp_y.drat %L+% ggplot2::geom_point()
#' @export
`%L+%` <- function(lhs, rhs) {
  parent <- parent.frame()
  env <- new.env(parent = parent)

  chain_parts <- split_chain(match.call())

  lhs_eval <- eval(chain_parts[["lhs"]], env, env)
  lhs_type <- eval_lhs(lhs_eval)

  wrapping_fun <- names(flist[which(lhs_type)])
  to_eval <- nest_function(wrapping_fun, chain_parts)

  # "Evaluate the nested function with envir = flist
  eval(to_eval, flist)
}


