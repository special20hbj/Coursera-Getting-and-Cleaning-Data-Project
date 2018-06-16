Getting and Cleaning Data Course Project CodeBook
========
This file describes the variables, the data, and any transformations or work that performed to clean up the data.<br>

Data
---
* The data was obtained with a full description in the website:<br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<br>
* The data for the project:<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br>
* The script `run_analysis.R` performs the 5 steps described in the course project's definition to clean the data:<br>
1. Use *read.table()* function to read all the files from the "train" folder and the "test" folder respectively. By inspecting the size of the data that have been read, the similar data with the same number of columns and referring to the same entities is merged using *rbind()* function to create new data sets, the result of which is a 10299x561 data frame with measures called `Data_x`, a 10299x1 data frame with subject IDs called `Data_activity`, and a 10299x1 data frame with activity IDs called `Data_subject`.<br>
2. Read the `features.txt` file, only those columns with the mean and standard deviation measures are taken from the whole dataset using *grep()* function, the results of which is a 66 indices list. Then, We extract these columns from the data frame `Data_x` to generate a 10299x66 subset, and give the correct column names taken from the `features.txt` file.<br>
3. Read the `activity_labels.txt` file, as activity data is addressed with values 1:6, we take the activity names and corresponding IDs from this file to substitute the activity names in the data frame `Data_activity`.<br>
4. Firstly, using *cbind()* function to combine the `Data_x`, `Data_activity` and `Data_subject` by column to get a new cleaned 10299x68 data frame, `mergedData`. Properly name the last columns, "activity" and "subject". Then, those columns with vague variable names in the whole data frame are corrected by descriptive ones using *gsub()* function. More specifically，we remove the "()" and "-" symbols in the variable names, as well as capitalize the first letter of "mean", "std", "activity" and "subject" respectively, we also change "t" to "Time" and "f" to "Freq" to make the variable name more descriptive.<br>
5. Finally, we find that the final `mergedData` data frame has 30 unique subjects and 6 unique activities. Then, we convert the data frame into a grouped subset using *group_by()* function in *dplyr* package by subjects and activities. For each combination of subject-activity pair, we calculate the average measures of each measurement with the corresponding combination using *summarise_each()* function, and generate a second independent tidy data set with the average of each measurement for each activity and each subject (30 subjects * 6 activities = 180 observations in total). The result file is called `average_data.txt`and written out in current directory.<br>

Variables
---
* `X_train`, `y_train`, `x_test`, `subject_train`, `X_test`, `y_test` and `subject_test` are the data from the downloaded files.<br>
* `Data_x`, `Data_activity` and `Data_subject` merge the previous datasets respectively.<br>
* `meanstd` contains the extracted measurements as required from the `features` file, `featuresNames` contains the correct names for the `Data_x` dataset, which are applied to the column names stored in `meanstd`.<br>
* `activity_labels` contains the correct names for the "activity" column in the `Data_x` dataset.
* `mergedData` merges `Data_x`, `Data_activity` and `Data_subject`.
* `groupedData` groups the `mergedData` by subjects and activities.
* `average_data` is the final dataset with The integers that range from 1 to 30 inclusive in "subject" column, 6 kinds of activity names in "activity" column, and the average measures of each measurements that range from -1 to 1 exclusive in the first 66 columns.
