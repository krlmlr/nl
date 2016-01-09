#' Newline-separated construction of lists
#'
#' This is an alternative syntax for constructing unnamed lists.
#'
#' @param expr A braced expression
#' @inheritParams base::eval
#' @examples
#' nl({
#'   1
#'   2
#'   3
#' })
#' @export
#' @author Based on an idea by Kevin Ushey
nl <- function(expr, envir = parent.frame()) {
  expr <- substitute(expr)
  if (!identical(expr[[1L]], quote(`{`))) {
    stop("The expr argument must be a block surrounded by braces.",
         call. = FALSE)
  }
  lapply(expr[-1], eval, envir = envir)
}
