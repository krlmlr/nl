#' Newline-separated construction of lists
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
nl <- function(expr, envir = parent.frame()) {
  expr <- substitute(expr)
  envir <- new.env(parent = envir)
  lapply(expr[-1], eval, envir = envir)
}
