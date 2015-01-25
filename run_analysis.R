# Read mapping between activity_id and activity_name into R
activity_labels <- read.table(file = "./UCI HAR Dataset/activity_labels.txt",header = FALSE,col.names = c("activity_id","activity_name"))

# Read list of all features in the training and test datasets into R
features <- read.table(file = "./UCI HAR Dataset/features.txt",header = FALSE,col.names = c("feature_id","feature_name"))

# Read the training dataset into R
Xtrain <- read.table(file="./UCI HAR Dataset//train/X_train.txt",header = FALSE,col.names = features$feature_name)

# Read the training labels into R
Ytrain <- read.table(file="./UCI HAR Dataset//train/y_train.txt",header = FALSE,col.names = "activity_id")

# Read the training subject id info into R
Subject_train <- read.table(file="./UCI HAR Dataset//train/subject_train.txt",header = FALSE,col.names = "subject_id")

# Read the test dataset into R
Xtest <- read.table(file="./UCI HAR Dataset//test//X_test.txt",header = FALSE,col.names = features$feature_name)

# Read the test labels into R
Ytest <- read.table(file="./UCI HAR Dataset//test//y_test.txt",header = FALSE,col.names = "activity_id")

# Read the test subject id info into R
Subject_test <- read.table(file="./UCI HAR Dataset//test//subject_test.txt",header = FALSE,col.names = "subject_id")

# Combine Subject_train, Ytrain and Xtrain by column
Training_dataset <- cbind(Subject_train,Ytrain,Xtrain)

# Combine Subject_test, Ytest and Xtest by column
Test_dataset <- cbind(Subject_test,Ytest,Xtest)

# Combine the training and test datasets (Step 1 of assignment instructions)
Complete_dataset <- rbind(Training_dataset,Test_dataset)

# Extract a subset from the Complete_dataset to include only the measurements on the mean and standard deviation for each measurement (Step 2)
# This is done using grepl on the column names in the Complete_dataset
Mean_StdDev_dataset <- Complete_dataset[,grepl("mean..|std..",names(Complete_dataset))]

# Add back the columns for subject_id and activity_id as the initial columns of Mean_StdDev_dataset
Mean_StdDev_dataset <- cbind(Complete_dataset[,c(1,2)],Mean_StdDev_dataset)

# Merge Mean_StdDev_dataset with the activity_labels dataset so that Mean_StdDev_dataset also includes the activity_names for each record (Step 3)
Mean_StdDev_dataset <- merge(Mean_StdDev_dataset,activity_labels,by.x="activity_id",by.y="activity_id",all=FALSE)

# Assign descriptive names to the columns in Mean_StdDev_dataset (Step 4)
names(Mean_StdDev_dataset)[3] <- "Mean body acceleration along X axis"
names(Mean_StdDev_dataset)[4] <- "Mean body acceleration along Y axis"
names(Mean_StdDev_dataset)[5] <- "Mean body acceleration along Z axis"
names(Mean_StdDev_dataset)[6] <- "Standard deviation of body acceleration along X axis"
names(Mean_StdDev_dataset)[7] <- "Standard deviation of body acceleration along Y axis"
names(Mean_StdDev_dataset)[8] <- "Standard deviation of body acceleration along Z axis"
names(Mean_StdDev_dataset)[9] <- "Mean gravity acceleration along X axis"
names(Mean_StdDev_dataset)[10] <- "Mean gravity acceleration along Y axis"
names(Mean_StdDev_dataset)[11] <- "Mean gravity acceleration along Z axis"
names(Mean_StdDev_dataset)[12] <- "Standard deviation of gravity acceleration along X axis"
names(Mean_StdDev_dataset)[13] <- "Standard deviation of gravity acceleration along Y axis"
names(Mean_StdDev_dataset)[14] <- "Standard deviation of gravity acceleration along Z axis"
names(Mean_StdDev_dataset)[15] <- "Mean body acceleration jerk along X axis"
names(Mean_StdDev_dataset)[16] <- "Mean body acceleration jerk along Y axis"
names(Mean_StdDev_dataset)[17] <- "Mean body acceleration jerk along Z axis"
names(Mean_StdDev_dataset)[18] <- "Standard deviation of body acceleration jerk along X axis"
names(Mean_StdDev_dataset)[19] <- "Standard deviation of body acceleration jerk along Y axis"
names(Mean_StdDev_dataset)[20] <- "Standard deviation of body acceleration jerk along Z axis"
names(Mean_StdDev_dataset)[21] <- "Mean body angular velocity along X axis"
names(Mean_StdDev_dataset)[22] <- "Mean body angular velocity along Y axis"
names(Mean_StdDev_dataset)[23] <- "Mean body angular velocity along Z axis"
names(Mean_StdDev_dataset)[24] <- "Standard deviation of angular velocity along X axis"
names(Mean_StdDev_dataset)[25] <- "Standard deviation of angular velocity along Y axis"
names(Mean_StdDev_dataset)[26] <- "Standard deviation of angular velocity along Z axis"
names(Mean_StdDev_dataset)[27] <- "Mean angular jerk along X axis"
names(Mean_StdDev_dataset)[28] <- "Mean angular jerk along Y axis"
names(Mean_StdDev_dataset)[29] <- "Mean angular jerk along Z axis"
names(Mean_StdDev_dataset)[30] <- "Standard deviation of angular jerk along X axis"
names(Mean_StdDev_dataset)[31] <- "Standard deviation of angular jerk along Y axis"
names(Mean_StdDev_dataset)[32] <- "Standard deviation of angular jerk along Z axis"
names(Mean_StdDev_dataset)[33] <- "Mean of magnitude of body acceleration"
names(Mean_StdDev_dataset)[34] <- "Standard deviation of magnitude of body acceleration"
names(Mean_StdDev_dataset)[35] <- "Mean of magnitude of gravity acceleration"
names(Mean_StdDev_dataset)[36] <- "Standard deviation of magnitude of gravity acceleration"
names(Mean_StdDev_dataset)[37] <- "Mean of magnitude of body acceleration jerk"
names(Mean_StdDev_dataset)[38] <- "Standard deviation of magnitude of body acceleration jerk"
names(Mean_StdDev_dataset)[39] <- "Mean of magnitude of body angular velocity"
names(Mean_StdDev_dataset)[40] <- "Standard deviation of magnitude of body angular velocity"
names(Mean_StdDev_dataset)[41] <- "Mean of magnitude of angular jerk"
names(Mean_StdDev_dataset)[42] <- "Standard deviation of magnitude of angular jerk"
names(Mean_StdDev_dataset)[43] <- "Mean body acceleration along X axis in frequency domain"
names(Mean_StdDev_dataset)[44] <- "Mean body acceleration along Y axis in frequency domain"
names(Mean_StdDev_dataset)[45] <- "Mean body acceleration along Z axis in frequency domain"
names(Mean_StdDev_dataset)[46] <- "Standard deviation of body acceleration along X axis in frequency domain"
names(Mean_StdDev_dataset)[47] <- "Standard deviation of body acceleration along Y axis in frequency domain"
names(Mean_StdDev_dataset)[48] <- "Standard deviation of body acceleration along Z axis in frequency domain"
names(Mean_StdDev_dataset)[49] <- "Weighted average of frequency components of body acceleration along X axis in frequency domain"
names(Mean_StdDev_dataset)[50] <- "Weighted average of frequency components of body acceleration along Y axis in frequency domain"
names(Mean_StdDev_dataset)[51] <- "Weighted average of frequency components of body acceleration along Z axis in frequency domain"
names(Mean_StdDev_dataset)[52] <- "Average of body acceleration jerk frequency along X axis"
names(Mean_StdDev_dataset)[53] <- "Average of body acceleration jerk frequency along Y axis"
names(Mean_StdDev_dataset)[54] <- "Average of body acceleration jerk frequency along Z axis"
names(Mean_StdDev_dataset)[55] <- "Standard deviation of body acceleration jerk frequency along X axis"
names(Mean_StdDev_dataset)[56] <- "Standard deviation of body acceleration jerk frequency along Y axis"
names(Mean_StdDev_dataset)[57] <- "Standard deviation of body acceleration jerk frequency along Z axis"
names(Mean_StdDev_dataset)[58] <- "Weighted average of body acceleration jerk frequency along X axis"
names(Mean_StdDev_dataset)[59] <- "Weighted average of body acceleration jerk frequency along Y axis"
names(Mean_StdDev_dataset)[60] <- "Weighted average of body acceleration jerk frequency along Z axis"
names(Mean_StdDev_dataset)[61] <- "Mean of body angular velocity along X axis in frequency domain"
names(Mean_StdDev_dataset)[62] <- "Mean of body angular velocity along Y axis in frequency domain"
names(Mean_StdDev_dataset)[63] <- "Mean of body angular velocity along Z axis in frequency domain"
names(Mean_StdDev_dataset)[64] <- "Standard deviation of body angular velocity along X axis in frequency domain"
names(Mean_StdDev_dataset)[65] <- "Standard deviation of body angular velocity along Y axis in frequency domain"
names(Mean_StdDev_dataset)[66] <- "Standard deviation of body angular velocity along Z axis in frequency domain"
names(Mean_StdDev_dataset)[67] <- "Weighted average of body angular velocity frequency along X axis"
names(Mean_StdDev_dataset)[68] <- "Weighted average of body angular velocity frequency along Y axis"
names(Mean_StdDev_dataset)[69] <- "Weighted average of body angular velocity frequency along Z axis"
names(Mean_StdDev_dataset)[70] <- "Mean of magnitude of body acceleration in frequency domain"
names(Mean_StdDev_dataset)[71] <- "Standard deviation of magnitude of body acceleration in frequency domain"
names(Mean_StdDev_dataset)[72] <- "Weighted average of magnitude of body acceleration in frequency domain"
names(Mean_StdDev_dataset)[73] <- "Mean of frequency of body acceleration jerk magnitude"
names(Mean_StdDev_dataset)[74] <- "Standard deviation of frequency of body acceleration jerk magnitude"
names(Mean_StdDev_dataset)[75] <- "Weighted average of frequency of body acceleration jerk magnitude"
names(Mean_StdDev_dataset)[76] <- "Mean of frequency of body angular velocity magnitude"
names(Mean_StdDev_dataset)[77] <- "Standard deviation of frequency of body angular velocity magnitude"
names(Mean_StdDev_dataset)[78] <- "Weighted average of frequency of body angular velocity magnitude"
names(Mean_StdDev_dataset)[79] <- "Mean of frequency of body angular velocity jerk magnitude"
names(Mean_StdDev_dataset)[80] <- "Standard deviation of frequency of body angular velocity jerk magnitude"
names(Mean_StdDev_dataset)[81] <- "Weighted average of frequency of body angular velocity jerk magnitude"

# Use the tbl_df function from the dplyr package to convert the Mean_StdDev_dataset into a form that can be manipulated using dplyr aggregate functions 
library(dplyr)
tbl_mean_stddev_dataset <- tbl_df(data = Mean_StdDev_dataset)

# Use of descriptive names with spaces caused problems in summarise_each, so used gsub to replace spaces in all column names with underscores
names(tbl_mean_stddev_dataset) <- gsub(" ","_",names(tbl_mean_stddev_dataset),perl=TRUE)

# Group tbl_mean_stddev_dataset by subject and activity and calculate mean of all other columns in tbl_mean_stddev_dataset (Step 5)
summ <- tbl_mean_stddev_dataset %>% group_by(subject_id,activity_name) %>% summarise_each(funs(mean),Mean_body_acceleration_along_X_axis:Weighted_average_of_frequency_of_body_angular_velocity_jerk_magnitude)

# Create an output file with the summarised data created in Step 5
write.table(summ,file="summary_UCI_HAR.txt",col.names = TRUE,row.names = FALSE,sep = "\t")
