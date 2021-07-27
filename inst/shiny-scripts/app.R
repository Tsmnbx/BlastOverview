library(shiny)
library(wordcloud2)
#https://cran.r-project.org/web/packages/wordcloud2/vignettes/wordcloud.html

#https://github.com/rstudio/shinydashboard/issues/281#issuecomment-615888981

wordcloud2a <- function (data, size = 1, minSize = 0, gridSize = 0, fontFamily = "Segoe UI",
                         fontWeight = "bold", color = "random-dark", backgroundColor = "white",
                         minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE,
                         rotateRatio = 0.4, shape = "circle", ellipticity = 0.65,
                         widgetsize = NULL, figPath = NULL, hoverFunction = NULL)
{
  if ("table" %in% class(data)) {
    dataOut = data.frame(name = names(data), freq = as.vector(data))
  }
  else {
    data = as.data.frame(data)
    dataOut = data[, 1:2]
    names(dataOut) = c("name", "freq")
  }
  if (!is.null(figPath)) {
    if (!file.exists(figPath)) {
      stop("cannot find fig in the figPath")
    }
    spPath = strsplit(figPath, "\\.")[[1]]
    len = length(spPath)
    figClass = spPath[len]
    if (!figClass %in% c("jpeg", "jpg", "png", "bmp", "gif")) {
      stop("file should be a jpeg, jpg, png, bmp or gif file!")
    }
    base64 = base64enc::base64encode(figPath)
    base64 = paste0("data:image/", figClass, ";base64,",
                    base64)
  }
  else {
    base64 = NULL
  }
  weightFactor = size * 180/max(dataOut$freq)
  settings <- list(word = dataOut$name, freq = dataOut$freq,
                   fontFamily = fontFamily, fontWeight = fontWeight, color = color,
                   minSize = minSize, weightFactor = weightFactor, backgroundColor = backgroundColor,
                   gridSize = gridSize, minRotation = minRotation, maxRotation = maxRotation,
                   shuffle = shuffle, rotateRatio = rotateRatio, shape = shape,
                   ellipticity = ellipticity, figBase64 = base64, hover = htmlwidgets::JS(hoverFunction))
  chart = htmlwidgets::createWidget("wordcloud2", settings,
                                    width = widgetsize[1], height = widgetsize[2], sizingPolicy = htmlwidgets::sizingPolicy(viewer.padding = 0,
                                                                                                                            browser.padding = 0, browser.fill = TRUE))
  chart
}


#GGCCTTCATTTA
#Functions we need to redefine
Blast<-function(geneSeq, time = 40, size="10"){
  if(nchar(geneSeq) > 100){
    geneSeq <-substr(geneSeq, 1,100)
  }
  data<-annotate::blastSequences(x= geneSeq, timeout=time, as="data.frame", hitListSize=size)
  return(data)
}


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

WordGraph<-function(dataOf){
  table<-WordCreator(dataOf)
  wordcloud2a(data = table,  color = "random-light", backgroundColor = "black")
}

n <- 1


ui <- fluidPage(

  titlePanel("BLAST Overview"),


#Input Functions
  textInput(inputId="sequence", "Enter Sequence", value = "", width = "1000px", placeholder = NULL),
  verbatimTextOutput("value"),

actionButton(inputId = "clicks",label = "submit"),

#Output Functions

wordcloud2Output(outputId = "word")

)




server<-function(input, output) {
  output$value <- renderText({input$sequence})
  observeEvent(input$clicks, {
    db<-Blast(input$sequence)

    output$word <- renderWordcloud2({

      title <- "Key Words from BLAST Results"
      WordGraph(db)

    })


  })

}


shinyApp(ui = ui, server = server)



