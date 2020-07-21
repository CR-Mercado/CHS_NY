library(ggcorrplot)

source("widen_chs_ny.R")

no_year_df <- subset(x = chs_ny_wide, select = -1)

original_colnames <- colnames(no_year_df)

colnames(no_year_df) <- make.names(colnames(x = no_year_df))

no_year_df_mice <- complete(mice(data = no_year_df, 
                                 m = 5, 
                                 maxit = 10, 
                                 method = "pmm"))

cormat <- round(cor(no_year_df_mice), 6)

rownames(cormat) <- original_colnames
colnames(cormat) <- original_colnames

ggcorrplot(corr = cormat, 
           lab = TRUE, 
           title = "Community Health Survey Correlation Matrix", 
           lab_size = 3)
