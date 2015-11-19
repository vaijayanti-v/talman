modelNN<-function(){
  
  #Step 3
  #Model the data with training data
  attach(train)
  model<-nnet(associated~college+father+gender+branch+recruitment, data=train, size=5)

  #how well the model worked on the training set
  fit_results<-ifelse(model$fitted.values>0.5,1,0)
  deviance_train<-ifelse(fit_results!=associated,1,0)
  accuracy_train<-100 - ((sum(deviance_train))/nrow(train))*100
  cat("Neural Net Model has ", accuracy_train, "% prediction accuracy on training set\n")
  
#   
#   #Step 4
#   #Evaluate the model with test data 
  test_results<-predict(model, newdata=test, type="raw")
  test_results<-ifelse(test_results>0.5,1,0)
  deviance_test<-ifelse(test_results!=test$associated,1,0)
  accuracy_test<-100 - ((sum(deviance_test))/nrow(test))*100
  cat("Neural Net Model has ",accuracy_test,"% prediction accuracy on test set\n")
  
return(model)}