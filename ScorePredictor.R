library(dplyr)

serieA <- read.csv("I1.csv")

serieA %>% select(HomeTeam, AwayTeam, FTHG, FTAG)

homeData <- serieA %>% 
  select(HomeTeam, FTHG, FTAG) %>% 
  group_by(HomeTeam) %>% 
  summarise(nrGames = n(), homeGoalsFor = sum(FTHG), meanHomeGoalsFor = mean(FTHG), homeGoalAgainst = sum(FTAG), meanHomeGoalsAgainst = mean(FTAG))

awayData <- serieA %>% 
  select(AwayTeam, FTHG, FTAG) %>% 
  group_by(AwayTeam) %>% 
  summarise(nrGames = n(), awayGoalsFor = sum(FTAG), meanAwayGoalsFor = mean(FTAG), awayGoalAgainst = sum(FTHG), awayHomeGoalsAgainst = mean(FTHG))
