#' Histograms of random numbers
#'
#' Generates 100 uniform random numbers between 0 and `range`, and
#' plots a `ggplot2` histogram.
#'
#' You can modify the plot using
#' ```r
#' random_number(5) + ggplot2::theme_bw()
#' ```
#'
#' @param range **Maximum** value for the uniform distribution
#'
#' @return `ggplot2` histogram of the random values
#' @export
#'
#' @importFrom ggplot2 ggplot aes geom_histogram
#'
#' @examples
#' random_number(12)
random_number <- function(range) {
  random_numbers <- data.frame(numbers = runif(n = 100, min = 0, max = range-1))

  ggplot2::ggplot(data = random_numbers, aes(x = numbers)) +
    geom_histogram()
}

