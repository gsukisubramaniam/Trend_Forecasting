## Execute this code after loading the data in the table "data" with values in the column name "value"
library(tseries)
actual<-ts(dataset$Value,frequency = 12,start = c(2014,1))
Decompose_Actual <- decompose(actual)
seasonal <- Decompose_Actual$seasonal
trend <- Decompose_Actual$trend
deseason <- actual-seasonal
detrend <- cbind(t<-c(1:39),deseason) 
fit <- lm(deseason ~ t , data = detrend)
summary(fit)
seasonal