label_vars<-function(labels){
  
  #remove any numer from the vriable names
  labels<-gsub("[0-9]","",labels)
  
  #remove parentheses
  labels<-gsub("\\(\\)","", labels)
  return(labels)
}