Blast<-function(geneSeq, time = 40, size="20"){
  if(nchar(geneSeq) > 100){
        geneSeq <-substr(geneSeq, 1,100)
  }
  data<-annotate::blastSequences(x= geneSeq, timeout=time, as="data.frame", hitListSize=size)
  return(data)
}
