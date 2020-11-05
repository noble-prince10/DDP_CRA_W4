#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Defining UI for application that draws few kinds of distribution
shinyUI(fluidPage(

    # Application title
    titlePanel("Distribution Plots using Random Numbers"),

    # Sidebar Layout containing required input parameters for the plot generation
    sidebarLayout(
        sidebarPanel(
    # Plot selection code 
            selectInput("Distribution", "Select the Type of Distribution",
                        choices = c("Exponential","Normal")),
            sliderInput("Number of Variables",
                        "Pick the sample size number to plot the values",
                        100,
                        3000,
                        value = 500,
                        step = 100),
    # Input values for particular distribution
            conditionalPanel(condition = "input.Distribution == 'Normal'",
                             textInput("Mean", "Select the mean", 5),
                             textInput("Standard Deviation", "Select the SD",2)),
            conditionalPanel(condition = "input.Distribution == 'Exponential'",
                             textInput("lambda", "Select Exponential Lambda", 1)),
            h5("Please press on 'Submit button' every time you change the input values"),
            
    # Submit button for easier use of the app
            submitButton("Plot")
        ),

        # To show the plot of the generated distribution
        mainPanel(
            plotOutput("thePlot")
        )
    )
))
