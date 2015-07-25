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

The script reads data files, merges them, does some manipulation on data column names and finally summarizes selected variables by activites and test subject and writes the results to a file in the R working directory.

Additional comments can be found in the script file.




