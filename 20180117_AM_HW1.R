library(tidyverse)
library(weights)

#1 - Load the data
surv <- read.csv('https://mcmahanp.github.io/soci620/assignments/01/twizz_survey.csv')
post_grid <- read.csv('https://mcmahanp.github.io/soci620/assignments/01/twizz_posterior.csv')

#2a - Inspect the data in surv and calculate the sample size and absolute number of respondents who preferred Twizzlers.. 
glimpse(surv) #Observations: 500
summary(surv$pref_twiz) #False: 377, True: 123
#2b - Does the claim made in the study seem reasonable in light of the survey results?
123/500*100 #TRUE: 24.6%
377/500*100 #FALSE: 75.4%
#The claim does not seem to make sense given the data because:
#a) neither the proportion of FALSE or TRUE responses is 60%, and 
#b) the proportion of TRUE, which is the presumed "Twizzler preference", is the lower of the two figures.

#3 - Use the survey results calculated in the last step to construct a likelihood on the same grid provided in post_grid.
n_twizz <- sum(surv=='FALSE')
lik <- dbinom(n_twizz,size=500,prob=post_grid$grid)
cbind(post_grid$grid,lik)
