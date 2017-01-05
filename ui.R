#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that predict diamond price
shinyUI(
  fluidPage(theme = shinytheme("cyborg"),
  
  # Application title
  titlePanel("Predict Diamond Price"),
  h5("Please enter the properties of the diamond in question:"),
  h1(""),

  # Sidebar with a Diamonds properties as inputs
  sidebarLayout(
    sidebarPanel(
      
       numericInput('carat', 'Carat:', 5, min = 0.01, max= 8, step = 0.1),
       
       selectInput('cut', "Cut:", 
                   c("Fair"= "Fair",
                     "Good"="Good",
                     "Very Good"= "Very Good",
                     "Premium"= "Premium",
                     "Ideal"= "Ideal"), 
                   multiple = FALSE),
       
       selectInput('color', "Color:", 
                   c("J"="J" ,"I"="I","H"="H", "G"="G","F"="F","E"="E", "D"="E"), 
                   multiple = FALSE),
       
       selectInput('clarity', "Clarity:", 
                   c("I1"="I1" ,"SI1"="SI1", "SI2"="SI2", 
                     "VS1"="VS1","VS2"="VS2","VVS1"="VVS1",
                     "VVS2"="VVS2", "IF"="IF"), 
                   multiple = FALSE),
       
       submitButton('Submit')
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4('The Diamond predicted price is:'),
      h5(textOutput("prediction")),
      img(src='diamond3.jpg', align="center")
    )
  )
))
