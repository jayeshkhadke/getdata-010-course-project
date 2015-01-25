The r_analysis.R script logic 

1. Read the training dataset, test dataset and the activity, features and subject info files into R using read.table.
2. Use rbind to combine the training and test datasets into a single dataset.
3. Use grepl on the column names of the complete dataset to extract only columns for mean("mean..") and standard deviation("std..").
4. Use merge to combine the subset of data obtained in step 3 with the activity id-to-name mapping.
5. Assign descriptive names to the columns in the merged dataset.
6. Group the merged dataset by subject and activity using dplyr and calculate the average of the other columns. 
7. Create the output file as specified in the instructions.