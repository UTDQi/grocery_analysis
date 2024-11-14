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

# Define unique product names, vendors, and other attributes based on the sample
product_names <- c("TRADITION JASMINE GREEN TEA", "HAPPY CLOVER SWISS ROLL CAKE GREEN TEA 200G", 
                   "Dmdq Green Tea (250g)", "LOTTE CHOCOPIE GREEN TEA 336G", 
                   "GOLDEN BONBON GREEN TEA NOUGAT 454G", "EVERGREEN BUBBLE MILK TEA GREEN TEA 480ML", 
                   "CHORIPDONG ROASTED GRAIN POWDER WITH GREEN TEA 1KG", "HIME GREEN TEA NOODLE 640G", 
                   "AOI CHA SOBA DRIED BUCKWHEAT GREENTEA NOODLE 240G", "AOI SOMEN DRIED THIN GREENTEA NOODLE 240G")

vendors <- c("TandT", "Galleria")

# Simulating the data
simulated_data <- tibble(
  vendor = sample(vendors, size = n, replace = TRUE),  # Random vendors
  product_name = sample(product_names, size = n, replace = TRUE),  # Random product names from the list
  units = sample(c("EA", "BX", "KG", "G"), size = n, replace = TRUE),  # Random unit types
  current_price = runif(n, min = 1, max = 20),  # Random prices between 1 and 20
  previous_price = runif(n, min = 1, max = 20),  # Random previous prices between 1 and 20
  price_difference = runif(n, min = 1, max = 10),  # Random price differences
  stock = sample(100:500, size = n, replace = TRUE)  # Random stock count
)

# View the simulated data
head(simulated_data)

write_csv(simulated_data, file = "data/simmulated_data/simulated.csv")
