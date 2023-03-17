#### Preamble ####
# Purpose: Tests for simulated data
# Author: Justin Abando, Jin Di Liu, Marcin Jaczynski
# Data: 17 March 2023
# Contact: justin.abando@mail.utoronto.ca
# Pre-requisites: Requires data from 00-simulate_data.R to be loaded
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]
#### Preamble ####
# Purpose: Tests for simulated data
# Author: Justin Abando, Jin Di Liu, Marcin Jaczynski
# Data: 17 March 2023
# Contact: justin.abando@mail.utoronto.ca
# Pre-requisites: Requires data from 00-simulate_data.R to be loaded
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)

#### Test data ####

simulated_clean |> #Test to see if there are only 3496 observations
  count()

head(simulated_clean) #Test to see the first observations
tail(simulated_clean) #Test to see the final observations

#HAPPY tests

simulated_clean$random_happiness |> #Testing if happiness is defined as a character (qualitative)
  class()

simulated_clean$random_happiness |> #Testing if there is only 3 possible responses to the question
  unique()

#HAPMAR tests

simulated_clean$random_hapmar |> #Testing if hapmar is defined as a character (qualitative)
  class()

simulated_clean$random_hapmar |> #Testing if there is only 3 possible responses to the question
  unique()

#HEALTH tests

simulated_clean$random_health |> #Testing if health is defined as a character (qualitative)
  class()

simulated_clean$random_health |> #Testing if there is only 3 possible responses to the question
  unique()

#FINALTERS tests

simulated_clean$random_finalters |> #Testing if finalters is defined as a character (qualitative)
  class()

simulated_clean$random_finalters |> #Testing if there is only 3 possible responses to the question
  unique()

#SATFIN tests

simulated_clean$random_satfins |> #Testing if satfin is defined as a character (qualitative)
  class()

simulated_clean$random_satfins |> #Testing if there is only 3 possible responses to the question
  unique()

#INCOME16 tests

simulated_clean$new_income_range |> #Testing if income range is defined as a character (qualitative)
  class()

simulated_clean$new_income_range |> #Test to see if there are 6 unique income ranges from 0 to 170 000 plus others
  unique()