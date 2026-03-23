library("tidyverse")
library("nflfastR")
library("ggthemes")

#especificando o intervalo dos dados
pbp_r <- load_pbp(2016:2022)
#filtrando os dados
pbp_r_p <- 
  pbp_r |> 
  filter(play_type == "pass" & !is.na(air_yards))
#limpeza dos dados
pbp_r_p <- 
  pbp_r_p |> 
  mutate(
    pass_lenght_air_yards =ifelse(air_yards >= 20, "long", "short"),
    passing_yards = ifelse(is.na(passing_yards), 0, passing_yards)
  )
#resumindo os dados
pbp_r_p |> 
  pull(passing_yards) |>
  summary()
#para passes longos

pbp_r_p |> 
  filter(pass_lenght_air_yards == "long") |> 
  pull(passing_yards) |> 
  summary()
#plotando 
ggplot(pbp_r, aes(x = passing_yards)) + 
  geom_histogram()
