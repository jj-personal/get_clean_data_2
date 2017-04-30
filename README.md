This readme explains how R script works

The first two parts read x.train and x.test fiels and combine using "rbind" "grepl" is used to find out columns with "mean" or "std" in their names

Feature names are added to extracted data.

Activity data (y.train and y.test) are then combined. Activity data are then merged with activity lables (e.g. walking, standing...) Activity labels are added as a new column to extracted data

Subject (subject.train and subject.test) are then combined and added as a new column

Activity and subject columns then moved to the first and second column

For the last part of this homework, "aggregate" function is used based on a combined factor "fac.subject.act" that combines subject and activity

end