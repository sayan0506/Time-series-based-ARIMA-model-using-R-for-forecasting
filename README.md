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

>The test returns we can proceed for lag order = 11 and timeseries passed hypothesis, and as alternate hypostheis we will process for ARIMA based modelling.
> Also, the test ensured the stationarity of the series

2. Now we used ACFAuto-correlation-function) and PACF(Partial-auto-correlation function) plots which gives the identification for the p(total number of AR or auro-regression terms) and q(total number of MA or moving-average terms) value for the model. From the below ACF vs PACF plot the identification can be analyzed:

![ACF and PACF plot analysis.png](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/ACF%20and%20PACF%20plot%20analysis.png)

> We obtain a result that, ACF decays geometrically wheras, pacf decays upto a single lag, which signifies from thumb rule of model implementation obeying **Box-Jenkins** methodology, model will be closed to AR model

>**Note**: Basic thumb rule:

* If ACF decays geometrically, PACF significant upto a certain limit over threshold, then fited model will be AR,
* If PACF decays geometrically, ACF significant upto a certain limit over threshold, then fited model will be MA,
* If both PACF and ACF decays geometrically over the threshold, then fited model will be ARMA,

3. After PACF and ACF analysis, we tried to fit the series into several ARIMA model for different sets of (p, q, r) values. The residual diagnotics corresponding to all 4 are shown below,

* [ARIMA(3,1,4)](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/Residual%20diagnostics%20of%20fitA.png)
* [ARIMA(1,2,4)](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/Residual%20diagnostics%20of%20fit%20B.png)
* [ARIMA(5,1,4)](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/Residual%20diagnostics%20of%20fit%20C.png)
* [ARIMA(1,1,1)](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/Rplot01Residual%20dignostics%20of%20fit%20D.png)

4. Following the thumb rule we fitted two more combinations to AR models at p = 1, and number of differenciations are 0, 1 respectively are attached in the following:

* [ARIMA(1,0,0)](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/fit%20E.png)
* [ARIMA(1,1,0)](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/Fit%20F.png)

5. We forecasted the price for next 100 days using the 6 fitted models as shown below:
![forecast.png](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/forecast.png)

5. After model fitting we calculated the accuracies of the corresponding 6 models, based on MASE errors, we obtained the following
* ARIMA(3,1,4): 99.14%
* ARIMA(1,2,4): 99.20%
* ARIMA(5,1,4): 99.28%
* ARIMA(1,1,1): 99.48%
* ARIMA(1,0,0): 100.14%
* ARIMA(1,1,1): 99.67%

6. Going through all the accuracies we found **ARIMA(1,0,0)** is the best fitted model, which signifies that model is AR based model, where p = 1, is the optimal one, whose model residual plot is the following:
![Fit F.png](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/Images%20and%20Plots/Fit%20F.png)

Paths:
1. The R file corresponds to this projects can be found in [Time-series-based-ARIMA-model-using-R-for-forecasting/ARIMA project files/](https://github.com/sayan0506/Time-series-based-ARIMA-model-using-R-for-forecasting/blob/main/ARIMA%20project%20files/ARIMA%20based%20time-series.R)

