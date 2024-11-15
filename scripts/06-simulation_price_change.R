#### Preamble ####
# Purpose: Simulates price_change data
# Author: Group 15
# Date: 14 November 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

# Set the seed for reproducibility
set.seed(1009201917)

# Number of records to simulate
n <- 100

price_change <- read_csv("~/grocery_new/data/02-analysis_data/price_change_lemon_ginseng.csv")
product_names <- unique(price_change$product_name)
vendors <- unique(price_change$vendor)

# Simulating the data
simulated_price_change <- tibble(
  vendor = sample(vendors, size = n, replace = TRUE),
  # Random vendors
  product_name = sample(product_names, size = n, replace = TRUE),
  # Random product names from the list
  brand = "Lipton",
  # Fixed brand name
  current_price = runif(n, min = 6, max = 11),
  # Random prices between 6 and 11
  old_price = current_price + runif(n, min = 0, max = 2),
  # Ensure old_price is at least current_price
  unit = "72"  # Fixed unit size
)

# View the simulated data
head(simulated_price_change)

write_csv(simulated_price_change, file = "data/00-simulated_data/simulated_price_change.csv")
