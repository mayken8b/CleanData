# CodeBook for Tidying of Wearables Data from:
# Human Activity Recognition Using Smartphones Dataset
# Version 1.0


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

The README also explains that the experiment involved 30 volunteers carrying a Samsung Galaxy S2 smartphone while performing six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying).  The many observations taken by the smartphones' accelerometer and gyroscopes were processed to create 561 different variable analyses.  

The 561 variables of the data are listed in the "features.txt" file. There is a "features_info.txt" file to further explain these 561 variables and the analysis done to obtain each value (i.e. Fast Fourier Transforms, mean, std, interquartile range, etc.).
