

CHS_Data <- read.csv("Data/Community_Health_Survey.csv",stringsAsFactors = FALSE)
test_definitive_change <- function(question, years){
 
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

test_definitive_change("Binge Drinking", c(2012, 2014))


source("widen_chs_ny.R")

test_definitive_change <- function(CHS_Data, question, years){
  #' This function identifies whether the estimate for the 
  #' 2nd year provided (e.g. 2014) in question provided (e.g. "Binge Drinking")
  #' is significantly larger than in the 1st year (e.g. 2012). 
  #' Example: Binge Drinking 2012 is estimated at 19.6 (CI: 18.2, 20.9)
  #' While Binge Drinking 2014 is estimated at 16.5 (CI: 15.4, 17.7)
  #' Becuse 2012 Lower CI (18.2) > 2014 Upper CI (17.7) we may feel 
  #' that Binge Drinking significantly changed.
  #' Returns TRUE if (year 1 Lower CI > year 2 Upper CI) else FALSE
  
  
  
  CHS_Data[CHS_Data == "n/a"] <- NA
  
  CHS_Data_NoNA <- na.omit(CHS_Data)
  
  years <- sort(x = years)
  
  rownum1 <- which(CHS_Data_NoNA[,"Question"] == question & 
                     CHS_Data_NoNA[, "Year"] == years[1])
  
  rownum2 <- which(CHS_Data_NoNA[,"Question"] == question & 
                     CHS_Data_NoNA[, "Year"] == years[2])

  if (CHS_Data_NoNA[rownum1[1], "Lower95.CI"] > 
      CHS_Data_NoNA[rownum2[1], "Upper95.CI"]) {
    TRUE
  } else{
    FALSE
  }
}
test_definitive_change(CHS_Data = chs_ny, "Binge Drinking", c(2011, 2013))
