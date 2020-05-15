# Load necessary packages
library(sbtools)

# Function to fetch data
fetch_data <- function(output_path) {
  # define file object
  mendota_file <- output_path
  # fetch data and overwrite file
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  # return file
  return(mendota_file)
}
