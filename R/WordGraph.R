WordGraph<-function(dataOf){
  table<-WordCreator(dataOf)
  wordcloud2::wordcloud2(data = table)
}
