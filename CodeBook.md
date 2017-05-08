This document describes data and work performaned for this homework

-- ******* overall description ********
-- ************************************

-- This homework deals with Human Activity Recognition Using Smartphones. More details about this dataset
can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

-- The dataset has 561 variables (columns) and 10299 records (rows), which are separated to 
training (x.train) and testing (x.test).

-- There are 30 subjects (volunteers) and 6 activities (e.g. walking, standing) for these 10299 records

-- For this homework, only mean and standard deviation of those 561 measurements are extracted.
I used "grepl" function to select columns with names having "mean" or "std". 
This ends up with a total of 79 variables.

-- Two new columns are added. One is the subject number, and the other is the activity label

-- For the last step of this homework I used "aggregate" function to calculate mean of features based on subject/activity

-- ******* code details ******
-- *****************************

Lines 8-11: read (read.table) and merge (rbind) train and test data

Lines 14-16: extract features with "mean" & "std" in their names. grepl function is used, and "meanstd.grepl" is the column flag. "x.merge.extract" is the 79 columns with "mean" or "std"

Lines 19-27: clean columns names by removing special symbos e.g. "(,-)". Add column names (colnames) to extracted columns. 

Lines 30-34: read and merge y data, similar to x

Line 41: join activity lables and y data

Line 44: add activity labels to x.merge.extract as a new column

Lines 47-51: read in subject number and add it to x.merge.extract as a new column

Lines 54-55: move "Subject" and "ActivityLabel" columns to the first two columns

Lines 59-60: aggregate data by "Subject" and "ActivityLable"

Line 62: write the final data table to "aggregate_tidy.txt" 

