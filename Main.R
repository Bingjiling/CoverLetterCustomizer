## Basic Setup
setwd("~/living/Applications")
lib = c("googlesheets","dplyr","rtf")
lapply(lib,library,character.only = TRUE)
## Get the spreadsheet
sheet = gs_title("Applications")
Info = gs_read_csv(sheet)
## Compose the cover letter
makeCL("Test",Info,sheet)
