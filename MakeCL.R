lib = c("googlesheets","dplyr","rtf")
lapply(lib,library,character.only = TRUE)
compInfo = gs_title("Applications") %>%
  gs_read_csv() %>%
  filter(`Company Name` == "Encore Capital Group")

