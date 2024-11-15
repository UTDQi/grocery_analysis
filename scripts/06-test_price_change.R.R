#### Preamble ####
# Purpose: Tests price_change data
# Author: Group15
# Date: 14 October 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

# Load the simulated and analysis data
simulated_data2 <- read_csv("data/00-simulated_data/simulated_price_change.csv")
price_change_data <- read_csv("~/grocery_new/data/02-analysis_data/price_change_lemon_ginseng.csv")

#### Test simulated data ####

# 1. Check for missing values (NAs) in key columns
na_checks <- sapply(simulated_data2, function(x)
  sum(is.na(x)))
print("Number of NAs in each column:")
print(na_checks)

# 2. Check that 'vendor', 'product_name', 'brand' columns are character type
is_character <- sapply(simulated_data2[, c("vendor", "product_name", "brand")], is.character)
print("Are 'vendor', 'product_name', 'brand'character types:")
print(is_character)

# 3. Check that 'current_price', 'old_price', 'unit' columns are numeric type
is_numeric <- sapply(simulated_data2[, c("current_price", "old_price", "unit")], is.numeric)
print("Are 'current_price', 'old_price', 'unit'  numeric types:")
print(is_numeric)

# 4. Check for duplicate rows
duplicate_rows <- any(duplicated(simulated_data2))
print(paste("There are duplicate rows in the dataset:", duplicate_rows))

# 5. Check that 'current_price' is less than or equal to 'old_price' for all rows
current_less_equal_old <- all(simulated_data2$current_price <= simulated_data2$old_price)
print(
  paste(
    "All current_price values are less than or equal to old_price:",
    current_less_equal_old
  )
)

# 6. Ensure that vendor names are within expected list
expected_vendors <- unique(price_change_data$vendor)
valid_vendors <- all(simulated_data2$vendor %in% expected_vendors)
print(paste("All vendor names are valid:", valid_vendors))

# 7. Ensure that product names are within expected list
expected_pn <- unique(price_change_data$product_name)
valid_product_name <- all(simulated_data2$product_name %in% expected_pn)
print(paste("All product names are valid:", valid_product_name))

# 8. Ensure all brands are "Lipton"
expected_brand <- "Lipton"
valid_brand <- all(simulated_data2$brand == expected_brand)
print(paste("All brands are valid:", valid_brand))


#### Test price_change data ####

# 1. Check for missing values (NAs) in all columns except 'old_price'
na_checks <- sapply(price_change_data[, setdiff(names(price_change_data), "old_price")], function(x)
  sum(is.na(x)))
print("Number of NAs in each column except 'old_price':")
print(na_checks)

# 2. Check that 'vendor', 'product_name', 'brand', 'units' columns are character type
is_character <- sapply(price_change_data[, c("vendor", "product_name", "brand", "units")], is.character)
print("Are 'vendor', 'product_name', 'brand', 'units' character types:")
print(is_character)

# 3. Check that 'current_price', 'old_price' columns are numeric type
is_numeric <- sapply(price_change_data[, c("current_price", "old_price")], is.numeric)
print("Are 'current_price', 'old_price' numeric types:")
print(is_numeric)

# 4. Check for duplicate rows
duplicate_rows <- any(duplicated(price_change_data))
print(paste("There are duplicate rows in the dataset:", duplicate_rows))

# 5. Check that 'current_price' is less than or equal to 'old_price' for rows where 'old_price' is not NA
current_less_equal_old <- all(simulated_data2$current_price[!is.na(simulated_data2$old_price)] <=
                                simulated_data2$old_price[!is.na(simulated_data2$old_price)])

print(
  paste(
    "All current_price values are less than or equal to old_price where old_price is not NA:",
    current_less_equal_old
  )
)

# 6. Ensure that vendor names are within expected list
expected_vendors <- unique(price_change_data$vendor)
valid_vendors <- all(price_change_data$vendor %in% expected_vendors)
print(paste("All vendor names are valid:", valid_vendors))

# 7. Ensure that product names are within expected list
expected_pn <- unique(price_change_data$product_name)
valid_product_name <- all(price_change_data$product_name %in% expected_pn)
print(paste("All product names are valid:", valid_product_name))

# 8. Ensure all brands are "Lipton"
expected_brand <- "Lipton"
valid_brand <- all(price_change_data$brand == expected_brand)
print(paste("All brands are valid:", valid_brand))
