# Coursera-Getting-and-Cleaning-Data-Project
The repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.<br>

Introduction
---
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.<br>

* Review criteria<br>
  * The submitted data set is tidy.<br>
  * The Github repo contains the required scripts.<br>
  * GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.<br>
  * The README that explains the analysis files is clear and understandable.<br>
  * The work submitted for this project is the work of the student who submitted it.<br>

* Getting and Cleaning Data Course Project<br>
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.<br>
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:<br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<br>
Here are the data for the project:<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br>

* You should create one R script called run_analysis.R that does the following:<br>
  * Merges the training and the test sets to create one data set.<br>
  * Extracts only the measurements on the mean and standard deviation for each measurement.<br>
  * Uses descriptive activity names to name the activities in the data set.<br>
  * Appropriately labels the data set with descriptive variable names.<br>
  * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br>

Files
---
1. `run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be run in RStudio by just importing the file.<br>
2. `CodeBook.md` describes the data, the variables, and any transformations or work that was performed to clean up the data.<br>
3. `averages_data.txt` is the output of the 5th step in `run_analysis.R`, and uploaded in the course project's form.<br>
