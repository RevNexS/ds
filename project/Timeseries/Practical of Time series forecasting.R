rainfall1 <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071) 
combined.rainfall <- matrix(c(rainfall1),nrow = 12)
rainfall.timeseries <- ts(combined.rainfall,start = c(2012,1),frequency = 12)
print(rainfall.timeseries)
png(file = "rainfall_combined.png") 
plot(rainfall.timeseries, main = "Multiple Time Series") 
dev.off()

#predicting

data(AirPassengers)
class(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassangers)
summary(AirPassengers)
plot(AirPassengers) 
cycle(AirPassengers) 
plot(aggregate(AirPassengers,FUN=mean))
boxplot(AirPassengers~cycle(AirPassengers)) 


#To predict the air passenger for next 10 years
fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)) 
pred <- predict(fit, n.ahead = 10*12)
pred
ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3)) 

