#####################
## Query Analysis ### 
#####################

# Cleaning the work space #
cat("\f")       # Clear old outputs
rm(list=ls())   # Clear all variables


# Load required packages #
if(!require("ggplot2")) install.packages("ggplot2") # Visualization
if(!require("psych")) install.packages("psych") # Pair plot Visualization
if(!require("ggpubr")) install.packages("ggpubr") # Scatter plot Visualization
if(!require("factoextra")) install.packages("factoextra") # PCA Visualization
if(!require("ggdendro")) install.packages("ggdendro")       #For making different Dendograms

library("ggplot2")
library("psych")
library("ggpubr")
library("factoextra")
library("ggdendro")


# Uploading data into matrix #
data <- file.choose()
data <- read.csv(data, header = TRUE, sep = ",")

# Transform Variables #
data[,c(1,2,9)] <- lapply(data[,c(1,2,9)], as.factor)
data[,3:8] <- lapply(data[,3:8], as.numeric)


# Histograms #
ggplot(data, aes(x = Rows)) + geom_histogram(color = "black", fill = "blue")
ggplot(data, aes(x = DB_hits)) + geom_histogram(color = "black", fill = "blue")
ggplot(data, aes(x = time_not_ind)) + geom_histogram(color = "black", fill = "blue")
ggplot(data, aes(x = time_ind)) + geom_histogram(color = "black", fill = "blue")
ggplot(data, aes(x = time.not_ind.ind.)) + geom_histogram(color = "black", fill = "blue")
ggplot(data, aes(x = Memory)) + geom_histogram(color = "black", fill = "blue")


# Violin Plots #
ggplot(data, aes(x = Cache_memory, y = time_not_ind, color = Cache_memory)) + geom_violin() + geom_jitter(shape=16, position=position_jitter(0.2))
ggplot(data, aes(x = Cache_memory, y = time_ind, color = Cache_memory)) + geom_violin() + geom_jitter(shape=16, position=position_jitter(0.2))
ggplot(data, aes(x = Dataset, y = time_not_ind, color = Dataset)) + geom_violin() + geom_jitter(shape=16, position=position_jitter(0.2))
ggplot(data, aes(x = Dataset, y = time_ind, color = Dataset)) + geom_violin() + geom_jitter(shape=16, position=position_jitter(0.2))


# Scatter Plot #

# All variables
pairs.panels(data, 
             method = "pearson", # correlation method
             hist.col = "#00AFBB",
             density = TRUE,  # show density plots
             ellipses = TRUE # show correlation ellipses
             )
# Numeric Variables with Cache memory
pairs.panels(data[,3:9], 
              method = "pearson", # correlation method
              hist.col = "#00AFBB",
              density = TRUE,  # show density plots
              ellipses = TRUE # show correlation ellipses
              )


# Scatter plot with correlation coefficient Rows vs DB_hits
sp <- ggscatter(data, x = "Rows", y = "DB_hits",
                add = "reg.line",  # Add regression line
                add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
                conf.int = TRUE # Add confidence interval
)
# Add correlation coefficient
sp + stat_cor(method = "pearson", label.x = 3, label.y = 30)


# Scatter plot with correlation coefficient time_ind vs time_not_ind
sp <- ggscatter(data, x = "time_ind", y = "time_not_ind",
                add = "reg.line",  # Add regression line
                add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
                conf.int = TRUE # Add confidence interval
)
# Add correlation coefficient
sp + stat_cor(method = "pearson", label.x = 3, label.y = 30)


## Unsupervised Learning ##

# Query Groups

c <- data[1:11,2]
c <- replace(c, c, "c")
h <- data[12:13,2]
m <- data[14:19,2]
m1 <- data[20:42,2]

c_query <- data[1:11,-2]
h_query <- data[12:13,-2]
m_query <- data[14:19,-2]
m1_query <- data[20:42,-2]


# Principal Component Analysis (Numeric Variables) #
pca1 <- prcomp(data[,3:8], scale = TRUE, center = TRUE)


fviz_pca_ind(pca1, habillage=data$Cache_memory,
             addEllipses=TRUE, ellipse.level=0.95)

fviz_pca_var(pca1, repel = F,
             col.var = "black", # Variables color,
             legend.title= 'Cache Memory', #Title of legends
)
             
fviz_pca_biplot(pca1, repel = F,
                habillage = data$Dataset,
                col.var = "black", # Variables color,
                legend.title= 'Dataset', #Title of legends
                addEllipses = T  # add ellipse around individuals
)

fviz_pca_biplot(pca1, repel = F,
                habillage = data$Query,
                col.var = "black", # Variables color,
                legend.title= 'Query', #Title of legends
                addEllipses = T  # add ellipse around individuals
)


# Principal Component Analysis (Numeric Variables) #
#data_query_div <- rbind(c_query, h_query, m_query, m1_query)
#query_div <- as.data.frame(c(c,h,m,m1))

#pca2 <- prcomp(data_query_div[,2:7], scale = TRUE, center = TRUE)

#fviz_pca_ind(pca1, habillage=data$Cache_memory,
#             addEllipses=TRUE, ellipse.level=0.95)


# Clustering #

# K-Means
eclust(data[,3:8], FUNcluster= "kmeans", 3, hc_metric = "euclidean" , nstart = 25, graph = TRUE)

# Hierarchical
h_clust <- eclust(data[,3:8], "hclust" , 3, hc_metric = "euclidean", hc_method = "single", graph = FALSE)
fviz_dend(h_clust, show_labels = TRUE, palette = "jco", as.ggplot = TRUE)







