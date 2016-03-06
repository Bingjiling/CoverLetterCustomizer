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
add = gsub(", ","\n",compInfo$Address)
rtf = rtf %>%
  addParagraph("125 W 109TH ST\nAPT 45C\n
New York, NY 10027\n3477261047\nyz2690@columbia.edu\n\n") %>%
  done()

  endParagraph() %>%
  addParagraph("125 W 109TH ST\nAPT 45C\n
New York, NY 10027\n3477261047\nyz2690@columbia.edu\n\n")
done(rtf)