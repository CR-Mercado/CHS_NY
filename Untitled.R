CHS_Data <- read.csv(file = "Data/Community_Health_Survey.csv")

CHS_Data[CHS_Data == "n/a"] <- NA

CHS_Data_NoNA <- na.omit(CHS_Data)

test_definitive_change <- function()