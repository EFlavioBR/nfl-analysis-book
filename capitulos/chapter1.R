#Carregando librarys 
library(nflfastR)
library(tidyverse)

#Carregando os dados de play - by - play para a temporada de 2021 
pbp_r <- load_pbp(2021)

#filtrando os dados no R para as jogadas de passe com jardas aéreas e calcule (aDOT)

pbp_r_p <-
  pbp_r |>
  filter(play_type== 'pass' & !is.na(air_yards))

pbp_r_p |>
  group_by(passer_id, passer) |> 
  summarize(n = n(), adot = mean(air_yards)) |> 
  filter(n >= 100 & !is.na(passer)) |> 
  arrange(-adot) |>
  print(n = Inf)
