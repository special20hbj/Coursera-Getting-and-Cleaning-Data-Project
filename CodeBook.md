Getting and Cleaning Data Course Project CodeBook
========
This file describes the variables, the data, and any transformations or work that performed to clean up the data.<br>

* The data was obtained with a full description in the website:<br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<br>
* The data for the project:<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br>
* The script `run_analysis.R` performs the 5 steps described in the course project's definition to clean the data:<br>
1. Use *read.table()* function to read all the files from the "train" folder and the "test" folder respectively. By inspecting the size of the data that have been read, the similar data with the same number of columns and referring to the same entities is merged using *rbind()* function to create new data sets, the result of which is a 10299x561 data frame with feature content called `Data_x`, a 10299x1 data frame with subject IDs called `Data_activity`, and a 10299x1 data frame with activity IDs called `Data_subject`.<br>
2. Read the `features.txt` file, only those columns with the mean and standard deviation measures are taken from the whole dataset using *grep()* function, the results of which is a 66 indices list. Then, We extract these columns from the data frame `Data_x` to generate a 10299x66 subset, and give the correct column names taken from the `features.txt` file.<br>
3. Read the `activity_labels.txt` file, 
