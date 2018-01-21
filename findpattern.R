
#####################
findValueInList <- function(inputLine) {
  searchPattern <- "[0-9]{1,2},[0-9]{1,2}"
  #vector of string from inputline
  stringv <-str_split(inputLine, "\\s");
  
  strWithPatternv <- stringv[str_detect(stringv, searchPattern )]
  results <- str_extract(strWithPatternv, searchPattern)
  #convert string to double values
  results <- str_replace(results, "," ,".")
  x <- as.double(results)
  if(!is.infinite(max(x)) ){
    return(max(x))
  }
}