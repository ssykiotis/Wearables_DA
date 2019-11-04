####Steps
#1. merge training and test set to create 1 dataset
#2. extract only the measurements on the mean and std for each measurement
#3. Name activities in the data set
#4. Label the dataset with descriptive variable names
#5. create a 2nd, independt tidy dataset with average of each variable for each activity and each subject.
if(!file.exists("wearables.zip")){
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = "wearables.zip"
               )
  unzip("wearables.zip")
}

source("prepare_dataset.R")
source("select_data.R")
source("label_vars.R")
source("data_summary.R")

data<-prepare_dataset()
selected_data<-select_data(data)

varnames<-label_vars(names(selected_data))
names(selected_data)<-varnames

data_summary<-data_summary(selected_data)

write.table(data_summary,
            file = "data_summary.txt",
            row.name=FALSE
            )
