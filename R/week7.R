#R Studio API Code
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


#Libraries
library(psych)
library(tidyverse)
library(GGally)

#Data Import and Cleaning
week7_tbl <- as_tibble(read_csv("../Data/week3.csv")) %>%
  mutate_at(vars(timeStart), as.POSIXct) %>%
  mutate(condition=factor(condition, levels=c("A", "B", "C"), labels = c("Block A", "Block B", "Control"))) %>% 
  mutate(gender=factor(gender, levels=c("M", "F"), labels=c("Male", "Female"))) %>%
  filter(q6==1) %>% 
  select(!q6)


#Visualization
ggpairs(week7_tbl[5:13])
ggplot(week7_tbl, aes(timeStart, q1)) + 
  geom_point() +
  labs(x="Date of Experiment", y="Q1 Score")

ggplot(week7_tbl, aes(q1, q2,col=gender))+
  geom_jitter()
ggplot(week7_tbl, aes(q1, q2)) + 
  geom_jitter()+
  facet_grid(.~gender)+
  labs(x="Score on Q1", y="Score on Q2")