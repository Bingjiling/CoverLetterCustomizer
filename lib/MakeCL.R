setwd("~/living/Applications")
lib = c("googlesheets","dplyr","rtf")
lapply(lib,library,character.only = TRUE)
compInfo = gs_title("Applications") %>%
  gs_read_csv() %>%
  filter(Name == "Encore")
dir.create("Encore")
setwd("./Encore")
output = "PlayCoverLeter.rtf"
rtf = RTF(output)
add = gsub(","," \n ",compInfo$Address)

done(rtf)