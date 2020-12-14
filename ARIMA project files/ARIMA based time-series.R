# Project: Quick stock forecasting with XTS objects using timeseries based ARIMA model

# Here we are installing necessary packages mentioned below
install.packages("quantmod")
install.packages("tseries")
install.packages("timeSeries")
install.packages("forecast")
install.packages("xts")

# loading the library corresponding to installed packages
library(quantmod)
library(tseries)
library(timeSeries)
library(forecast)
library(xts)

# Pull data from Yahoo finance SPY - SPDR S&P 500 ETF(SPY) 
getSymbols('SPY', from = "2015-01-01")
# we are pulling here 5 years of data
plot(SPY)
class(SPY)
# This shows the class of data is XTS type
# Thus, we need XTS package to work with these data

# let us consider we want cloase price for each trading day(4th column),
# columns: 1)Open, 2)High, 3)Low, 4)Close, 5)Volume, 6)Adjustant
spy_close_prices = SPY[,4]
# lets plot only close prices
plot(spy_close_prices)
class(spy_close_prices)
# this variable class is also corresponds to xts/zoo class

# Graph the ACF and PACF for determining identifiable logs PACF->P, ACF->Q for custom arimas 
par(mfrow=c(1,2))
Acf(spy_close_prices, main = "ACF for Differenced Series")
Pacf(spy_close_prices, main = "PACF for Differenced Series")

# Test findings on original XTS objects
# ADF test for p-values
print(adf.test(spy_close_prices)) #p-value = 0.01417
auto.arima(spy_close_prices, seasonal = FALSE)
# we got result the series is stationary

fitA = auto.arima(spy_close_prices, seasonal = FALSE)
tsdisplay(residuals(fitA), lag.max = 40, main="(3,1,4) Model Residuals")
auto.arima(spy_close_prices, seasonal = FALSE)

# fit arima model with order(1,2,4) p=1, q=2, r=4
fitB = arima(spy_close_prices, order = c(1,2,4))
tsdisplay(residuals(fitB), lag.max = 40, main = '(1,2,4) Model Residuals')

# fit arima model with order(5,1,4) p=5, q=1, r=4
fitC = arima(spy_close_prices, order = c(5,1,4))
tsdisplay(residuals(fitC), lag.max = 40, main = '(5,1,4) Model Residuals')

# fit arima model with standard order(1,1,1) p=1, q=1, r=4
fitD = arima(spy_close_prices, order = c(1,1,1))
tsdisplay(residuals(fitD), lag.max = 40, main = '(1,1,1) Model Residuals')

# fit arima model with standard order(1,0,0) p=1, q=1, r=4
fitE = arima(spy_close_prices, order = c(1,0,0))
tsdisplay(residuals(fitE), lag.max = 40, main = '(1,0,0) Model Residuals')

# fit arima model with standard order(1,0,0) p=1, q=1, r=4
fitF = arima(spy_close_prices, order = c(1,1,0))
tsdisplay(residuals(fitF), lag.max = 40, main = '(1,1,0) Model Residuals')

# plots all the ARIMA models
par(mfrow = c(3,2)) #6 graphs in  a figure
#auto arima
# we create forecast vectors for all 6 plots
# term defines the model forecasting for next 100 days(here)
term<-100
fcast1<-forecast(fitA, h = term)
plot(fcast1)
fcast2<-forecast(fitB, h = term)
plot(fcast2)
fcast3<-forecast(fitC, h = term)
plot(fcast3)
fcast4<-forecast(fitD, h = term)
plot(fcast4)
fcast5<-forecast(fitE, h = term)
plot(fcast5)
fcast6<-forecast(fitF, h = term)
plot(fcast6)

# Mapping accuracy for the 4 forecasting, considering MASE 
accuracy(fcast1) # 99.14% accuracy
accuracy(fcast2) # 99.20% accuracy
accuracy(fcast3) # 99.28% accuracy
accuracy(fcast4) # 99.48% accuracy
accuracy(fcast5) # 100.14% accuracy
accuracy(fcast6) # 99.67% accuracy

# We can conclude from the MASE accuracy that, ARIMA(1,0,0) is the best fitted one

