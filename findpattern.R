#regex

findPattern <- function(inputv, srchpattern) {
  
  result <- c(NULL)
  for (i in inputv) {
    if(length(i)>0){
      if(grepl(srchpattern, i) == 1) {
        result <- c(result, i)
      }
    }
  }
  return(result)
}


####################
findfare <- function(inputv) {
  
  result <- c(NULL)
  for(i in inputv) {
    tmp <- regmatches(i,regexpr("[0-9]{1,2},[0-9]{1,2}",i))
    result <- c(result, sub(",", ".", tmp))
  }
  return(result)
}


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