processFile = function(filepath) {
  result <- c(NULL)
  con = file(filepath, "r", encoding = "Windows-1252")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    result <- c(result, line)
    #print(line)
  }
  close(con)
  return(result)
}

conCatString = function(stringvec) {
  
  line <- c(NULL)
  result <- c(NULL)

  for(i in stringvec) {
    
    if(nchar(i)==0){
        result <- c(result, line)
        line <- c(NULL)
    } else {
      line <- paste(line, i)
      }
  }
  
  return(result)
}


html2txt <- function(str) {
  xpathApply(htmlParse(str, asText=TRUE),
             "//body//text()", 
             xmlValue)[[1]] 
}