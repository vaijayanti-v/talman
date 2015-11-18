library(shiny)
source("helper.R")
shinyServer(function(input, output) {
  
  output$longevity<-renderText({
    pred<-predictLongevity(input$college,input$father)
    
    ifelse(pred == TRUE, 
           "will quit within a year",
           "will stay longer than a year"
           )
  })
})
