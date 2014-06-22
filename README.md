CleanData
=========

# Wearables Data and the run_analysis.R Script

This repo contains a script that will analyze data collected from the following source (cited
from their own readme which will be included in the later linked data).

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

In order to draw conclusions from the data set provided by this group, one can use the included
R script to summarize the data by activity and subject participant.   A large number (561) of
data variables were collected and included in the group's data for each individual observation.
This includes some significant processing that is best understood from the direct source: the actual
group's data set and included information files.  This README is concerned solely with explaining the 
usage and purpose of the script contained within this repo.  Please follow the next instructions
to properly use this script.

# First things first...

Before you may effectively use the run_analysis.R script, you need to:

1. Download the appropriate data set from its original source.  The link is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the data into an appropriate working directory you will use in your R session.
3. Open R.
4. Set your working directory, using setwd(), to the filepath of the UCI HAR DATASET you have now unzipped.
5. Download the run_analysis.R script from this repo and place it into the working directory.

# Time to do this thing...

Now that your data and script are downloaded and in the correct directory, which also happens to be 
your current R working directory, you can run the analysis by doing the following:

Source your run_analysis.R script by typing source("run_analysis.R").

Assuming that your data and the script file are both in the working directory, the script will now
automatically read in the data from the working directory and tidy the data up.  This automatic tidying
process includes the following alterations to the data:

1. It combines multiple data sets that separate activity IDs like walking and sitting, subject ID numbers and the actual observations from the experiment from each other.
2. It appropriately identifies the variables of measurement as column names, also originally from a separated file in the original data set.
3. It combines two completely separate data sets identified as X_test and X_train into one large data set.
4. It extracts only the mean and std variable columns from the data set.  This cuts the number of columns from 563 to only 81 (79 variables and a column each for activity ids and subject ids).  In this particular extraction, all variables pertaining to a mean or std were used, including those involving angles and frequencies.  The decision to include these variables was due to a desire to not prematurely exclude data that may be pertinent to the user seeking mean and std data.
5. It takes the mean and std data and further summarizes it by taking the mean of each of the 79 different mean and std variables for each combination of activity (walking, walking upstairs, walking downstairs, sitting, standing, and laying) and subject id (range of 1 to 30).
6. It creates two .txt files in the working directory identified as "wearables_mean_std_data.txt" and "wearables_final_tidy_means.txt".  These two files contain the tables of the final tidy data sets produced by the script.  The first file contains all the >10000 observations of all 81 variable columns of mean and std data.  The second file contains the final data where the means were taken for each combination of activity and subject.  This file only contains 180 rows for the 81 columns.


The script's two final results tables can easily be visualized in R by using read.table("wearables_mean_std_data.txt") 
and read.table("wearables_final_tidy_means.txt"), as these files now exist in the working directory.

# Final Citation

All data originates from the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
