#' @export
ui <- shinydashboardPlus::dashboardPage(
  options = list(sidebarExpandOnHover = TRUE),
  header = shinydashboardPlus::dashboardHeader(
    title = "Cool App" |> shiny::h3(class = "dropdown", style = "display: inline;")
  ),
  sidebar = shinydashboardPlus::dashboardSidebar(
    minified = TRUE, collapsed = FALSE
  ),
  body = shinydashboard::dashboardBody(
  )
)
