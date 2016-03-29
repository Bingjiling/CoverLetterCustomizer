## Basic Setup
setwd("~/living/Applications")
lib = c("googlesheets","dplyr","rtf")
lapply(lib,library,character.only = TRUE)
## Get the spreadsheet
Info = gs_title("Applications") %>%
  gs_read_csv()
## Compose the cover letter
makeCL("Encore",Info)