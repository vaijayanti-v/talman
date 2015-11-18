library(forecast)

site<-scan("D:/sarvatra/4Wind/onshore_sites/SITE_00001.csv",list(dates=0,times="",speeds=0,powers=0),skip=3,sep=",")
site$dates
#print(site$dates)
#print(site$times)
#print(site$speeds)
#print(site$powers)
site$hourmin<-sprintf("%04d",as.integer(site$times))
site$newdate<-with(site, as.POSIXct(paste(dates,hourmin), format="%Y%m%d %H%M"))

#site_ts<-ts(site, frequency=17570, names=c(newdate,speeds,powers))

#site_ts<-ts(cbind(site$newdate, site$speeds), frequency=365*24*6, start=c(2004,1))
site_ts<-ts(site$speeds, frequency=365*24*6, start=c(2004,1))

#print(site_ts$dates)
#print(site_ts$times)
#print(site_ts$speeds)
#print(site_ts$powers)
#print(site_ts$newdate)

#plot.ts(site_ts,  col="blue")

#sitecomp<-decompose(site_ts)
#	plot(sitecomp)

site_training<-site_ts[1:105264]
site_cv<-site_ts[105265:157968]
print(length(site_ts))
print(length(site_training))
print(length(site_cv))


#plot.ts(site_training, col="black")

#site_training_SMA <- SMA(site_training, n=20000)
#plot.ts(site_training_SMA)


site_training_forecasts<-HoltWinters(site_training, beta=FALSE, gamma=FALSE, l.start=6.6)


#Let us try to fit various models and evaluate the RMSE
#*********************************************
#1. ARIMA
#*********************************************
print("ARIMA")
#Find p and q using acf (auto correlation) and pacf (partial auto-correlation) functions
#Find d after differencing 
#Use auto.arima function to find best fit ARIMA model
ARIMA<-auto.arima(site_training)
acf(ARIMA$residuals, lag.max=20)

#plot acf of residuals

#*********************************************
#2. HoltWinters
#*********************************************
print("HoltWinters")
site_training_HoltWinters_forecast<-forecast.HoltWinters(site_training_forecasts, h=10000)
#plot acf of residuals
acf(site_training_HoltWinters_forecast$residuals, lag.max=20)

#*********************************************
#3. Kernelised regression
#*********************************************
print("Kernelised regression")

#*********************************************
#4. Frequency NN
#*********************************************
print("Frequency NN")

#*********************************************
#5. Deep feed-forward NN
#*********************************************
print("Deep feed-forward NN")

#*********************************************
#6. Deep recurrent NN
#*********************************************
print("Deep recurrent NN")





