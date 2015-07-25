# Coursera Getting and Cleaning Data - Course Project

This repository is created to host the course project files for Getting and Cleaning Data course on Coursera.

# Files in this repository

`Readme.md` - this file

`Codebook.md` - Codebook describing variables that are used in datasets

`run_analysis.r` - R script file

`final.txt` - tidy data set created by the R script

# Data

Data used in this project was downloaded from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data should be extracted to the R working directory.

# Script

`run_analysis.r` R script file was written in RStudio. It requires the data to be in the R working directory without modifying file names.

The script reads data files, merges them, does some manipulation on data column names and finally summarizes selected variables by activites and test subjects and writes the results to a file in the R working directory.

Additional guidance can be found in the script file.

##Section 1

The script reads necessary data files (train and test data), merges them and modifies column names. The relation between data files is described in the `README.txt` file; after extracting downloaded compressed file.

##Section 2

The scripts selects only those columns that are measurements on mean and standard deviation. It looks for the 'mean' and 'std' strings to appear in column names and selects those columns from the dataset.

##Section 3

Activites performed by test subjects are indicated with codes. This value is updated in this section using the activity names linked to codes. This relation is described in `activity_labels.txt` file.

##Section 4

Variable names are modified to give a better description of the variables used.

##Section 5

Data is grouped by test subjects and activities and the average of every variable is calculated by every test subject and activity. The result is written to a file in the R working directory.
