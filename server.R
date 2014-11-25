library(shiny)
source("ingredients.R")

shinyServer(function(input, output) {
  ingredients <- reactive(
    if (input$variation) variation else basic      
  )
  
  scaled <- reactive({
    df <- scale(ingredients(), input$quantity, input$units, nice = input$nice,
      metric = input$metric)
    df$quantity <- format(df$quantity, drop0trailing = TRUE)
    df
  })
  
  output$ingredients <- renderTable(scaled(), 
    align = "rrll",
    include.rownames = FALSE,
    include.colnames = FALSE)
})
