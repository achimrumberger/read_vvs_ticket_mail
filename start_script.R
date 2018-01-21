#setup
source("processfile.R")
source("findpattern.R")
source("make_email_list.R")


## process mail mor the R way ##
### ssb ###
filepath <- "ssb2018.mbox/mbox"
rawtextlist <- processFile(filepath) 
mailstart <- "From ticketshop@ssb-ag.de"
lll <-makeEmaiStringList(rawTextList = rawtextlist, starterStr = mailstart)
erg <- lapply(lll, findValueInList)
do.call(sum, erg)
