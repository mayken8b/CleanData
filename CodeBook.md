# CodeBook for Tidying of Wearables Data from:
# Human Activity Recognition Using Smartphones Dataset Version 1.0


All data used in this analysis originate from:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The citation of their data is directly from the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


The data set and all the group's original explanations of the data (contained in a README.txt as well as other text files) can be found at the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The Original Data

The original data includes several descriptive files of interest concerning the identity of variables and observations in the data set.  The README contained in the original data (not this repo) includes the identity and contents of the files included in the data.  This is incredibly important as there are several files that the run_analysis.R script reads to combine the separated aspects of the data into a single tidy and summarized data set.  

The README also explains that the experiment involved 30 volunteers carrying a Samsung Galaxy S2 smartphone while performing six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying).  The many observations taken by the smartphones' accelerometer and gyroscopes were processed to create 561 different variable analyses.  The units of the variables are explained in the README, however each of these variables were also normalized to a range of [-1, 1]. 

The 561 variables of the data are listed in the "features.txt" file. There is a "features_info.txt" file to further explain these 561 variables and the analysis done to obtain each value (i.e. Fast Fourier Transforms, mean, std, interquartile range, etc.).

# The Alterations Performed by the Script.

The run_analysis.R script is intended to tidy the data set from an amalgam of separated files into one tidy, summarized data set with labels included in the data set instead of listed in separate files.

The major alterations are as follows:

1. It combines the columns from the x_test data (the 561 variables), the y_test data which contains the labels of activity IDs being performed during the observations, and the subject_test data file containing the subject ID numbers.  The resulting data set included a column of Activity IDs, Subject IDs, and the 561 variables measured.
2. It combines the columns from the x_train data (the 561 variables), the y_train data which contains the labels of activity IDs being performed during the observations, and the subject_train data file containing subject ID numbers.  The resulting data set including a column of Activity IDs, Subject IDs, and the 561 variables measures.
3. It appropriately identifies the variables of measurement from the features.txt file as column names, and assigns "ActivityID", "SubjectID" and these feature.txt names as the column names of the data sets created in #1 and #2.
4. It also removes potentially error-inducing characters from the column names.  Specifically, the gsub() function is applied to remove "-" and "()" from the column names as they can be misinterpreted by R as an operator and a function call respectively.
5. It combines the two completely separate data sets corresponding to #1 and #2 into one large data set.
6. It replaces Activity ID numbers with Activity ID names ("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"), as per the "activity_labels.txt" file in the original data set.
7. It extracts only the mean and std variable columns from the data set using subsetting and a gepl function.  Any variable containing the string "mean" or the string "std" is maintained as a column in the subsequent data set.  This cuts the number of columns from 563 to only 81 (79 variables and a column each for activity ids and subject ids).  In this particular extraction, all variables pertaining to a mean or std were used, including those involving angles and frequencies.  The decision to include these angle and frequency variables as well was due to a desire to not prematurely exclude data that may be pertinent to the user seeking mean and std data.
8. It takes the mean and std data and further summarizes it by taking the mean of each of the 79 different mean and std variables by each combination of activity (walking, walking upstairs, walking downstairs, sitting, standing, and laying) and subject id (range of 1 to 30).  This is accomplished by first using melt() on the data (by activity and subject), then dcast() from the reshape2 R library with the mean function.
9. Finally, the script creates two .txt files in the working directory identified as "wearables_mean_std_data.txt" and "wearables_final_tidy_means.txt".  These two files contain the tables of the final tidy data sets produced by the script.  The first file contains all the >10000 observations of all 81 variable columns of mean and std data.  The second file contains the final data where the means were taken for each combination of activity and subject.  This file only contains 180 rows for the 81 columns.


The data are summarized in the two tables created by the script as the "wearables_mean_std_data.txt" and "wearables_final_tidy_means.txt" files in the working directory.  They can be visualized by using read.table() in R.
