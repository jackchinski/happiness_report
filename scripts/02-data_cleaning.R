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

table(clean3)




#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 
