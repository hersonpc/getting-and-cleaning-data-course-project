###################################################################################
###################################################################################
###################################################################################
###
### Title..: Getting and Cleaning Data Course Project
### Author.: Herson Melo - hersonpc@gmail.com
### Date...: 4 Dec 2016
###
###################################################################################
###################################################################################
###################################################################################


###################################################################################
#
# Steps Overview
# --------------
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with
#    the average of each variable for each activity and each subject.
#
###################################################################################


###################################################################################
### Preparing the enviroment
###################################################################################

is.installed <- function(package_name){
    is.element(package_name, installed.packages()[,1])
}

if (!is.installed("dplyr")) {
    install.packages("dplyr")
}
library(dplyr)

if (!is.installed("data.table")) {
    install.packages("data.table")
}
library(data.table)


###################################################################################
### Downloading and extracting files
###################################################################################

dataFolder <- "UCI HAR Dataset"

prepare.dataset <- function() {
    
    filename <- "UCI_Dataset.zip"
    
    if(!file.exists(dataFolder)) {
        # if don't exist zip file... download it...
        if (!file.exists(filename)) {
            url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            if(Sys.info()["sysname"][[1]] == "Windows") {
                download.file(url, filename)
            } else {
                download.file(url, filename, method = "curl")
            }
        }
        # if do exist zip file... extract it or die...
        if(!file.exists(filename)) {
            stop("UCI Dataset not found and cannot be downloaded!")
        } else {
            # check if files are extracted...
            if(!file.exists(dataFolder)) {
                unzip(filename)
            }
        }
    }
    
}
prepare.dataset()


###################################################################################
### 1. Merges the training and the test sets to create one data set.
###################################################################################

## Loading data...
train.x <- tbl_df( read.table(file.path(dataFolder, "train/X_train.txt"), header = FALSE) )
train.y <- tbl_df( read.table(file.path(dataFolder, "train/y_train.txt"), header = FALSE) )
train.s <- tbl_df( read.table(file.path(dataFolder, "train/subject_train.txt"), header = FALSE) )

test.x <- tbl_df( read.table(file.path(dataFolder, "test/X_test.txt"), header = FALSE) )
test.y <- tbl_df( read.table(file.path(dataFolder, "test/y_test.txt"), header = FALSE) )
test.s <- tbl_df( read.table(file.path(dataFolder, "test/subject_test.txt"), header = FALSE) )

## joing data...
data.x <- rbind(train.x, test.x)
data.y <- rbind(train.y, test.y)
data.s <- rbind(train.s, test.s)


###################################################################################
### 2. Extracts only the measurements on the mean and standard deviation for each 
###    measurement.
###################################################################################

features <- tbl_df( read.table(file.path(dataFolder, "features.txt"), header = FALSE) )
names(features) <- c("id", "feature")

# set column filter
meanOrStd <- grep("(mean|std)\\(\\)", features$feature)

# apply column filter
data.x <- data.x[, meanOrStd]


###################################################################################
### 3. Uses descriptive activity names to name the activities in the data set
###################################################################################

activity_labels <- tbl_df( read.table(file.path(dataFolder, "activity_labels.txt"), header = FALSE) )
names(activity_labels) <- c("id", "type")

data.y$activity <- sapply(data.y[, 1], function(x) { as.character( activity_labels[x, ]$type ) })
data.y$activity <- factor(data.y$activity)

###################################################################################
### 4. Appropriately labels the data set with descriptive variable names.
###################################################################################

# set features labels
names(data.x) <- features[meanOrStd, ]$feature

# set activity labels
names(data.y) <- c("activity_id", "activity")

# set subject label
names(data.s) <- "subject_id"

###################################################################################
### 5. From the data set in step 4, creates a second, independent tidy data set 
###    with the average of each variable for each activity and each subject.
###################################################################################

data.all <- cbind(data.y, data.s, data.x)

data.tidy <- aggregate(data.all[, -(1:3)], list(activity = data.all$activity, subject = data.all$subject_id), mean)

#standardizeCols <- function(currentColName) {
#    newColName <- currentColName
#    
#    newColName <- gsub("-", "_", newColName)
#    #newColName <- gsub("\\(\\)", "", newColName)
#    newColName <- gsub("^t", "time", newColName)
#    newColName <- gsub("^f", "freq", newColName)
#    
#    return(newColName)
#}
#
#names(data.tidy) <- sapply(names(data.tidy), standardizeCols)


# Output...
write.table(data.tidy, file = "tidy.txt", fileEncoding = "UTF-8", row.names = FALSE)




