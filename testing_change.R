# CHS_Data <- read.csv(file = "Data/Community_Health_Survey.csv")
# 
# CHS_Data[CHS_Data == "n/a"] <- NA
# 
# CHS_Data_NoNA <- na.omit(CHS_Data)

test_definitive_change <- function(question, years){
  CHS_Data <- read.csv(file = "Data/Community_Health_Survey.csv",
                       stringsAsFactors = FALSE)
  
  CHS_Data[CHS_Data == "n/a"] <- NA
  
  CHS_Data_NoNA <- na.omit(CHS_Data)
  
  years <- sort(x = years)
  
  rownum1 <- which(CHS_Data_NoNA[,"Question"] == question & 
                     CHS_Data_NoNA[, "Year"] == years[1])
  
  rownum2 <- which(CHS_Data_NoNA[,"Question"] == question & 
                     CHS_Data_NoNA[, "Year"] == years[2])
  
  # print(rownum1[1])
  # print(rownum2[1])
  # print(CHS_Data_NoNA[rownum1[1], "Lower95.CI"])
  # print(CHS_Data_NoNA[rownum2[1], "Upper95.CI"])
  # print(CHS_Data_NoNA$Lower95.CI[rownum1[1]])
  # print(CHS_Data_NoNA$Upper95.CI[rownum2[1]])
  
  if (CHS_Data_NoNA[rownum1[1], "Lower95.CI"] > 
      CHS_Data_NoNA[rownum2[1], "Upper95.CI"]){
    TRUE
  } else{
    FALSE
  }
}

# test_definitive_change("Binge Drinking", c(2012, 2014))