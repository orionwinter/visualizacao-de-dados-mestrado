library(dplyr)
# filtra município joão pessoa

censo.pb <- read.csv("data/basico-censo-pb.csv")
censo.joao.pessoa <- censo.pb %>% filter(Nome_do_municipio == "JOÃO PESSOA")

write.csv(x = censo.joao.pessoa, file = "data/basico-censo-joao-pessoa.csv")

domicilio <- read.csv("data/censo/Domicilio01_PB.csv", sep = ";", stringsAsFactors = F)
domicilio.genero <- domicilio %>% 
  mutate_at(
    c(64:70, 83:89),
    as.numeric
  ) %>% 
  mutate(
    lider_masculino = V062 + V063 + V064 + V065 + V066 + V067 + V068,
    lider_feminino = V081 + V082 + V083 + V084 + V085 + V086 + V087,
    porcentagem_lideres_femininos = lider_feminino / (lider_feminino + lider_masculino)
  )
