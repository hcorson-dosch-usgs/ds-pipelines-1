# Load necessary packages
library(dplyr)
library(readr)
library(stringr)
library(sbtools)
library(whisker)

# Function to fetch data
fetch_data <- function(output_path) {
  # define file object
  mendota_file <- file.path(output_path, 'model_RMSEs.csv')
  # fetch data and overwrite file
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  # return file
  return(mendota_file)
}


##### Fetch Data #####

# Set workspace parameters
project_output_dir <- '1_fetch/out'

# Call function
data <- fetch_data(project_output_dir)
