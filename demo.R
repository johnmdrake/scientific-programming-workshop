# This is a demonstration script for using Github with R Studio.
# Created by John M. Drake (jdrake@uga.edu) on 16 May 2017

# Load libraries
library(tidyverse)
library(lubridate)

# Load MERS data
mers <- read_csv('cases.csv')

# Some data wrangling
mers$hospitalized[890] <- c('2015-02-20')
mers <- mers[-471,]
mers$onset2 <- ymd(mers$onset)
mers$hospitalized2 <- ymd(mers$hospitalized)
class(mers$onset2)
day0 <- min(na.omit(mers$onset2))
mers$epi.day <- as.numeric(mers$onset2 - day0)

# Make a plot
ggplot(data=mers) + 
  geom_bar(mapping=aes(x=epi.day)) +
  labs(x='Epidemic day', y='Case count', title='Global count of MERS cases by date of symptom onset',
       caption="Data from: https://github.com/rambaut/MERS-Cases/blob/gh-pages/data/cases.csv")