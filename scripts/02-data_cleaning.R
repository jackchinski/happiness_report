#### Preamble ####
# Purpose: Downloads and saves the data from GSS
# Author: Marcin Jaczynski 
# Data: 15 March 2023
# Contact: marcin.jaczynski@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Any other information needed? No 


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(ggplot2)
# [...UPDATE THIS...]

#### Import the data ####
GSS <- read_csv("GSS_csv_final.csv")


#### Clean the data ####
selected_data <- GSS %>% select(satfin, income16)


clean1 <- subset(selected_data, income16 != ".d:  Do not Know/Cannot Choose")
rm(selected_data)

clean2 <- subset(clean1, income16 != ".r:  Refused")
rm(clean1)

clean3 <- subset(clean2, income16 != ".s:  Skipped on Web")
rm(clean2)

clean4 <- subset(clean3, satfin != ".n: No answer")
rm(clean3)

clean5 <- subset(clean4, satfin != ".s: Skipped on Web")
rm(clean4)





clean5$new_income_range <- ifelse(clean5$income16 %in% c("UNDER $1 000", "$1 000 TO 2 999", "$3 000 TO 3 999", "$4 000 TO 4 999", "$5 000 TO 5 999", "$6 000 TO 6 999",
                                                         "$7 000 TO 7 999", "$8 000 TO 9 999"), "0 to 9 999",
                              ifelse(clean5$income16 %in% c("$10000 TO 12499", "$12500 TO 14999", "$15000 TO 17499", "$17500 TO 19999"), "10 000 to 19 999",
                                     ifelse(clean5$income16 %in% c("$20000 TO 22499", "$22500 TO 24999", "$25000 TO 29999", "$30000 TO 34999", "$35000 TO 39999"), "20 000 to 39 999", 
                                            ifelse(clean5$income16 %in% c("$40000 TO 49999", "$50000 TO 59999", "$60000 TO 74999", "$75000 TO $89999"), "40 000 to 89 999", 
                                                   ifelse(clean5$income16 %in% c("$90000 TO $109999", "$110000 TO $129999", "$130000 TO $149999", "$150000 TO $169999", "$170000 OR OVER"), "90 000 to 170 000", "other")))))

#ifelse(clean3$income16 %in% c("$10000 TO 12499", "31000 to 40000"), "21000 to 40000", "other"))

#hex <- table(clean3)



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 
