Blast<-function(geneSeq, time=40, size="20"){
  data<-blastSequences(x= geneSeq, timeout=time, as="data.frame", hitListSize=size)
  return(data)
}
