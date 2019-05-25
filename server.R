library(rsconnect)
library(shiny)
library(caret)
library(randomForest)
library(e1071)
library(dplyr)
library(ggplot2)
library(plotly)
data(iris)

shinyServer(function(input, output) {
  iris_Petal<-dplyr::select(iris,-c(Sepal.Length,Sepal.Width))
  model1<-caret::train(Species~.,data=iris_Petal,method="rf")
  input_df<-reactive({data.frame(Petal.Length=as.numeric(input$Petal_Length),
                       Petal.Width=as.numeric(input$Petal_Width))
  })
  model1pred<-reactive({predict(model1,newdata=input_df())
  })
  
  output$plot1<-renderPlotly({
    g<-ggplot()
    g<-g+geom_point(data=iris_Petal,
                    aes(x=Petal.Length,
                        y=Petal.Width,
                        color=Species))
    g<-g+geom_point(aes_string(x=input$Petal_Length,
                    y=input$Petal_Width),
                    shape=4,
                    size=6)
    g
  })
  output$pred1<-renderPrint({
    as.character(model1pred())
  })
})