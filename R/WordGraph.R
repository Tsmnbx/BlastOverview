WordGraph<-function(dataOf){
  table<-WordCreator(dataOf)
  wordcloud2(data = table)
}
