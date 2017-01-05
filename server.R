#
# This is the server logic of a Shiny web application that predicts diamond price based on a machine learning model. 


library(shiny)
library(ggplot2)
library(caret)

data(diamonds)


model_glm <- train(price~carat+cut+color+clarity,
                  method="glm",
                  data=diamonds,
                  trControl = trainControl(method = "cv", number = 5, verboseIter = TRUE))

# Define server logic required to compute diamond's price
shinyServer(function(input, output) {
   
  output$prediction <- renderPrint ({
    
    carat = input$carat
    cut = input$cut
    color = input$color
    clarity = input$clarity

    pred <- predict(model_glm,data.frame(carat, cut, color, clarity))
    if (pred < 0){
      result = 0
    }else{
      result <- as.numeric(pred)
      
    }
   
    prettyNum(result,big.mark=",",scientific=FALSE)
    
  })
    
  
})
