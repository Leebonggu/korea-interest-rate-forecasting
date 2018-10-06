# 1. korea interest rate
interest_rate <- read.csv('./data/korea_interest_rate.csv', header=F, stringsAsFactors = F)
class(interest_rate)
head(interest_rate)
str(interest_rate)
colnames(interest_rate) <- c('DATE', 'RATE')

date <- paste0(interest_rate$year,"/01")
date
interest_rate$year <- as.Date(date, "%Y/%m/%d")

# 2. us interest rate
interest_rate_us <- read.csv('./data/us_interest_rate.csv', stringsAsFactors = F)
interest_rate_us <-  interest_rate_us[-1,]
head(interest_rate_us)
str(interest_rate_us)
class(interest_rate_us)

interest_rate_us$DATE <- as.Date(interest_rate_us$DATE, "%Y-%m-%d")

# 3. korea Facility investment index
facility_investing <- read.csv('./data/korea_investing.csv', header=F, stringsAsFactors = F)
class(facility_investing)
head(facility_investing)
str(facility_investing)
colnames(facility_investing) <- c('DATE', 'INVESTMENT_INDEX')

date <- paste0(facility_investing$DATE,"/01")
date
facility_investing$DATE <- as.Date(date, "%Y/%m/%d")

# 4. korea cci index
cci_index <- read.csv('./data/korea_cci.csv', header=F, stringsAsFactors = F)
class(cci_index)
head(cci_index)
str(cci_index)
colnames(cci_index) <- c('DATE', 'CCI_INDEX')

date <- paste0(cci_index$DATE,"/01")
date
cci_index$DATE <- as.Date(date, "%Y/%m/%d")

# 5. unemploymenet
unemployment <- read.csv('./data/unemploymenet.csv', header=F, stringsAsFactors = F)
class(unemployment)
head(unemployment)
str(unemployment)
colnames(unemployment) <- c('DATE', 'UNEMPLOYMENT')

date <- paste0(unemployment$DATE,"/01")
date
unemployment$DATE <- as.Date(date, "%Y/%m/%d")

# 6. inflation
inflation <- read.csv('./data/inflation.csv', header=F, stringsAsFactors = F)
class(inflation)
head(inflation)
str(inflation)
colnames(inflation) <- c('DATE', 'INFLATION')

date <- paste0(inflation$DATE,"/01")
date
inflation$DATE <- as.Date(date, "%Y/%m/%d")

# 7. import pirce index
korea_import_price_index <- read.csv('./data/korea_import_price_index.csv', header=F, stringsAsFactors = F)
class(korea_import_price_index)
head(korea_import_price_index)
str(korea_import_price_index)
colnames(korea_import_price_index) <- c('DATE', 'IMPORT')

date <- paste0(korea_import_price_index$DATE,"/01")
date
korea_import_price_index$DATE <- as.Date(date, "%Y/%m/%d")

# 8. wti_price
wti_price <- read.csv('./data/wti_price.csv', header=F, stringsAsFactors = F)
class(wti_price)
head(wti_price)
str(wti_price)
colnames(wti_price) <- c('DATE', 'WTI_PRICE')

wti_price$DATE <- as.Date(wti_price$DATE, "%Y-%m-%d")

# 9. foreign_selling
foreign_selling <- read.csv('./data/foreign_selling.csv', header=F, stringsAsFactors = F)
class(foreign_selling)
head(foreign_selling)
str(foreign_selling)
colnames(foreign_selling) <- c('DATE', 'SELLING')

date <- paste0(foreign_selling$DATE,"/01")
date
foreign_selling$DATE <- as.Date(date, "%Y/%m/%d")
foreign_selling$SELLING <- as.numeric(gsub(",","",foreign_selling$SELLING))

# 10. korea_export_price_index
korea_export_price_index <- read.csv('./data/korea_export_price_index.csv', header=F, stringsAsFactors = F)
class(korea_export_price_index)
head(korea_export_price_index)
str(korea_export_price_index)
colnames(korea_export_price_index) <- c('DATE', 'EXPORT')

date <- paste0(korea_export_price_index$DATE,"/01")
date
korea_export_price_index$DATE <- as.Date(date, "%Y/%m/%d")


#2004년 1월1일 기준으로 데이터 통일
# cci
head(cci_index)
tail(cci_index)
cci_index[cci_index$DATE >= '2004-01-01',]
cci_index_2004 <- cci_index[cci_index$DATE >= '2004-01-01', ]

# facility_investing
head(facility_investing)
tail(facility_investing)
facility_investing_2004 <- facility_investing[facility_investing$DATE >= '2004-01-01',]

#foreign_selling

# inflation
head(inflation_2004)
tail(inflation_2004)

inflation_2004 <- inflation[inflation$DATE >= '2004-01-01',]
inflation_2004 <- inflation_2004[1:length(inflation_2004$DATE)-1, ]
inflation_2004

# interest_rate
head(interest_rate)
tail(interest_rate)

interest_rate_2004 <- interest_rate[interest_rate$DATE >= '2004-01-01', ]
head(interest_rate_2004)
tail(interest_rate_2004)

# interest_rate_us
head(interest_rate_us)
tail(interest_rate_us)

interest_rate_us_2004 <- interest_rate_us[interest_rate_us$DATE >= '2004-01-01', ]
interest_rate_us_2004


# korea_export_price_index
head(korea_export_price_index)
tail(korea_export_price_index)

korea_export_price_index_2004 <- korea_export_price_index[korea_export_price_index$DATE >= '2004-01-01', ]
tail(korea_export_price_index_2004)

# korea_import_price_index
head(korea_import_price_index)
tail(korea_import_price_index)

korea_import_price_index_2004 <- korea_import_price_index[korea_import_price_index$DATE >= '2004-01-01', ]
tail(korea_import_price_index_2004)

# unemployment
head(unemployment) ; tail(unemployment)
unemployment_2004 <- unemployment[unemployment$DATE >= '2004-01-01', ]
unemployment_2004

# wti_price
head(wti_price); tail(wti_price)
wti_price_2004 <- wti_price[wti_price$DATE >= '2004-01-01', ]
wti_price_2004 <- wti_price_2004[1:length(wti_price_2004$DATE)-1, ]

# make data frame
df_for_regression <- data.frame(interest_rate_2004$RATE, 
                                interest_rate_us_2004$FEDFUNDS, 
                                cci_index_2004$CCI_INDEX,
                                facility_investing_2004$INVESTMENT_INDEX,
                                foreign_selling$SELLING,
                                inflation_2004$INFLATION,
                                korea_export_price_index_2004$EXPORT,
                                korea_import_price_index_2004$IMPORT,
                                unemployment_2004$UNEMPLOYMENT,
                                wti_price_2004$WTI_PRICE
                                )

colnames(df_for_regression) <- c("korea_interest_rate",
                                 "us_interest_rate",
                                 "cci_index",
                                 "facility_investment",
                                 "foreign_selling",
                                 "inflation",
                                 "korea_export_price_index",
                                 "korea_import_price_index",
                                 "unemployment",
                                 "wti_price"
                                 )


data_list <- list(interest_rate=interest_rate, 
                  interest_rate_us=interest_rate_us,
                  cci_index=cci_index,
                  facility_investing=facility_investing,
                  foreign_selling=foreign_selling,
                  inflation=inflation,
                  korea_export_price_index=korea_export_price_index,
                  korea_import_price_index=korea_import_price_index,
                  unemployment=unemployment,
                  wti_price=wti_price
                  )

data_list_2004 <- list(interest_rate=interest_rate_2004, 
                  interest_rate_us=interest_rate_us_2004,
                  cci_index=cci_index_2004,
                  facility_investing=facility_investing_2004,
                  foreign_selling=foreign_selling,
                  inflation=inflation_2004,
                  korea_export_price_index=korea_export_price_index_2004,
                  korea_import_price_index=korea_import_price_index_2004,
                  unemployment=unemployment_2004,
                  wti_price=wti_price_2004
)
length(data_list)

tail(df_for_regression)


#df_for_regression$korea_interest_rate - df_for_regression$us_interest_rate
#plot(df_for_regression$korea_interest_rate - df_for_regression$us_interest_rate, type='l')
#mean(df_for_regression$korea_interest_rate - df_for_regression$us_interest_rate)
