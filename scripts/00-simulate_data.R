#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Data: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
#Recreate simulated master_clean5 as simulated_clean

#Create list of possible answers in random data (excluding nonresponse answers since they will be omitted in real data)
happinesses = c("Pretty Happy", "Not too Happy", "Very Happy")
healths = c("Poor", "Fair", "Good", "Excellent")
finalters = c("Worse", "Stayed the Same", "Better")
satfins = c("Not Satisfied at All", "More or less Satisfied", "Pretty well Satisfied")
income16s = c("UNDER $1 000", "$1 000 TO 2 999", "$3 000 TO 3 999", "$4 000 TO 4 999", "$5 000 TO 5 999", 
              "$6 000 TO 6 999","$7 000 TO 7 999", "$8 000 TO 9 999","$10000 TO 12499", "$12500 TO 14999", "$15000 TO 17499", "$17500 TO 19999", "$20000 TO 22499", "$22500 TO 24999", "$25000 TO 29999", "$30000 TO 34999", "$35000 TO 39999", "$40000 TO 49999", "$50000 TO 59999", "$60000 TO 74999", "$75000 TO $89999", "$90000 TO $109999", "$110000 TO $129999", "$130000 TO $149999", "$150000 TO $169999", "$170000 OR OVER")

#Create random probabilities of categorical answers for data
random_happiness = sample(happinesses, 3496, replace = TRUE, prob=c(0.33, 0.33, 0.34))
random_hapmar = random_happiness
random_health = sample(healths, 3496, replace = TRUE, prob=c(0.25, 0.25, 0.25, 0.25))
random_finalters = sample(finalters, 3496, replace = TRUE, prob=c(0.33, 0.33, 0.34))
random_satfins = sample(satfins, 3496, replace = TRUE, prob=c(0.33, 0.33, 0.34))
random_income16s = sample(income16s, 3496, replace = TRUE)

#Compose simulated data in a data frame with all variables.
simulated_clean <- data.frame(random_happiness, random_hapmar, random_health, random_finalters, random_satfins,
                              random_income16s)
#Clean simulated data to include new_income_range that will be used later
simulated_clean$new_income_range <- ifelse(simulated_clean$random_income16s %in% 
                                             c("UNDER $1 000", "$1 000 TO 2 999", "$3 000 TO 3 999", 
                                               "$4 000 TO 4 999", "$5 000 TO 5 999", "$6 000 TO 6 999",
                                               "$7 000 TO 7 999", "$8 000 TO 9 999"), "0 to 9 999",
                                           ifelse(simulated_clean$random_income16s %in% 
                                                    c("$10000 TO 12499", "$12500 TO 14999", "$15000 TO 17499",
                                                      "$17500 TO 19999"), "10 000 to 19 999",
                                                  ifelse(simulated_clean$random_income16s %in% 
                                                           c("$20000 TO 22499", "$22500 TO 24999", "$25000 TO 29999",
                                                             "$30000 TO 34999", "$35000 TO 39999"), 
                                                         "20 000 to 39 999", 
                                                         ifelse(simulated_clean$random_income16s %in% 
                                                                  c("$40000 TO 49999", "$50000 TO 59999", 
                                                                    "$60000 TO 74999", "$75000 TO $89999"), 
                                                                "40 000 to 89 999", 
                                                                ifelse(simulated_clean$random_income16s %in% 
                                                                         c("$90000 TO $109999", "$110000 TO 
                                                                            $129999", "$130000 TO $149999", 
                                                                           "$150000 TO $169999", "$170000 OR OVER"),
                                                                       "90 000 to 170 000", "other")))))

#Quick display of table
tibble(simulated_clean)

