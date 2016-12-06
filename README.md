# Getting and Cleaning Data Course Project

In this project, there is a script developed in [R Language](https://en.wikipedia.org/wiki/R_(programming_language)), to clean and tidy up the data obtained in the project [Human activity recognition using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The `run_analysis.R` follows the steps below:

1. Get and prepare the data
2. Merges the training and the test sets to create one data set
3. Extracts only the measurements on the mean and standard deviation for each measurement
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
7. Finally, it creates the file `tidy.csv`

## Project parts

+ [CodeBook.md](./CodeBook.md) - File with the indicative for all the dimension, measures, units, and relevant information.
+ [run_analysis.R](./run_analysis.R) - The R Language Script, with all commands and comments.
+ [tidy.csv](./tidy.csv) - The tidy data themselve.