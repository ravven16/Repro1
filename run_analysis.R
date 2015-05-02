# downloading test and training datasets 
# The current directory is set to the directory where the zip files are extracted
#It depends on the file where the zip files are stored and extracted.
library(lsr)
setwd("C:/Users/SHRIThanuja/Desktop/Getting Clean Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

setwd("./test")
subject_test <- read.table("subject_test.txt")
test_set <- read.table("X_test.txt")
test_label <- read.table("y_test.txt")

setwd("../train")
subject_train <- read.table("subject_train.txt")
train_set <- read.table("X_train.txt")
train_label <- read.table("y_train.txt")

#merging of test and train datasets
total_set <- rbind(test_set,train_set)
total_label<- rbind(test_label,train_label)
total_subject <- rbind(subject_test,subject_train)

# adding descriptive names to variable names
colnames(total_set) <- features$V2

# extract mean and std columns from the above dataset
meanstd <- grep("mean|std",colnames(total_set))
meanstd_total <- total_set[,meanstd]

#Adding subject and activity label to the mean std total set
newtotal_set <- cbind(total_subject,total_label,meanstd_total)
colnames(newtotal_set) <- c("Subject","ActivityLabel",colnames(meanstd_total))

# Convert activity labels to descriptive names
newtotal_set$ActivityLabel <- as.factor(newtotal_set$ActivityLabel)
levels(newtotal_set$ActivityLabel) <- activity_labels$V2

# Aggregate all columns by subject and activity Label
agg_newtotalset <- aggregate(newtotal_set[,3:81],list(newtotal_set$Subject,newtotal_set$ActivityLabel),mean)
colnames(agg_newtotalset)[1] <- "Subject"
colnames(agg_newtotalset)[2] <- "ActivityLabel"
agg_newtotalset <- sortFrame(agg_newtotalset,Subject)

#write to output file
setwd("../")
write.table(agg_newtotalset, file = "./tidy_file.txt",row.name=FALSE)

