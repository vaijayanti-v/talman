library(shiny)
source("helper.R")

shinyServer(function(input, output) {
  
  output$longevity<-renderText({
    pred<-predictLongevity(input$college,input$father,input$gender,input$branch,input$recruitment)
    
    ifelse(pred == TRUE, 
           "LOGIT Model prediction: will stay longer than a year",
           "LOGIT Model prediction: will quit within a year"
           )
  })
  output$longevity_NN<-renderText({
    pred<-predictLongevity_NN(input$college,input$father,input$gender,input$branch,input$recruitment)
    
    ifelse(pred == TRUE, 
           "Neural Net Model prediction: will stay longer than a year",
           "Neural Net Model prediction: will quit within a year"
    )
  })
#   output$image<-renderImage({"sad.png"
#   })
})
