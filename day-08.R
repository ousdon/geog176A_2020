---
author: "Xingxin Li"
date:"2020-08-16"
exercise: "No.8"
output:html_document
---

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
read_csv(url)


library(dplyr)
library(ggplot2)
library(tidyr)
library(zoo)

covid<-read.csv(url)
head(covid)

state.of.interest ="California"
covid$date = as.Date (covid$date)

covid %>%
  filter(state == state.of.interest) %>%
  group_by(date) %>%
  summarise(cases = sum(cases)) %>%
  mutate(newCases = cases - lag(cases),
         roll7 = rollmean(newCases, 7, fill = NA, align="right")) %>%
  ungroup() %>%
  ggplot(aes(x = date)) +
  geom_col(aes(y = newCases), col = NA, fill = "#F5B8B5") +
  geom_line(aes(y = roll7), col = "darkred", size = 1) +
  labs(x = "Date", y = "Daily New Cases",
       title = paste("New Reported Cases by Day in", state.of.interest)) +
  theme(plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 14, face = 'bold')) +
  theme(aspect.ratio = .5)
