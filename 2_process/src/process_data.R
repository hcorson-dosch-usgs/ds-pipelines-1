# Load necessary packages
library(dplyr)
library(stringr)

# Function to process data
process_data <- function(output_path, input_data) {
  # load data
  prediction_data <- readr::read_csv(input_data, col_types = 'iccd')
  
  # Add columns specifying color and point sizes
  eval_data <- prediction_data %>%
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
  readr::write_csv(eval_data, path = output_path)
  # return processed data
  return(eval_data)
}
