WordCreator<-function(dataOf){
  data2<-dataOf[["Hit_def"]]
  divide<-as.vector(data2)
  use<-c()
  for (i in divide){
    subVec<-unlist(strsplit(i, " ", fixed=TRUE))
    use<-c(use,subVec)

  }
  freqD<- data.frame(matrix(ncol = 2, nrow = 0))
  names <- c("word", "frequency")
  colnames(freqD) <- names
  uUse<-unique(use)
  for (word in uUse){
    total<-sum(stringr::str_count(use, word))
    subdata<-data.frame(word,total)
    freqD<-rbind(freqD, subdata)
  }
  return(freqD)
}
