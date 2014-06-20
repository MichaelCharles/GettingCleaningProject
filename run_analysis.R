# read in the training/test measurements and data
xtrain   <- read.table("train/X_train.txt")
ytrain   <- read.table("train/y_train.txt")
strain   <- read.table("train/subject_train.txt")
xtest    <- read.table("test/X_test.txt")
ytest    <- read.table("test/y_test.txt")
stest    <- read.table("test/subject_test.txt")
features <- read.table("features.txt")

# Merges the training and the test sets to create one data set
data <- rbind(cbind(strain,ytrain,xtrain),
              cbind(stest,ytest,xtest))

# Uses descriptive activity names to name the activities in the data set
colnames(data) <- c("Subject","Activity",gsub("[^[:alnum:]]","",features$V2))

# Extracts only the measurements on the mean and standard deviation for each measurement.                
data <- data[,c(1,2,grep("mean|std",names(data)))]

# Appropriately labels the data set with descriptive variable names.
labels <- read.table("activity_labels.txt",col.names=c("Num","Label"))
data$Activity <- labels$Label[data$Activity]

# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject
# tidy<-aggregate(data[,-(1:2)],list(Subject=data$Subject,Activity=data$Activity),mean)
tidy<-aggregate(.~Subject+Activity,data,mean)
write.table(tidy,file="tidyData.txt")
