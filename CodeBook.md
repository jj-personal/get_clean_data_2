This document describes data and work performaned for this homework

-- This homework deals with Human Activity Recognition Using Smartphones. More details about this dataset
can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

-- The dataset has 561 variables (columns) and 10299 records (rows), which are separated to 
training (x.train) and testing (x.test).

-- There are 30 subjects (volunteers) and 6 activities (e.g. walking, standing) for these 10299 records

-- For this homework, only mean and standard deviation of those 561 measurements are extracted.
I used "grepl" function to select columns with names having "mean" or "std". 
This ends up with a total of 79 variables.

-- Two new columns are added. One is the subject number, and the other is the activity label

-- For the last step of this homework I created a new factor which combine subject and activity. 
Then I used "aggregate" function to calculate mean of features based on subject/activity