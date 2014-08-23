getUCIHARTidyDataSet <- function(fileDir = "./") {
  # read description for features and activities
  featureNames <- read.csv(paste(fileDir, 'UCI HAR Dataset/features.txt', sep=''), sep="", header=FALSE)
  activityNames <- read.csv(paste(fileDir, 'UCI HAR Dataset/activity_labels.txt', sep=''), sep="", header=FALSE)
  
  classes <- rep("numeric", 561)
  # load test data
  test.x <- read.csv(paste(fileDir, 'UCI HAR Dataset/test/X_test.txt', sep=''), sep="", header=FALSE, colClasses=classes)
  names(test.x) <- featureNames$V2
  test.activities <- read.csv(paste(fileDir, 'UCI HAR Dataset/test/y_test.txt', sep=''), sep="", header=FALSE)
  test.activitiesWithDesc <- merge(test.activities, activityNames, by.x="V1", by.y="V1", all.x=TRUE)
  test.subjects <- read.csv(paste(fileDir, 'UCI HAR Dataset/test/subject_test.txt', sep=''), sep="", header=FALSE)
  test.x.subset <- test.x[grep("mean\\(\\)|std\\(\\)",colnames(test.x))]
  test.xWithActivitiesAndSubjects <- cbind(test.subjects, test.activitiesWithDesc[2:2], test.x.subset[1:ncol(test.x.subset)])
  names(test.x.subset) <- paste("AVG", names(test.x.subset), sep="_")
  names(test.xWithActivitiesAndSubjects) <- c("subject", "activity", names(test.x.subset))
  
  # load training data
  train.x <- read.csv(paste(fileDir, 'UCI HAR Dataset/train/X_train.txt', sep=''), sep="", header=FALSE, colClasses=classes)
  names(train.x) <- featureNames$V2
  train.activities <- read.csv(paste(fileDir, 'UCI HAR Dataset/train/y_train.txt', sep=''), sep="", header=FALSE)
  train.activitiesWithDesc <- merge(train.activities, activityNames, by.x="V1", by.y="V1", all.x=TRUE)
  train.subjects <- read.csv(paste(fileDir, 'UCI HAR Dataset/train/subject_train.txt', sep=''), sep="", header=FALSE)
  train.x.subset <- train.x[grep("mean\\(\\)|std\\(\\)",colnames(train.x))]
  train.xWithActivitiesAndSubjects <- cbind(train.subjects, train.activitiesWithDesc[2:2], train.x.subset[1:ncol(train.x.subset)])
  names(train.x.subset) <- paste("AVG", names(train.x.subset), sep="_")
  names(train.xWithActivitiesAndSubjects) <- c("subject", "activity", names(train.x.subset))
  
  testAndTrain <- rbind(test.xWithActivitiesAndSubjects, train.xWithActivitiesAndSubjects)
  result <- aggregate(testAndTrain[3:ncol(testAndTrain)], by=list(testAndTrain$activity, testAndTrain$subject), FUN=mean)
  names(result)[1:2] <- c('Activity', 'Subject')
  result <- result[order(result$Activity, result$Subject),]
  
  return(result)
}