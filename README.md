Reported Number of Juvenile Arrests by Crime
Introduction
The “Reported Number of Juvenile Arrests by Crime” dataset contains a record of monthly juvenile arrests for various offenses from the years 1995 to 2016, categorized by offense, age, gender, or race. Agencies that have reported the arrests are also included in the annual counts that are included within the database. To be considered a juvenile, according to the UCR Program, one must be an individual under the age of 18. The dataset does not include data on individuals who have been contacted by the police for non-offending juvenile or protection custody cases.

The question we want to address with our dataset is whether there is any correlation between the optimal resulting cluster assignments and the categorization of offenses. In the case of our dataset, we will be focusing on unsupervised learning as our study will center around variables that pertain to race, age, or gender. We will analyze the data using clustering algorithms to identify patterns of behaviors and trends over time. Our goal is to provide insights on an effective way to address juvenile delinquency.

Methodology
Clustering is one of the most common exploratory data analysis techniques used to get an intuition about the structure of the data. In this project, we will focus on clustering assignments using K-means clustering and hierarchical clustering. Both models are effective for unsupervised learning and assist in analyzing the patterns as well as the relationships between variables.

K-Means Clustering
K-means clustering is a popular unsupervised machine learning technique that allows the identification of clusters (similar groups of data points) within the data. K-means clustering is one of the most commonly used clustering algorithms for partitioning observations into K groups, where the value of K is predetermined by the analyst. K-means tries to classify observations into mutually exclusive groups (or clusters), such that observations within the same cluster are as similar as possible (i.e., high intra-class similarity), whereas observations from different clusters are as dissimilar as possible (i.e., low inter-class similarity). In K-means clustering, each cluster is represented by its center (i.e., centroid), which corresponds to the mean of the observation values assigned to the cluster. To effectively apply the technique on this dataset, a range of 1-10 was established for the value of K. All the observations were categorized into separate subsets based on male, female, and race in respect to the type of offense. K-means algorithms were applied to each subset, where all the observations were put into the existing number of K groups. Additional analytical processes were conducted to determine the optimal number of clusters, such as using the gap statistic and the “elbow” method.

Hierarchical Clustering
Hierarchical clustering is an algorithm that fuses the least dissimilar observations into clusters. Each observation starts as its own cluster. The similarity fusion continues until all observations are in one single cluster. This algorithm can be visualized as a dendrogram, a tree-like graph that merges each observation, or branch, at a certain height which is its dissimilarity. Unlike K-means clustering, hierarchical clustering does not require a specific number of clusters in advance. Instead, clusters are created by merging the most similar, or least dissimilar, observations. There are four different linkage types we can use when it comes to deciding which dissimilarity to record as the height of the dendrogram. Complete linkage takes the largest dissimilarity of all the observations in each cluster and records that number as the dissimilarity between two clusters. Single linkage takes the smallest dissimilarity, average linkage takes the average dissimilarity, and centroid linkage takes the dissimilarity of the centroids for the two clusters.

Data Analysis
Data Preparation
When using hierarchical and K-means clustering, we considered the categorization of offenses, age, gender, or race as our predictor variables to showcase if they may have an impact on juvenile arrests. However, we excluded variables that are highly correlated or irrelevant to our research question. Scaling was not necessary for our dataset as the variables are categorical and based on the population (or number of people) that fit into each category. Scaling is only applicable when the variables are continuous and have different units or scales.

To begin, we deleted all columns within the dataset leaving the following variables: M_0_9 - M_17, F_0_9 - F_17, white, black, asian_pacific_islander, and american_indian. Offense_name was also used for the cluster description process. These variables will be used as previously mentioned and are the ages, race, and gender, respectively. The following variables were excluded from the analysis due to irrelevance to the research question or redundancy: id, year, state_abbr, offense_code, agencies, population, total_male, total_female, race_agencies, and race_population.

K-means Clustering - Vy and Khiem
The base R and cluster libraries were loaded onto the workspace to prepare for this technique. The kmeans() command was applied to each subset to carry out the K-means algorithm, but it was the within-cluster sum of squared errors (WSS) that was extracted from each subset’s K-means directory to find the optimal K value with the “elbow” method. To effectively conduct the K-means algorithm on the dataset, all the missing values (“N/A”) were replaced by the average of the remaining numeric values in the same column.

As we were trying to find the optimal number of clusters, the “elbow” method showed that the optimal number of clusters was K = 3. However, using the gap statistic, it showed that the optimal number of clusters was K = 9. It is important to use both the “elbow” and the gap statistic methods to find the optimal number of clusters as the data points should display the same kind of distribution whether it is the observed distribution or the uniform distribution among each of the data entries.

As the optimal number of clusters was established to be K = 9, the offense values were labeled based on their nearest centroid. A list was made to visualize the different types of offenses that fall under each cluster. Some clusters contained as little as two offenses to as many as 16 offenses.

Hierarchical Clustering - Tina and Jurnae
To begin, we gathered and prepared the data. We included a few libraries and read in the data using the readr library to place our dataset into a specified directory. Next, we loaded the factoextra library and created a random number generator for rounding. We also created a new data frame called “ArrestData” that removed columns 1-9 and 22-23 from the “Arrests” dataset. Any missing values in “ArrestData” were replaced with zeros.

Complete Linkage
We set the seed for our random number generator. In our case, we selected 2 to be our set.seed. We then performed hierarchical clustering on “ArrestData” using complete linkage, saving the resulting cluster into hc.complete. We created a dendrogram plot for the hierarchical clustering results using complete linkage.

Due to our large quantity of observations, we provided a Google Drive link for downloading a clear version of the dendrogram. Please download the PDF file for better viewing. All dendrograms for each type of linkage are included here: [Dendrogram Download Link]. All R-Code used is located in the Appendix.

The silhouette coefficient for the clustering was 0.6046651.

Average Linkage
The steps remained generally the same for the other links as well. The code can be found in the Appendix. The silhouette coefficient for average linkage was 0.6578764.

Single Linkage
The silhouette coefficient for single linkage was 0.3772024.

Centroid Linkage
The silhouette coefficient for centroid linkage was 0.5141829.

We created a plot of the optimal number of clusters for each linkage type. The R-Code can be found in the Appendix.

Results
Silhouette Coefficients
K-means clustering:

Average: 0.48804393
Hierarchical clustering:

Complete: 0.6046651
Average: 0.6578764
Single: 0.3772024
Centroid: 0.5141829
Most Optimal Silhouette Coefficient: 0.6578764

Optimal Model
Our best/optimal model is Hierarchical Clustering with Average Linkage and k=2 clusters. The second cluster only consists of larceny, runaways, and the “all other offenses” category.

Link to Optimal Model (Dendrogram): [ArrestDendrogram_optimal_color.pdf]

Comparison and Insights
The K-Means clustering showed nine clusters under the gap statistic method, which were equally distributed among all variables. The organization of the data based on the cluster labels revealed that some clusters contained more offenses than others. The Hierarchical clustering shows four linkage models, with the best model being the Average linkage. The dendrogram showed two clusters, with the second cluster consisting only of larceny, runaways, and the “all other offenses” category. The most optimal silhouette coefficient was 0.6578764, indicating that the hierarchical method was the best method to use when analyzing this dataset.

Conclusion
After conducting K-Means and Hierarchical clustering, we discovered a significant correlation between the optimal clustering assignments and the offense categorization. Hierarchical clustering proved to be the superior model as it produced the most optimal silhouette coefficient. On the other hand, K-means may not always yield the best configuration that corresponds to the global objective function minimum. When dealing with large datasets containing many dimensions and data items, hierarchical clustering can
