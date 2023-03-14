# Launch the ShinyApp

pkgload::load_all(export_all = FALSE)

shinyApp(ui = ui, server = server)
