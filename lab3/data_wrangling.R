library(tidyverse)
# filtra município joão pessoa

censo.pb <- read_csv("data/basico-censo-pb.csv")
censo.joao.pessoa <- censo.pb %>% filter(Nome_do_municipio == "JOÃO PESSOA")

write_csv(x = censo.joao.pessoa, "data/basico-censo-joao-pessoa.csv")

domicilio <- read_csv2("data/censo/Domicilio01_PB.csv", na = "X")
domicilio.genero <- domicilio %>% 
  rowwise() %>% 
  mutate(
    lider_masculino = sum(V062, V063, V064, V065, V066, V067, V068, na.rm = TRUE),
    lider_feminino = sum(V081, V082, V083, V084, V085, V086, V087, na.rm = TRUE),
    porcentagem_lideres_femininos = (lider_feminino / (lider_feminino + lider_masculino)) * 100
  )

write_csv(select(domicilio.genero, Cod_setor, lider_masculino, lider_feminino, porcentagem_lideres_femininos),
          "data/domicilio_genero.csv")
