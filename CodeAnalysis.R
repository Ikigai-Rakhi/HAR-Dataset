#loading libraries
library(dplyr)
library(tidyr)
#Reading in activity labels and features files
activity.labels<- read.table("activity_labels.txt", header= FALSE, col.names<- c("actnum", "actdesc") )
features <- read.table("features.txt"header = FALSE, col.names = c("colnum","coldesc"))

#Reading in subject training data
subject_train <- read.table("subject_train.txt", header = FALSE, col.names = "subject")
x_train <- read.table("x_train.txt", sep = "", header = FALSE, col.names = features$coldesc)
y_train <- read.table("y_train.txt", sep = " ", header = FALSE, col.names = "actnum")

#Reading in subject test data
subject_test <- read.table("subject_test.txt", header = FALSE, col.names = "subject")
x_test <- read.table("X_test.txt", sep = "", header = FALSE, col.names = features$coldesc)
y_test <- read.table("y_test.txt", sep = "", header = FALSE, col.names = "actnum")

#combine test and training data sets
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subj_all <- rbind(subject_train, subject_test)
har<- cbind(subj_all, x_all, y_all)

#Creating new Df with only 'mean' and 'Standard deviation'
harSub <- select(har, subject, actnum, contains("mean"), contains("std"), -contains("meanFreq"))

# Apply descriptive names for the activity variable. Rearrange and sort columns.

harSub <- merge(harSub, activity_labels, by = "actnum")

harSub <- harSub %>% 
  select(2, 1, 76, 3:75) %>% 
  arrange(subject, actnum)

harSub$subject <- as.factor(harSub$subject)
harSub$actnum <- as.factor(harSub$actnum)
#Create a 'tidy' dataset

harSubLong <- harSub %>% 
  gather("features", "measurement", 4:76)  # glimpse(harSubLong)

#Summarise

harSummary <- harSubLong %>% 
  group_by(subject, actdesc, features) %>% 
  summarise(avg_measurement = mean(measurement)) %>% ungroup() %>% ungroup() %>% 
  arrange(subject, actdesc, features)

#Writing the new tidy data
write.table(harSubLong, file = "HAR_tidy_dataset.txt", quote = FALSE
            , sep = " ", row.names = FALSE, col.names = TRUE)

write.table(harSummary, file = "HAR_summary.txt", quote = FALSE
            , sep = " ", row.names = FALSE, col.names = TRUE) 