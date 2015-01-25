library(shiny)
shinyUI(pageWithSidebar
(
  titlePanel("Local Wind Data Documentation: This app takes a U.S. zip code as an input and plots recent wind speed data from openweathermap for that zip code's location."),
  #gets zip code input     
  sidebarPanel(
              textInput('zipcode', 
              'Enter a valid US zip code (e.g., 80909, 90210, etc.)',
              value = 80909),
              submitButton("Submit")
              ),
#outputs plot of wind speeds
  mainPanel(
            plotOutput("winddata")
            )
)
)