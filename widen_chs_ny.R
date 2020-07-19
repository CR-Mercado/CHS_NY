# Splitting Datasets for Correlation Analysis 


# Read in data ----

#' Dataset is duplicative, there are really only 50 unique rows. 
#' removing duplicates and splitting the data by the question allows
#' for an easier referenceable list in date order

chs_ny <- unique ( read.csv("Data/Community_Health_Survey.csv",
                   stringsAsFactors = FALSE) ) 

split_questions <- { 
  lapply( X = split(chs_ny, f = as.factor(chs_ny$Question)),
          FUN = function(x){ 
             x[order(x$Year,decreasing = FALSE), ]
          }
      )
} 

# Before combining prevalences check that each question has its years correctly.

{ 
  if(mean(unlist(lapply(split_questions, function(x){
  x$Year == sort(unique(chs_ny$Year))}))) == 1) { 
  message ("All years are lined up appropriately.")
  } else { 
  message ("Check your years, something isn't lined up.") 
  }
}


# Combine Prevelances ----

{ 
chs_ny_wide <- cbind.data.frame(
  data.frame(Year = sort(unique(chs_ny$Year))), 
  
  lapply(names(split_questions),
         FUN = function(x){ 
           as.numeric( split_questions[[x]]$Prevalence )
         })
)
colnames(chs_ny_wide) <- c("Year", names(split_questions))
} 

# 2010 has two NAs, remove the row for now along with the year column for 
# correlation 
chs_ny_corr <- chs_ny_wide[-1, -1 ]

cor_matrix = NULL 
for(i in 1:ncol(chs_ny_corr)){ 
  for(j in 1:ncol(chs_ny_corr)) { 
    cor_matrix = c(cor_matrix,cor(chs_ny_corr[,i], chs_ny_corr[,j]))
  }
}

cor_matrix <- matrix(data = cor_matrix, ncol = 10, byrow = TRUE)
cor_matrix <- as.data.frame(cor_matrix)
rownames(cor_matrix) <- names(split_questions)
colnames(cor_matrix) <- names(split_questions)
