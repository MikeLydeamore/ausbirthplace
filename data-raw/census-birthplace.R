## code to prepare `census-birthplace` dataset goes here

census_birthplace <- read.csv("data-raw/census-birthplace.csv") |>
  dplyr::mutate(birth = factor(birth))

usethis::use_data(census_birthplace, overwrite = TRUE)
