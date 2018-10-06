# 다중선형회귀
head(df_for_regression)
df_for_regression$inflation
str(df_for_regression)
summary(df_for_regression)

colnames(df_for_regression)

multiple_lm <- lm(korea_interest_rate ~ . ,data=df_for_regression)
multiple_lm
summary(multiple_lm)

# make new data frame - remove korea_import_price_index
library(car)
head()
colnames(df_for_regression)
df_for_regression_01 <- df_for_regression[, -8]
colnames(df_for_regression_01)

multiple_lm_01 <- lm(korea_interest_rate~., data=df_for_regression_01)
summary(multiple_lm_01)

# 다중공선성 확인 -> vif 4가 넘으면 있는 걸로 판단
vif(multiple_lm_01) 
# select best model - 단계선택법

LM_step <- step(multiple_lm_01, direction = "both")
LM_step

# 다 쓰는게 최고좋은 모델
