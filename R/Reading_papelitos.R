#Function to read all papelitos
read_papelitos <- function(numberlines=100){
  papelitos_txt <- list.files("Papelitos_here/",full.names = TRUE)
  total_papelitos <- NULL
  for (file in 1:length(papelitos_txt)){
    print(paste("Reading_file", papelitos_txt[file]))
    papelitos_in_file <- scan(papelitos_txt[file],
                            what="character",
                            blank.lines.skip = TRUE,
                            nlines=numberlines,
                            sep="\n")
    total_papelitos <- c(total_papelitos,papelitos_in_file)
  }
  Los_papelitos <<- total_papelitos
}


#Extract a random papelito
get_papelito <- function(){
  if (length(Los_papelitos) == 0){
    print ("No more papelitos :)")
    return()
  }
 El_papelito <<- sample(Los_papelitos,1)
 Los_papelitos <<- Los_papelitos[-(which(Los_papelitos == El_papelito))]
 return(El_papelito)
}

return_papelito <- function(){
  Los_papelitos_aux <- c(Los_papelitos,El_papelito)
  Los_papelitos <<- unique(Los_papelitos_aux)
}

end_turn <- function(){
  saveRDS(Los_papelitos, file = "Papelitos_here/Los_papelitos.rds")
}


start_turn <- function(){
  readRDS(file = "Papelitos_here/Los_papelitos.rds")
}
