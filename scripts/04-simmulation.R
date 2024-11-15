#### Preamble ####
# Purpose: Simulates data for Hate Crimes analysis
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

tea_summary <- read_csv("~/grocery_new/data/02-analysis_data/tea_summary.csv")
product_names <- unique(tea_summary$product_name)
vendors <- unique(tea_summary$vendor)
brands <- unique(tea_summary$brand[!is.na(tea_summary$brand)])

# Simulating the data
simulated_data <- tibble(
  vendor = sample(vendors, size = n, replace = TRUE),  # Random vendors
  product_name = sample(product_names, size = n, replace = TRUE),  # Random product names from the list
  brand = sample(brands, size = n, replace = TRUE),  # Random brand from the list
  min_price = runif(n, min = 1, max = 20),  # Random prices between 1 and 20
  max_price = min_price + runif(n, min = 0, max = 10),  # Ensure max_price is at least min_price
  stock = sample(100:500, size = n, replace = TRUE)  # Random stock count
)

# View the simulated data
head(simulated_data)

write_csv(simulated_data, file = "data/simmulated_data/simulated.csv")
