# Coursera-Getting-and-cleaning-data-Course-Project
This Repo contains the R script, the Codebook and the final dataset for the assignment of the Getting and Cleaning Data Course Project.
The file run_analysis.R does the following:

1)Merges the training and the test sets to create one data set. At first it downloads all the needed datasets and merges the data (X), the labels (y) and the subjects;

2)Extracts only the measurements on the mean and standard deviation for each measurement. I extract the names with mean (mean) and Standard deviations (std) and I rename with them the columns of the dataset;

3)Uses descriptive activity names to name the activities in the data set;

4)Appropriately labels the data set with descriptive variable names;

5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data set is called "tidy_dataset.txt".

The CodeBook.md describes the variables, the data, and any transformations.

The txt file "tidy_dataset.txt" represents the result of the script run_analysis.R.
