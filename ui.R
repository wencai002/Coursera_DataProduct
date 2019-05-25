library(rsconnect)
library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Predict Species based on the Sepal and Petal width"),
  h4("Here is the decription on how to use this app:"),
  h6("The default iris data is used from R.",
     br(),
     "This data is intend to be used for the observation of three different kinds of flowers.",
     br(),
     "Just put the to-be value of Petal.Length and Petal.Width on the below box. Then click Submit.",
     br(),
     "You will get the predicted Specie.",
     br(),
     "The plot in the main panel is also an interactive plot."
    ),
  sidebarLayout(
    sidebarPanel(
      textInput("Petal_Length","Petal.Length",value=4),
      textInput("Petal_Width","Petal.Width",value=1),
      submitButton("Submit")
    ),
    mainPanel(
      plotlyOutput("plot1"),
      h3("Predicted Specie:"),
      textOutput("pred1")
    ) 
  )
))
