# Load necessary packages
library(dplyr)
library(readr)
library(stringr)
library(sbtools)
library(whisker)

# Function to process data
process_data <- function(input_data, output_path) {
  # Add columns specifying color and point sizes
  eval_data <- input_data %>%
    filter(str_detect(exper_id, 'similar_[0-9]+')) %>%
    mutate(col = case_when(
      model_type == 'pb' ~ '#1b9e77',
      model_type == 'dl' ~'#d95f02',
      model_type == 'pgdl' ~ '#7570b3'
    ), pch = case_when(
      model_type == 'pb' ~ 21,
      model_type == 'dl' ~ 22,
      model_type == 'pgdl' ~ 23
    ), n_prof = as.numeric(str_extract(exper_id, '[0-9]+')))
  # write processed data to file
  readr::write_csv(eval_data, path = file.path(output_path, 'model_summary_results.csv'))
  # return processed data
  return(eval_data)
}


##### Process Data #####

# Set workspace parameters 
project_output_dir <- '2_process/out'

# Load input data
mendota_file <- readr::read_csv('1_fetch/out/model_RMSEs.csv', col_types = 'iccd')

# Call function to get model results
model_results <- process_data(mendota_file, project_output_dir)
