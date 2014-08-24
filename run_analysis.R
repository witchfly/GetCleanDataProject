# This is a course project for the Getting and Cleaning Data 
# subject is people, a group of 30 volunteers
# x is feature variables and extract mean and std for tidy data purpose
# y is activity and activity label explains 6 activities

# using data.frame to build each columns such as variable, activity, and subject
# read activity data and apply appropriate labels
aDataTest <- read.table("./dataset/test/y_test.txt")
aDataTrain <- read.table("./dataset/train/y_train.txt")
activityData <- c(aDataTest[,1], aDataTrain[,1])
aLabel <- read.table("./dataset/activity_labels.txt", colClasses=c("numeric", "character"))
label<-aLabel[[2]]
activity <- sapply(activityData, function(x) label[x] )

# read subject data and create new data frame with activity data
sDataTest <- read.table("./dataset/test/subject_test.txt")
sDataTrain <- read.table("./dataset/train/subject_train.txt")
subjectData <- c(sDataTest[,1], sDataTrain[,1])
data_s_a <- data.frame("Subject"=subjectData, "Activity"=activity)

# read features.txt, and use grep to get only mean and std measures. 
# get column and names stored into separate int vec and char vec.
features <- read.table("./dataset/features.txt", colClasses=c("numeric", "character"))
xnames <- features[[2]]
xNames <- xnames[grep("(mean|std)\\(\\)", xnames)] # names
xIndex <- grep("(mean|std)\\(\\)", xnames) # index

# read feature data then subset using xIndex  
fDataTest <- read.table("./dataset/test/X_test.txt")
fDataTrain <- read.table("./dataset/train/X_train.txt")
ft <- fDataTest[,xIndex]
ftr <- fDataTrain[,xIndex]
# then combine test and train into one with descriptive label names
names(ft) <- xNames
names(ftr) <- xNames
featureData <- rbind(ft, ftr)
dataset <- cbind(data_s_a, featureData) # combine all to basic dataset 

# create a tidy data. i.e. subject activity avg. 
tidyData <- aggregate (. ~Subject+Activity, data=dataset, mean)
# write to a txt file. 
write.table(tidyData, file="tidyData.txt", row.names=FALSE)
