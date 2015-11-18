modelLR<-function(){


#Step 3
#Model the data with training data
attach(train)
model<-glm(associated~college+father+gender+branch+recruitment, family=binomial(link="logit"), data=train)
#how well the model worked on the training set
fit_results<-ifelse(model$fitted.values>0.5,1,0)
deviance_train<-ifelse(fit_results!=train$associated,1,0)
accuracy_train<-100 - ((sum(deviance_train))/nrow(train))*100
cat("Model has prediction accuracy on training set: ",accuracy_train,"%\n")

#Step 4
#Evaluate the model with test data 
test_results<-predict.glm(model, newdata=test, type="response")
test_results<-ifelse(test_results>0.5,1,0)
deviance_test<-ifelse(test_results!=test$associated,1,0)
accuracy_test<-100 - ((sum(deviance_test))/nrow(test))*100
cat("Model has prediction accuracy on test set: ",accuracy_test,"%\n")

return(model)}
