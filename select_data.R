select_data<-function(data){
  
  names<-names(data)
  ind_meanstd<-grep("-mean|-std",
            names,
            ignore.case = TRUE
            )
  
  select_data<- data[c(1,2,ind_meanstd)]
  return(select_data)
}