#### Preamble ####
# Purpose: Downloads and saves grocery data from https://jacobfilipp.com/hammer/
# Author: David Qi
# Date: 14 Nov 2024
# Contact: david.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####


#### Download data ####
url <- "https://jacobfilipp.com/hammerdata/hammer-3-compressed.zip"
download.file(url, destfile = "data/01-raw_data/raw_data.zip")
# This is a zip file, data needs to be manually unzipped.

