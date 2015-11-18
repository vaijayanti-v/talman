#load libraries
source("load_libs.r")

#Step 1
#Load data
source("load_data.r")

source("predict_LR.R")

#Step 2
#Split data into training and test set
train<-(as.data.frame(employee))[1:200,]
test<-(as.data.frame(employee))[201:300,]

predictLongevity<-function(college,father,gender,branch,recruitment){
  model<-modelLR();

#  candidate<-data.frame(matrix(c(college,father,gender,branch,recruitment),nrow=1,ncol=5))
#  colnames(candidate)<-c("college","father","gender","branch","recruitment")

  candidate<-train[1,]
  candidate$college     <- as.numeric(college  )  
  candidate$father      <- as.numeric(father   )  
  candidate$gender      <- as.numeric(gender    ) 
  candidate$branch      <- as.numeric(branch     )
  candidate$recruitment <- as.numeric(recruitment)
  
  prediction<-predict.glm(model, newdata=candidate, type="response")
  cat("CANDIDATE%\n")
  prediction<-ifelse(prediction>0.5,1,0)
  cat("Model has predicted the candidate will stay : ",prediction,"\n")
  
  return(ifelse(prediction==1,TRUE,FALSE))}
