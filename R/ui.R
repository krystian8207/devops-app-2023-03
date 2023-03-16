#' @export
ui <- shinydashboardPlus::dashboardPage(
  options = list(sidebarExpandOnHover = TRUE),
  header = shinydashboardPlus::dashboardHeader(
    title = "Cool App" |> shiny::h3(class = "dropdown", style = "display: inline;")
  ),
  sidebar = shinydashboardPlus::dashboardSidebar(
    minified = TRUE, collapsed = FALSE,
    shiny::selectInput("store", "Store", choices = 1:3, selected = 1),
    shiny::selectInput("department", "Department", choices = 1:3, selected = 1),
    shiny::selectInput(
      "variables", "Variables",
      choices = c("Date", "Temperature", "Fuel_Price", "CPI", "Unemployment", "IsHoliday", "Weekly_Sales", "Name"),
      selected = c("Date", "Weekly_Sales"), multiple = TRUE
    )
  ),
  body = shinydashboard::dashboardBody(
    shiny::textOutput("title"),
    shiny::tableOutput("sales_data")
  ),
  controlbar = shinydashboardPlus::dashboardControlbar(),
  title = "DashboardPage"
)
