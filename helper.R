#load libraries
source("load_libs.r")

#Step 1
#Load data
source("load_data.r")

source("predict_LR.R")

source("predict_NN.R")

#Step 2
#shuffle rows
employee<-as.data.frame(employee)
noOfRecords<-nrow(employee)
employee<- employee[sample(noOfRecords),]

#Split data into training and test set
train<-employee[1:((noOfRecords*2)/3),]
test<-employee[(nrow(train)+1):noOfRecords,]

predictLongevity<-function(college,father,gender,branch,recruitment){
  model<-modelLR()

  candidate<-train[1,]
  candidate$college     <- as.numeric(college  )  
  candidate$father      <- as.numeric(father   )  
  candidate$gender      <- as.numeric(gender    ) 
  candidate$branch      <- as.numeric(branch     )
  candidate$recruitment <- as.numeric(recruitment)
  
  prediction<-predict.glm(model, newdata=candidate, type="response")
  cat("CANDIDATE%\n")
  prediction<-ifelse(prediction>0.5,1,0)
  cat("LOGIT Model has predicted the candidate will stay : ",prediction,"\n")
  
  return(ifelse(prediction==1,TRUE,FALSE))}

predictLongevity_NN<-function(college,father,gender,branch,recruitment){
  
  model<-modelNN()
  
  candidate<-train[1,]
  candidate$college     <- as.numeric(college  )  
  candidate$father      <- as.numeric(father   )  
  candidate$gender      <- as.numeric(gender    ) 
  candidate$branch      <- as.numeric(branch     )
  candidate$recruitment <- as.numeric(recruitment)
  
  prediction_NN<-predict(model, newdata=candidate, type="raw")
  prediction_NN<-ifelse(prediction_NN>0.5,1,0)
  cat("Neural Net Model has predicted the candidate will stay : ",prediction_NN,"\n")
  
  
  return(ifelse(prediction_NN==1,TRUE,FALSE))}
