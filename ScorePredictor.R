library(dplyr)

serieA <- read.csv("I1.csv")

serieA %>% select(HomeTeam, AwayTeam, FTHG, FTAG)

homeData <- serieA %>% 
  select(HomeTeam, FTHG, FTAG) %>% 
  group_by(HomeTeam) %>% 
  summarise(homeGoalsFor = sum(FTHG), meanHomeGoalsFor = mean(FTHG), homeGoalAgainst = sum(FTAG), meanHomeGoalsAgainst = mean(FTAG)) %>% 
  mutate(HAP = homeGoalsFor/mean(homeGoalsFor), HDP = homeGoalAgainst/mean(homeGoalAgainst)) %>% 
  rename(team = HomeTeam)

awayData <- serieA %>% 
  select(AwayTeam, FTHG, FTAG) %>% 
  group_by(AwayTeam) %>% 
  summarise(awayGoalsFor = sum(FTAG), meanAwayGoalsFor = mean(FTAG), awayGoalAgainst = sum(FTHG), meanAwayGoalsAgainst = mean(FTHG)) %>% 
  mutate(AAP = awayGoalsFor/mean(awayGoalsFor), ADP = awayGoalAgainst/mean(awayGoalAgainst)) %>% 
  rename(team = AwayTeam)

teamPower <- inner_join(homeData,awayData,by="team")




