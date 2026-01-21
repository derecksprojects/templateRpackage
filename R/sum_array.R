#' Sum a numeric vector using optimized C++ code
#'
#' Uses loop unrolling (4x) for better CPU pipelining.
#'
#' @param x A numeric vector to sum
#' @return The sum of all elements
#'
#' @examples
#' sum_array(1:100)
#' sum_array(c(1.5, 2.5, 3.0))
#'
#' @useDynLib templateRpackage, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#' @export
sum_array <- function(x) {
  if (!is.numeric(x)) {
    stop("x must be numeric")
  }
  sum_array_cpp(as.double(x))
}
