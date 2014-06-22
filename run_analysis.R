library(reshape2)

# read in features to act as names for columns of data sets
features <- read.csv("./features.txt", header=FALSE, sep="", comment.char="")
# remove problematic characters "-", "()" from  what will be column names
features1 <- gsub("-", "", features[, 2])
features2 <- gsub("\\()", "", features1)
features3 <- c("ActivityID", "SubjectID", features2)

# read in x_test which is the main data set for test
x_test <- read.csv("./test/X_test.txt", header=FALSE, sep="", 
                   colClasses="numeric", comment.char="")
# read in y_test which are labels of ActivityIDs for the x_test data obs.
y_test <- read.csv("./test/Y_test.txt", header=FALSE, sep="",
                   colClasses="character", comment.char="")
# read in subject_test which is the identity of subjects for each observation
subject_test <- read.csv("./test/subject_test.txt", header=FALSE,
                         sep="", colClasses="numeric", comment.char="")

# concatenate y_test and subject_test as first two columns on data set
test_data <- cbind(y_test, subject_test, x_test)
# add column names for the first two new columns
colnames(test_data) <- features3

# do all the exact same things for train data as test data

# read in x_train which is the main data set for train
x_train <- read.csv("./train/X_train.txt", header=FALSE, sep="", 
                   colClasses="numeric", comment.char="")
# read in y_train which are labels of activity IDs for the x_train data observations
y_train <- read.csv("./train/Y_train.txt", header=FALSE, sep="",
                   colClasses="character", comment.char="")
# read in subject_train which is the identity of subjects for each observation
subject_train <- read.csv("./train/subject_train.txt", header=FALSE,
                         sep="", colClasses="numeric", comment.char="")

# concatenate y_train and subject_train as first two columns on data set
train_data <- cbind(y_train, subject_train, x_train)
# add column names for the first two new columns
colnames(train_data) <- features3

# combine the data sets into one set with rbind, test first then train last
combined_data <- rbind(test_data, train_data)

# changed activity id numbers to descriptions and add to data set
activity <- gsub("1", "Walking", combined_data[, 1])
activity1 <- gsub("2", "Walking Upstairs", activity)
activity2 <- gsub("3", "Walking Downstairs", activity1)
activity3 <- gsub("4", "Sitting", activity2)
activity4 <- gsub("5", "Standing", activity3)
activity5 <- gsub("6", "Laying", activity4)
combined_data$ActivityID <- activity5

# only mean and std columns
tidy_data <- combined_data[, c(1, 2, which(grepl("mean|std", features3)))]

# melt/dcast means to produce a mean for each variable by activity and subject
mean_std_data_melt <- melt(tidy_data, id=c("ActivityID", "SubjectID"),
                           measure.vars=colnames(tidy_data)[3:81])
summarized_tidy_data <- dcast(mean_std_data_melt, 
                             ActivityID + SubjectID ~ variable, mean)

# write each of the two final tidy data sets to txt files
write.table(tidy_data, file = "wearables_mean_std_data.txt")
write.table(summarized_tidy_data, file = "wearables_final_tidy_means.txt")
