# Getting & Cleaning Data - Course Project #
This repository contains the R file for the course project of Getting and Cleaning Data course.
The file run_analysis.R contains a function that returns the data set as specified in the project description:
> a tidy data set with the average of each variable for each activity and each subject. 

Download the file run_analysis.R in your working directory. 
## Requirements ##
Before running the function contained in run_analysis.R file you need to download the following archive:
The code r https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After that uncompress the zip file in the R working directory. 
The function allows to specify the location of the source files.

## Execution ##
After the source files have been stored in the R working directory, to load and run the R code use the following instructions:

`source('run_analysis.R')`

`df <- getUCIHARTidyDataSet()`

You can also specify the root path where to find the source files:

`df <- getUCIHARTidyDataSet(fileDir="./path/to/files/")`

