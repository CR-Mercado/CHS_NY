# Task Planning ---- 

#' These are the Exploratory Data Analysis Tasks for CHS_NY
#' The tasks are split between Carlos and Bill 

# Task: Wide Format ---- 

#' The original data is duplicative and has NAs 
#' Carlos will make this wide format and remove duplicates 
#' Make a function that accepts original data and outputs WIDE format 
# for specific use.

# Task: Definitive Change ---- 

#' if any N Low confidence interval exceeds the N-X upper confidence interval
# e.g. Binge Drinking 2014 <<  Binge Drinking 2012 
# because lower CI BD 2012 = 18.2, but upper CI BD 2014 = 17.7 
# Bill will create a function of the following form:  
 #' given a question and 2 years; determine if that prevelance is
 #' "definitively changed" across those two years. 
 #' EXAMPLE: 
 #' test_definitive_change(question = "Binge Drinking", years = c(2012, 2014))
 #'  == TRUE 

# Task: Correlations across Q-Y ---- 

#' Given the wide data, Bill will test correlations including plotting them 
#' Look into correlation plots 
#  Bill will do the correlations on WIDE format

# Task: Predict 2014 Values using historical data (cross-question correlations) ----
# Predict 2014 given 2010-2013 data --- do together next week


