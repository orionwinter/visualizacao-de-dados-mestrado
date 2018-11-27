library(dplyr)
# filtra município joão pessoa

censo.pb <- read.csv("data/basico-censo-pb.csv")
censo.joao.pessoa <- censo.pb %>% filter(Nome_do_municipio == "JOÃO PESSOA")

write.csv(x = censo.joao.pessoa, file = "data/basico-censo-joao-pessoa.csv")
