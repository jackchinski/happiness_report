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
library(tibble)
# [...UPDATE THIS...]

#### Download data ####
GSS <- read_csv("GSS_csv_final.csv")





#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 
