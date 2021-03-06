# 미래 추세 데이터를 만들어서 회귀모델로 예측

install.packages('prophet')
library(prophet)

# data List

#
interest_rate <- data_list_2004$interest_rate
colnames(interest_rate) <-c('ds', 'y')
head(interest_rate)
tail(interest_rate, 30)
m_interest_rate <- prophet(interest_rate, seasonality.mode = 'multiplicative', weekly.seasonality = F, daily.seasonality = F)
m_interest_rate
m_interest_rate_future <- make_future_dataframe(m_interest_rate, periods = 40, freq='month')
m_interest_rate_future
resultinterest_rate_future <- predict(m_interest_rate, m_interest_rate_future)

plot(m_interest_rate, resultinterest_rate_future)

# 1. cci
tail(copy_cci_index)
copy_cci_index <- data_list_2004$cci_index
colnames(copy_cci_index) <-c('ds', 'y')

head(copy_cci_index)
tail(copy_cci_index, 30)
m_cci_index <- prophet(copy_cci_index, seasonality.mode = 'multiplicative',  weekly.seasonality = F, daily.seasonality = F)
m_cci_index
m_cci_index_future <- make_future_dataframe(m_cci_index, periods = 40, freq='month')
m_cci_index_future
result_cci_index_future <- predict(m_cci_index, m_cci_index_future)
result_us_interest_rate_future
m_cci_index_future
tail(result_cci_index_future)
plot(m_cci_index, result_cci_index_future)

# 2.us interest rate
copy_us_interest_rate <- data_list_2004$interest_rate_us
head(copy_us_interest_rate)
colnames(copy_us_interest_rate) <-c('ds', 'y')

m_us_interest_rate <- prophet(copy_us_interest_rate)
m_us_interest_rate
m_us_interest_rate_future <- make_future_dataframe(m_us_interest_rate, periods = 40, freq='month', weekly.seasonality = F, daily.seasonality = F)
m_us_interest_rate_future
result_us_interest_rate_future <- predict(m_us_interest_rate, m_us_interest_rate_future)
head(result_us_interest_rate_future)

plot(m_us_interest_rate, result_us_interest_rate_future)

# 3. facility_investing
copy_facility_investing <- data_list_2004$facility_investing
colnames(copy_facility_investing) <-c('ds', 'y')

m_facility_investing <- prophet(copy_facility_investing)
m_facility_investing
m_facility_investing_future <- make_future_dataframe(m_facility_investing, periods = 40, freq='month')
m_facility_investing_future
result_facility_investing_future <- predict(m_facility_investing, m_m_facility_investing_future)

plot(m_facility_investing, result_facility_investing_future)

# 4. foreign_selling
copy_foreign_selling <- data_list_2004$foreign_selling
colnames(copy_foreign_selling) <-c('ds', 'y')

m_foreign_selling <- prophet(copy_foreign_selling)
m_foreign_selling
m_foreign_selling_future <- make_future_dataframe(m_foreign_selling, periods = 40, freq='month')
m_foreign_selling_future
result_foreign_selling_future <- predict(m_foreign_selling, m_foreign_selling_future)

plot(m_foreign_selling, result_foreign_selling_future)

# 5. inflation
copy_inflation <- data_list_2004$inflation
colnames(copy_inflation) <-c('ds', 'y')

m_inflation <- prophet(copy_inflation, seasonality.mode = 'multiplicative', weekly.seasonality = F, daily.seasonality = F)
m_inflation
m_inflation_future <- make_future_dataframe(m_inflation, periods = 40, freq='month')
m_inflation_future
result_inflation_future <- predict(m_inflation, m_inflation_future)
result_inflation_future

plot(m_inflation, result_inflation_future)

# 6. korea_export_price_index
copy_korea_export_price_index <- data_list_2004$korea_export_price_index
colnames(copy_korea_export_price_index) <-c('ds', 'y')

m_korea_export_price_index <- prophet(copy_korea_export_price_index)
m_korea_export_price_index
m_korea_export_price_index_future <- make_future_dataframe(m_korea_export_price_index, periods = 40, freq='month')
m_korea_export_price_index_future
result_korea_export_price_index_future <- predict(m_korea_export_price_index, m_korea_export_price_index_future)

plot(m_korea_export_price_index, result_korea_export_price_index_future)

# 7. unemployment
copy_unemployment <- data_list_2004$unemployment
colnames(copy_unemployment) <-c('ds', 'y')

m_unemployment <- prophet(copy_unemployment)
m_unemployment
m_unemployment_future <- make_future_dataframe(m_unemployment, periods = 40, freq='month')
m_unemployment_future
result_unemployment_future <- predict(m_unemployment, m_unemployment_future)

plot(m_unemployment, result_unemployment_future)

# 8. wti_price
copy_wti_price <- data_list_2004$wti_price
colnames(copy_wti_price) <-c('ds', 'y')

m_wti_price <- prophet(copy_wti_price)
m_wti_price
m_wti_price_future <- make_future_dataframe(m_wti_price, periods = 40, freq='month')
m_wti_price_future
result_wti_price_future <- predict(m_wti_price, m_wti_price_future)
tail(result_wti_price_future, 100)

plot(m_wti_price, result_wti_price_future)

# forecasting
result_cci_index_future[result_cci_index_future$ds >= '2018-11-01', ][, 'yhat']
result_facility_investing_future[result_facility_investing_future$ds >= '2018-11-01', ][, 'yhat']
result_foreign_selling_future[result_foreign_selling_future$ds >= '2018-11-01', ][, 'yhat']
result_inflation_future[result_inflation_future$ds >= '2018-11-01', ]
result_korea_export_price_index_future[result_korea_export_price_index_future$ds >= '2018-11-01', ][, 'yhat']
result_unemployment_future[result_unemployment_future$ds >= '2018-11-01', ][, 'yhat']
result_us_interest_rate_future[result_us_interest_rate_future$ds >= '2018-11-01', ][, 'yhat']
result_wti_price_future[result_wti_price_future$ds >= '2018-11-01', ][, 'yhat']

future_data_frame <- data.frame(
  future_us_interest_rate=result_us_interest_rate_future[result_us_interest_rate_future$ds >= '2018-11-01', ][, 'yhat'],
  future_cci = result_cci_index_future[result_cci_index_future$ds >= '2018-11-01', ][, 'yhat'],
  futrue_facility_investment=result_facility_investing_future[result_facility_investing_future$ds >= '2018-11-01', ][, 'yhat'],
  future_foreign_selling=result_foreign_selling_future[result_foreign_selling_future$ds >= '2018-11-01', ][, 'yhat'],
  future_inflation=result_inflation_future[result_inflation_future$ds >= '2018-11-01', ][, 'yhat'],
  future_korea_export_price_index=result_korea_export_price_index_future[result_korea_export_price_index_future$ds >= '2018-11-01', ][, 'yhat'],
  future_unemployment=result_unemployment_future[result_unemployment_future$ds >= '2018-11-01', ][, 'yhat'],
  future__wti_price=result_wti_price_future[result_wti_price_future$ds >= '2018-11-01', ][, 'yhat']
)

tail(df_for_regression_01)
head(future_data_frame)

head(future_data_frame)
colnames(future_data_frame)<- colnames(df_for_regression_01)[-1]
head(future_data_frame)
future_data_frame

predict(multiple_lm_01, future_data_frame)
#망했다...

#s1 : 금리 3.25 wti 60
#s2 : 금리 3.75 wti 80
#s3 : 금리 4.5 wti 100
#s4 : 금리 2.5 wti 40

s1 <- future_data_frame
s2 <- future_data_frame
s3 <- future_data_frame
s4 <- future_data_frame

s1$us_interest_rate <- 3.25
s2$us_interest_rate <- 3.75
s3$us_interest_rate <- 4.25
s4$us_interest_rate <- 2.5

s1$wti_price <- 60
s2$wti_price <- 80
s3$wti_price <- 100
s4$wti_price <- 40

length(result_wti_price_future[result_wti_price_future$ds >= '2018-11-01', ]$ds)
result_wti_price_future[result_wti_price_future$ds >= '2018-11-01', ]$ds

newName <- result_wti_price_future[result_wti_price_future$ds >= '2018-11-01', ]$ds

s1_pre<- predict(multiple_lm_01, s1)

s2_pre <- predict(multiple_lm_01, s2)

s3_pre <- predict(multiple_lm_01, s3)

s4_pre <- predict(multiple_lm_01, s4)

s1_pre; s2_pre; s3_pre; s4_pre

plot(x= newName,y=s1_pre, type='l')
plot(x= newName,y=s2_pre, type='l')
plot(x= newName,y=s3_pre, type='l')
plot(x= newName,y=s4_pre, type='l')
