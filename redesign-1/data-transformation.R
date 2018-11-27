library(tidyverse)
library(lubridate)

bigmac.data <- read_csv("big-mac-raw-index.csv")
latest.bigmac.data <- bigmac.data %>% 
  filter(date >= ymd("2017-07-01"), date <= ymd("2018-01-01")) %>% 
  select(name, date, dollar_price, USD)

merged.bigmac <- latest.bigmac.data  %>% 
  filter(date == ymd("2017-07-01")) %>% 
  left_join(
    filter(latest.bigmac.data, date == ymd("2018-01-01")),
    by = c("name"))
merged.bigmac <- merged.bigmac %>% 
  select(name, USD.x, USD.y, dollar_price.y) %>% 
  rename(
    currency_valuation_2017 = USD.x,
    currency_valuation_2018 = USD.y,
    big_mac_price =dollar_price.y
  )

write_csv(merged.bigmac, "filtered-big-mac-index.csv")
