#### Preamble ####
# Purpose: Downloads and saves the data from GSS
# Author: Marcin Jaczynski 
# Data: 15 March 2023
# Contact: marcin.jaczynski@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Any other information needed? No 


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(ggplot2)
# [...UPDATE THIS...]

#### Import the data ####
GSS <- read_csv("inputs/data/GSS_csv_final.csv")


#### Clean the data ####
# These cleaning steps eradicates empty or uninterprable entries for satfin
# (financial satisfaction) and income16 (income adjusted for inflation in 2016)
# We chose between either removing uninterpreable entries or putting them in the
# middle, and we decided to remove them for clarity.

selected_data <- GSS %>% select(satfin, income16)


clean1 <- subset(selected_data, income16 != ".d:  Do not Know/Cannot Choose")
rm(selected_data)

clean2 <- subset(clean1, income16 != ".r:  Refused")
rm(clean1)

clean3 <- subset(clean2, income16 != ".s:  Skipped on Web")
rm(clean2)

clean4 <- subset(clean3, satfin != ".n:  No answer")
rm(clean3)

clean5 <- subset(clean4, satfin != ".s:  Skipped on Web")
rm(clean4)



clean5$new_income_range <- ifelse(clean5$income16 %in% c("UNDER $1 000", "$1 000 TO 2 999", "$3 000 TO 3 999", "$4 000 TO 4 999", "$5 000 TO 5 999", "$6 000 TO 6 999",
                                                         "$7 000 TO 7 999", "$8 000 TO 9 999"), "0 to 9 999",
                              ifelse(clean5$income16 %in% c("$10000 TO 12499", "$12500 TO 14999", "$15000 TO 17499", "$17500 TO 19999"), "10 000 to 19 999",
                                     ifelse(clean5$income16 %in% c("$20000 TO 22499", "$22500 TO 24999", "$25000 TO 29999", "$30000 TO 34999", "$35000 TO 39999"), "20 000 to 39 999", 
                                            ifelse(clean5$income16 %in% c("$40000 TO 49999", "$50000 TO 59999", "$60000 TO 74999", "$75000 TO $89999"), "40 000 to 89 999", 
                                                   ifelse(clean5$income16 %in% c("$90000 TO $109999", "$110000 TO $129999", "$130000 TO $149999", "$150000 TO $169999", "$170000 OR OVER"), "90 000 to 170 000", "other")))))




##Ultimately, a master clean data is produced after adding all the groupings,
##We will now change this master clean data depending on what we need.
# These cleaning steps eradicates empty or uninterprable entries for satfin
# (financial satisfaction) and income16 (income adjusted for inflation in 2016)
# We chose between either removing uninterpreable entries or putting them in the
# middle, and we decided to remove them for clarity.

master_clean <- GSS %>% select(happy, hapmar, health, finalter, satfin, income16)

master_clean1 <- subset(master_clean, income16 != ".d:  Do not Know/Cannot Choose")
rm(master_clean)

master_clean2 <- subset(master_clean1, income16 != ".r:  Refused")
rm(master_clean1)

master_clean3 <- subset(master_clean2, income16 != ".s:  Skipped on Web")
rm(master_clean2)

master_clean4 <- subset(master_clean3, satfin != ".n:  No answer")
rm(master_clean3)

master_clean5 <- subset(master_clean4, satfin != ".s:  Skipped on Web")
rm(master_clean4)

# master_clean5 is essentially the same as clean5 but with all the other columns that it did not have and satfin and income cleaned
##master_clean5 groups all the cleaned incomes in 5 ranges: . This helps us better
##represent the data later in the analysis

master_clean5$new_income_range <- ifelse(master_clean5$income16 %in% c("UNDER $1 000", "$1 000 TO 2 999", "$3 000 TO 3 999", "$4 000 TO 4 999", "$5 000 TO 5 999", "$6 000 TO 6 999",
                                                         "$7 000 TO 7 999", "$8 000 TO 9 999"), "0 to 9 999",
                                  ifelse(master_clean5$income16 %in% c("$10000 TO 12499", "$12500 TO 14999", "$15000 TO 17499", "$17500 TO 19999"), "10 000 to 19 999",
                                         ifelse(master_clean5$income16 %in% c("$20000 TO 22499", "$22500 TO 24999", "$25000 TO 29999", "$30000 TO 34999", "$35000 TO 39999"), "20 000 to 39 999", 
                                                ifelse(master_clean5$income16 %in% c("$40000 TO 49999", "$50000 TO 59999", "$60000 TO 74999", "$75000 TO $89999"), "40 000 to 89 999", 
                                                       ifelse(master_clean5$income16 %in% c("$90000 TO $109999", "$110000 TO $129999", "$130000 TO $149999", "$150000 TO $169999", "$170000 OR OVER"), "90 000 to 170 000", "other")))))

# master_clean8 reduced the num of entires to 1745 from 3496. This will be
# used to represent data on married and interpretable respondents.
# the need to be married to answer this survey q explains the reduced entry size.
master_clean6 <- subset(master_clean5, hapmar != ".i:  Inapplicable")

master_clean7 <- subset(master_clean6, hapmar != ".n:  No answer")
rm(master_clean6)

master_clean8 <- subset(master_clean7, hapmar != ".s:  Skipped on Web")
rm(master_clean7)

# master_clean 9 will represent the change in financial situation of all respondents that did not
# skip the survey question on web and had interpret-able incomes/financial satisfaction. 
# we decided to make this subset from master_clean 5
# because it represents both married, unmarried, or skipped entries respondents.
master_clean9 <- subset(master_clean5, finalter != ".s:  Skipped on Web")

# master_clean 10 will represent the health of all respondents that did not
# skip the survey question on web. we decided to make this subset from master_clean 5
# because it represents both married and unmarried respondents.
master_clean10 <- subset(master_clean5, health != ".s:  Skipped on Web")

# master_clean 11 will represent the happiness of all respondents that did not
# skip the survey question on web. we decided to make this subset from master_clean 5
# because it represents both married, unmarried, or skipped entries respondents.
master_clean11 <- subset(master_clean5, happy != ".s:  Skipped on Web")

## Output all of our datasets in usable csvs.

write.csv(master_clean5, "outputs/data/master_cleaned.csv")
write.csv(master_clean8, "outputs/data/hapmar_cleaned.csv")
write.csv(master_clean9, "outputs/data/finalter_cleaned.csv")
write.csv(master_clean10, "outputs/data/health_cleaned.csv")
write.csv(master_clean11, "outputs/data/happy_cleaned.csv")



