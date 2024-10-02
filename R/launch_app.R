#' Launch shiny app
#'
#' @examples
#' launch_app()
#' @export
launch_app <- function() {
  app_dir <- system.file("birth-app", package = "ausbirthplace")
  shiny::runApp(app_dir, display.mode = "normal")
}

#' @export
launch_app2 <- function() {
  app_dir <- system.file("new-birth-app", package = "ausbirthplace")
  shiny::runApp(app_dir, display.mode = "normal")
}
