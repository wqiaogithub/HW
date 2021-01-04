#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Two Beta distribution comparison"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("a1","alpha 1",min = 1,max = 200,value = 30),
      sliderInput("b1","beta 1", min = 1,max = 200,value = 30),
      sliderInput("a2","alpha 2",min = 1,max = 200,value = 40), 
      sliderInput("b2", "beta 2",min = 1,max = 200, value = 40)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      h3("The probability that beta1>beta2"),
      textOutput("prob")
    )
  )
))
