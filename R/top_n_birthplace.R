top_n_birthplace <- function(n, years = c(2016, 2021)) {
  census_birthplace |>
    dplyr::filter(census %in% years) |>
    dplyr::group_by(census) |>
    dplyr::arrange(count) |>
    dplyr::slice(1:n)
}
