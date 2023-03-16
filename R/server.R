#' @export
server <- function(input, output, session) {
  output$title <- renderText({

    data_header(input$store, input$department)
  })

  output$sales_data <- renderTable({
    tbl_data <- sample_data() %>% dplyr::mutate(Date = format(Date, '%Y-%m-%d'))
    tbl_store <- input$store

    subset_data(tbl_data, input$variables)
  })
}
