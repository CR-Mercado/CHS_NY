library(mice)
library(ggcorrplot)
library(ggplot2)

source("widen_chs_ny.R")

no_year_df <- subset(x = chs_ny_wide, select = -1)

original_colnames <- colnames(no_year_df)

regrex_names <- gsub(pattern = " |\\+|\\(|\\)|-|\\/|,",
                     replacement = "_",
                     x = colnames(no_year_df))

shortnames <- substr(colnames(no_year_df),start = 1,stop = 10)
 
colnames(no_year_df) <- make.names(colnames(x = no_year_df))

set.seed(4) 
no_year_df_mice <- complete(mice(data = no_year_df, 
                                 m = 5, 
                                 maxit = 10, 
                                 method = "pmm"))

cormat <- round(cor(no_year_df_mice), 6)

custom_names <- c("Binge Drink",
                  "Colon Cancer Screen (50+)",
                  "Did Not Get Med. Care", 
                  "Drinks 1+ sugar bev. daily",
                  "Got Flu Shot 65+", 
                  "Has Health Ins.",
                  "No Personal Doc.",
                  "Obesity",
                  "Self-Report. Good+ Health",
                  "Current Smoker")

rownames(cormat) <- custom_names
colnames(cormat) <- custom_names

CHS_correlation <- ggcorrplot(corr = cormat, 
           lab = TRUE, 
           title = "Community Health Survey Correlation Matrix", 
           lab_size = 3)


ggsave(filename = "CHS_NY_CorrelationMatrix.png",plot = CHS_correlation,
       width = unit(8,"in"),height = unit(11,"in"))
