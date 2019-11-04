prepare_dataset<-function(){

library(dplyr)
  
    
file_X_test          <- "UCI\ HAR\ Dataset/test/X_test.txt"
file_y_test          <- "UCI\ HAR\ Dataset/test/y_test.txt"
file_X_train         <- "UCI\ HAR\ Dataset/train/X_train.txt"
file_y_train         <- "UCI\ HAR\ Dataset/train/y_train.txt"
file_subject_train   <- "UCI\ HAR\ Dataset/train/subject_train.txt"
file_subject_test    <- "UCI\ HAR\ Dataset/test/subject_test.txt"
file_activity_labels <- "UCI\ HAR\ Dataset/activity_labels.txt"
file_features        <- "UCI\ HAR\ Dataset/features.txt"

X_test  <-read.table(file_X_test)
y_test  <-read.table(file_y_test)
X_train <-read.table(file_X_train)
y_train <-read.table(file_y_train)

subject_test  <- read.table(file_subject_test)
subject_train <- read.table(file_subject_train)

act_labels <- readLines(file_activity_labels)
features   <- readLines(file_features)

#creating a factor for the activity labels
act_labels<- factor(gsub("[1-6]","",act_labels))

#assign to each y the corresponding activity

y_test  <- sapply(y_test, function(x) act_labels[x])
y_train <- sapply(y_train,function(x) act_labels[x])

y_train<-data.frame(y_train,stringsAsFactors = TRUE)
y_test <-data.frame(y_test, stringsAsFactors = TRUE)

#bind things together

X_comb<-bind_rows(X_train,X_test)
y_comb <-bind_rows(y_train,y_test)
subj_comb<-bind_rows(subject_train,subject_test)

#create the final dataframe and give it column names
data<-data.frame(subj_comb,y_comb,X_comb)
names(data)<-c("subject","activity",features)

return(tbl_df(data))
}