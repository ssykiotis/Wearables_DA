data_summary<-function(data){
  
  data<- data %>% group_by(subject,activity)
  data_summary<-  data %>% summarise_all(mean)
  
  return(data_summary)
}