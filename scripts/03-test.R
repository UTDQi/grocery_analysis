#### Preamble ####
# Purpose: Downloads and saves the data
# Author: Group15
# Date: 14 October 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

# Load the simulated data
simulated_data <- read_csv("data/simmulated_data/simulated.csv")
tea_summary <- read_csv("~/grocery_new/data/02-analysis_data/tea_summary.csv")

#### Test data ####

# 1. Check for missing values (NAs) in key columns
na_checks <- sapply(simulated_data, function(x) sum(is.na(x)))
print("Number of NAs in each column:")
print(na_checks)

# 2. Check that 'vendor', 'product_name', and 'brand' columns are character type
is_character <- sapply(simulated_data[, c("vendor", "product_name", "brand")], is.character)
print("Are 'vendor', 'product_name', and 'brand' character types:")
print(is_character)

# 3. Check that 'min_price', 'max_price', and 'stock' columns are numeric type
is_numeric <- sapply(simulated_data[, c("min_price", "max_price", "stock")], is.numeric)
print("Are 'min_price', 'max_price', and 'stock' numeric types:")
print(is_numeric)

# 4. Check for duplicate rows
duplicate_rows <- any(duplicated(simulated_data))
print(paste("There are duplicate rows in the dataset:", duplicate_rows))

# 5. Check that 'min_price' is less than or equal to 'max_price' for all rows
min_less_equal_max <- all(simulated_data$min_price <= simulated_data$max_price)
print(paste("All min_price values are less than or equal to max_price:", min_less_equal_max))

# 6. Ensure that vendor names are within expected list
expected_vendors <- unique(tea_summary$vendor)
valid_vendors <- all(simulated_data$vendor %in% expected_vendors)
print(paste("All vendor names are valid:", valid_vendors))

# 7. Ensure that product names are within expected list
expected_pn <- unique(tea_summary$product_name)
valid_product_name <- all(simulated_data$product_name %in% expected_pn)
print(paste("All product names are valid:", valid_product_name))

# 6. Ensure that brand are within expected list
expected_brands <- unique(tea_summary$brand)
valid_brands <- all(simulated_data$brand %in% expected_brands)
print(paste("All brand names are valid:", valid_brands))