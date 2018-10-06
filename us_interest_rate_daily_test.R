test <- read.csv('./data/DFF.csv')

test$DATE <- as.Date(test$DATE, "%Y-%m-%d")

colnames(test) <- c('ds', 'y')


library(prophet)

colnames(test) <-c('ds', 'y')
head(test)
tail(test, 30)
m_test <- prophet(test, daily.seasonality =T)
m_test
m_test_future <- make_future_dataframe(m_test, periods = 1000)
m_test_future
resultinterest_rate_future <- predict(m_test, m_test_future)
tail(resultinterest_rate_future)

plot(m_test, resultinterest_rate_future)
