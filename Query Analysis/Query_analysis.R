#####################
## Query Analysis ### 
#####################

# Cleaning the work space #

cat("\f")       # Clear old outputs
rm(list=ls())   # Clear all variables


# Load required packages #

if(!require("ggplot2")) install.packages("ggplot2") # Visualization


# Uploading data into matrix #

data <- file.choose()
data

data <- read.csv(data, header = TRUE, sep = ",")


# Transform Variables #

data[,c(1,2,9)] <- lapply(data[,c(1,2,9)], as.factor)
data[,3:8] <- lapply(data[,3:8], as.numeric)


# Violin Plots #

v_plot1 <- ggplot(data, aes(x = Cache_memory, y = time_not_ind, color = Cache_memory)) + geom_violin() + geom_jitter(shape=16, position=position_jitter(0.2))
v_plot1

v_plot2 <- ggplot(data, aes(x = Cache_memory, y = time_ind, color = Cache_memory)) + geom_violin() + geom_jitter(shape=16, position=position_jitter(0.2))
v_plot2
