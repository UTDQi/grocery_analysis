#### Preamble ####
# Purpose: Downloads and saves the data
# Author: Group15
# Date: 14 October 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT


# Load necessary libraries
library(testthat)
library(tidyverse)

# Read the simulated data
simulated_data <- read_csv("data/simmulated_data/simulated.csv")

#### Test for correct structure ####

# Test 1: Check if the data contains the expected columns
test_that("Simulated data has the expected columns", {
  expected_columns <- c("vendor", "product_name", "units", "current_price", "previous_price", "price_difference", "stock")
  
  # Check if all expected columns are present
  expect_true(all(expected_columns %in% colnames(simulated_data)), 
              info = "Some expected columns are missing from the data")
})

#### Test for missing data ####

# Test 2: Check for missing values in important columns like 'current_price' and 'product_name'
test_that("Data contains no missing values", {
  expect_equal(sum(is.na(simulated_data$current_price)), 0, info = "There are missing values in current_price")
  expect_equal(sum(is.na(simulated_data$product_name)), 0, info = "There are missing values in product_name")
})

#### Test for numeric prices ####

# Test 3: Ensure that 'current_price' and 'previous_price' are numeric
test_that("Prices are numeric", {
  expect_true(is.numeric(simulated_data$current_price), info = "current_price is not numeric")
  expect_true(is.numeric(simulated_data$previous_price), info = "previous_price is not numeric")
})

