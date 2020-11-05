#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# Define server logic required to draw the distribution plots
shinyServer(function(input, output) {

    output$thePlot <- renderPlot({
      
      distType <- input$Distribution
      size <- input$`Number of Variables`
      
      if(distType == "Normal"){
        
        Vector <- rnorm(size, mean = as.numeric(input$Mean),sd = as.numeric(input$`Standard Deviation`))
        
      }
      if(distType == "Exponential"){
        Vector <- rexp(size, rate = 1/as.numeric(input$lambda))
      }
      
      hist(Vector, col = "green")
      
})
})

