library(tidyverse)

superuser <- read_csv("data/dados superuser.csv") %>% 
  mutate(site = "superuser")

stackoverflow <- read_csv("data/dados stackoverflow.csv") %>% 
  mutate(site = "stackoverflow")

data <- rbind(stackoverflow, superuser)

write_csv(data, "superuser-stackoverflow.csv")
