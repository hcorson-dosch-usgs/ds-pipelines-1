## Fetch Data 
#### Call function to fetch data
`prediction_data <- scmake('1_fetch/out/model_RMSEs.csv')`


## Process Data 
#### Call function to get model results
`model_results <- scmake('2_process/out/model_summary_results.csv')`


## Get Model Diagnostics
#### Call function to get diagnostic log file
`model_diagnostics <- get_diagnostic('2_process/out/model_summary_results.csv', '2_process/out/model_diagnostic_text.txt')`


## Visualize Data
#### Call function to visualize model results
`scmake('3_visualize/out/figure_1.png')`

