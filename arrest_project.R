#Gather and prep data
library(readr)

Arrests <- read_csv("C:\\Users\\levia\\Downloads\\arrests_national_juvenile.csv")


RNGkind(sample.kind = "Rounding")
library(factoextra)

ArrestData <- Arrests[ -c(1:9,22:23) ]

ArrestData <- replace(ArrestData, is.na(ArrestData), 0)
ArrestData

# ____________________________________________________________________________________

#COMPLETE LINKAGE
set.seed(2)
hc.complete <- eclust(ArrestData,
                      FUNcluster="hclust",
                      cluster="hclust",
                      hc_method="complete")

#NEW CODE FOR DENDROGRAM! 

# Open a PDF for plotting
pdf("C:\\Users\\levia\\Documents\\ArrestDataProject\\ArrestDendrogram_complete.pdf",
    width=250, height=350)

# Dendrogram
plot(hc.complete, main = "Dendrogram with Complete Linkage",cex.main = 15, cex = 2)

# Close the PDF file
dev.off()

print(hc.complete$silinfo$avg.width)

#________________________________________________________________________________

# AVERAGE LINKAGE

set.seed(2)
hc.average <- eclust(ArrestData,
                      FUNcluster="hclust",
                     cluster="hclust",
                     hc_method="average")

#NEW CODE FOR DENDROGRAM! 

# Open a PDF for plotting
pdf("C:\\Users\\levia\\Documents\\ArrestDataProject\\ArrestDendrogram_average.pdf",
    width=250, height=200)

# Dendrogram
plot(hc.average, main = "Dendrogram with Average Linkage",cex.main = 15, cex = 2)

# Close the PDF file
dev.off()


#Silo coeff
print(hc.average$silinfo$avg.width)

#___________________________________________________________________________________

# SINGLE LINKAGE

set.seed(2)
hc.single<- eclust(ArrestData,
                      FUNcluster="hclust",
                      hc_method="single")

#NEW CODE FOR DENDROGRAM! 

# Open a PDF for plotting
pdf("C:\\Users\\levia\\Documents\\ArrestDataProject\\ArrestDendrogram_single.pdf",
    width=250, height=100)

# Dendrogram
plot(hc.single, main = "Dendrogram with Single Linkage",cex.main = 15, cex = 2)

# Close the PDF file
dev.off()

#silo coeff
print(hc.single$silinfo$avg.width)

#____________________________________________________________________________________

#centroid linkage
set.seed(2)
hc.centroid <- eclust(ArrestData,
                      FUNcluster="hclust",
                      cluster="hclust",
                      hc_method="centroid")

#DENDROGRAM NEW CODE! 

# Open a PDF for plotting
pdf("C:\\Users\\levia\\Documents\\ArrestDataProject\\ArrestDendrogram_centroid.pdf", width=250, height=100)

# Dendrogram
plot(hc.centroid, main = "Dendrogram with Centroid Linkage",cex.main = 15, cex = 2)

# Close the PDF file
dev.off()

#silo coeff
print(hc.centroid$silinfo$avg.width)

#___________________________________________________________________________________

#optimal number of clusters for complete
fviz_nbclust(ArrestData, hcut,
             hc_method = "complete",
             main= "Optimal number of clusters 
             with complete linkage")

#optimal number of clusters for average
fviz_nbclust(ArrestData, hcut,
             hc_method = "average",
             main= "Optimal number of clusters 
             with average linkage")

#optimal number of clusters for single
fviz_nbclust(ArrestData, hcut,
             hc_method = "single",
             main= "Optimal number of clusters 
             with single linkage")

#optimal number of clusters for centroid
fviz_nbclust(ArrestData, hcut,
             hc_method = "centroid",
             main= "Optimal number of clusters 
             with centroid linkage")

# References:
# https://stackoverflow.com/questions/7404035/how-to-plot-dendrograms-with-large-datasets
