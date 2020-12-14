# Time-series-based-ARIMA-model-using-R-for-forecasting
Implementing the ARIMA model in R studio for for forecasting 100 days data

**Dataset:** Here we are using **"Yahoo Finance SPY SPOR S&P ETF(SPY)"** stock price dataset.

**The dataset features:**
>1. Opening price, 2. High price, 3. Low price, 4. Closing price(our focus), 5. Volume, 6. Adjustant

Here, an implementation of ARIMA based nodel is used to predict the closing price of the stock price is forecasted for next 100 days.

* Plot of the SPY data corrresponding to last 5 years staring from 2015-01-01:

![SPY plot.png](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/SPY%20plot.png)

* Plot of the closing price data corrresponding to last 5 years staring from 2015-01-01:

![SPY close prices plot.png](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/SPY%20close%20prices%20plot.png)

* Our timeseries model must approximately fit the SPY closing price curve.

**Workflow approach:**

1. We first do the hypothesis testing for white noise test to check whether the timeseries is white noise or notand also checks the stationarity of the model, we got the result following-
![ADF test.PNG](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/ADF%20test.PNG)
