# combine lines to one email
# every new eamil starts with either 'From ticketshop@ssb-ag.de' or 'From ticketshop@mvv-muenchen.de'

library(stringr)

makeEmaiList <- function(rawTextList, starterStr) {
  result <- c(NULL)
  #how many mails? initialiaze result list
  mailcount <- length(rawtextlist[str_count(rawtextlist, mailstart)])
  maillist <- vector("list", mailcount) 
  counter = 1
  #iterate over rawTextList
  for(testline in rawTextList) {
   if(str_detect(testline, mailstart) && !is.null(result)) {
     #
     maillist[[counter]] <- result
     result <- c(NULL)
     counter <- counter +1
   } else {
     result <- c(result, testline)
   }
  }#end of for loop
  #don't forget the last one
  maillist[[counter]] <- result
  return(maillist)
}

makeEmaiStringList <- function(rawTextList, starterStr) {
  result <- ""
  #how many mails? initialiaze result list
  mailcount <- length(rawTextList[str_count(rawTextList, starterStr)])
  maillist <- vector("list", mailcount) 
  counter = 1
  #iterate over rawTextList
  for(testline in rawTextList) {
    if(str_detect(testline, starterStr) && !is.null(result)) {
      #
      maillist[[counter]] <- result
      result <- c(NULL)
      counter <- counter +1
    } else {
      result <- paste0(result, testline, collapse = NULL)
    }
  }#end of for loop
  #don't forget the last one
  maillist[[counter]] <- result
  return(maillist)
}

