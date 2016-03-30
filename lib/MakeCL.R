## Basic Setup
setwd("~/living/Applications")
lib = c("googlesheets","dplyr","rtf")
lapply(lib,library,character.only = TRUE)
makeCL = function(name, Info, sheet){
  ## Extract the row from the file
  compInfo = Info%>%
    filter(CompanyName == name)
  ## Extract info from the spreed sheet
  Address = gsub(", ","\n",compInfo$Address)
  Position = compInfo$Position
  Liaison = compInfo$Liaison
  CompanyName = compInfo$CompanyName
  Quality = compInfo$Quality
  ## Build the paragraphs
  Head = ifelse(is.na(Liaison),"\nDear hiring manager:", paste("\nDear ", Liaison, ":", sep = ""))
  p1 = paste("I am applying for the ", Position, "position, which I learned about at Columbia University's Career Fair. I am currently a Master's student majoring in statistics concentrating on Data Science and I will be graduating in May 2016. I believe that I am a good fit for the position because of my rich experience in statistical modeling and R, my outstanding communication skills, and, most importantly, my passion to learn new things.")
  p2 = "\nAs a summer intern at the Finance Department of Bank of China, I was in charge of computing bonus allocation using MS Excel, during which I pinpointed the flaw in the algorithm from looking through history reports on bonus and talking with sales managers from different branches. Apart from my daily responsibility of tracking wholesale foreign exchange alongside with colleagues from different departments, I also acted as liaison in get-togethers with major clients. These experiences have helped me excel in communicating with non-tech people about technical problems and making tech-talk interesting and interactive. "
  p3 = "\nIn addition to the above experience, as a summer intern at Telemia, a start-up consulting company based in Beijing, I helped with the data gathering and cleaning process by MS Excel as well as translating and editing documents for clients meeting. And our team managed to land our first major client, Hua Insurance, in less than a month."
  p4 = "\nFinally, as a statistics student, I had intensive training in modeling and coding both in project and in class. Through out the projects, I developed an in-depth understanding of methods like PCA, kernel regression and SVM in real world problems. Moreover, I learned not only from self-study but also from teammates in other majors and universities, and most importantly, had so much fun cracking data problems with friends. I would be more than excited to have a job solving data problems everyday with my co-workers. Apart from devoting my leisure time for data projects, I also aced both statistics courses and computer science courses like data structure and algorithm, which made me more methodological and efficient in coding."
  p5 = paste("\nI want to be part of ", name, "because it is exactly what I want to do, ", Quality, ". ", "And I believe my background in statistics and coding make me a good fit. In closing I thank you for your time and consideration, and I hope to have the opportunity to discuss this opening with you in person. ", sep = "")
  tail = "\nYours sincerely,\n\nYanyu Zheng"
  ## Creat a new directory for the cover letter
  ifelse(!dir.exists(name), dir.create(name), FALSE)  
  wd = paste("./",name,sep="")
  setwd(wd)
  ## Build a new rtf file
  output = "PlayCoverLeter.rtf"
  rtf = RTF(output,font.size = 14)
  ## Build the rtf file
  addParagraph(rtf,"125 W 109TH ST\nAPT 45C\nNew York, NY 10027\n3477261047\nyz2690@columbia.edu\nhttps://github.com/Bingjiling\n")
  addParagraph(rtf,Address) 
  addParagraph(rtf,Head)
  addParagraph(rtf,p1)
  addParagraph(rtf,p2)
  addParagraph(rtf,p3)
  addParagraph(rtf,p4)
  addParagraph(rtf,p5)
  addParagraph(rtf,tail)
  done(rtf)
  ##Change Date&Status
  compInfo$Date = format(Sys.Date(), format="%m-%d")
  compInfo$Status = "Resume"
  ##Put the info back to Google Sheet
  row = which(compInfo$CompanyName == name)
  anc = paste("A",(row+1),sep = "")
  gs_edit_cells(sheet, input = compInfo,
                anchor = anc, byrow = TRUE)
}
