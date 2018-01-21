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
