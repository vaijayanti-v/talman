library(shiny)
source("helper.R")

shinyServer(function(input, output) {
  
  output$longevity<-renderText({
    pred<-predictLongevity(input$college,input$father,input$gender,input$branch,input$recruitment)
    
    ifelse(pred == TRUE, 
           "will stay longer than a year",
           "will quit within a year"
           )
  })
})
