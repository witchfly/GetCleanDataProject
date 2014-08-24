# subject is people
# x is feature variable i.e. observation. e.g. mean, std
# y is activity 
# activity label


# using data.frame to build each columns such as variable, activity, and subject
# data.frame takes vector

# read activity data 
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

# read features.txt, grep, get column and names stored into separate int vec and char vec.
features <- read.table("./dataset/features.txt", colClasses=c("numeric", "character"))
xnames <- features[[2]]
xNames <- xnames[grep("(mean|std)\\(\\)", xnames)] # names
xIndex <- grep("(mean|std)\\(\\)", xnames) # index

# read feature data then subset using xIndex  
fDataTest <- read.table("./dataset/test/X_test.txt")
fDataTrain <- read.table("./dataset/train/X_train.txt")
ft <- fDataTest[,xIndex]
ftr <- fDataTrain[,xIndex]
# then combine test and train into one
# names(z)<- c("mean","std","avg")
names(ft) <- xNames
names(ftr) <- xNames
featureData <- rbind(ft, ftr)
dataset <- cbind(data_s_a, featureData) # combine all to basic dataset 

# tidy data. subject activity avg. 
# each variable forms a column, each observations forms a row, each table stores data aboout one kind of observation (e.g. people/hospitals)

tidyData <- aggregate (. ~Subject+Activity, data=dataset, mean)
write.table(tidyData, file="tidyData.txt", row.names=FALSE)