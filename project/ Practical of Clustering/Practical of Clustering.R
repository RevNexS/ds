# Libraries connection 
library(datasets) 
library(ggplot2) 
library(gridExtra) 
# Exploring the data 
head(iris) 
summary(iris$Species)

#scatterplot for iris species 
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + 
  geom_point() + 
  ggtitle("Species")

# Hierarchical Clustering 
irisCluster <- hclust(dist(iris[, 3:4]), "ward.D") 
irisCluster

#Construction of the dendrogram 
plot(irisCluster) 
rect.hclust(irisCluster, k = 3, border = "red")

# Divide into 3 clusters groups vector contains the cluster number 
groups <- cutree(irisCluster, k = 3) 
groups 
table(groups, iris$Species)

groups <- as.factor(groups) 
ggplot(iris, aes(Petal.Length, Petal.Width, color = groups)) + 
  geom_point() + 
  ggtitle("Clustering species")

plot1 <- ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + 
  geom_point() + 
  ggtitle("Species")

plot2 <- ggplot(iris, aes(Petal.Length, Petal.Width, color = groups)) + 
  geom_point() + 
  ggtitle("Clustering species") 
grid.arrange(plot1, plot2, nrow = 1, ncol = 2) 

#Load the iris data from datasets library of R. Do the cluster analysis of species by using k-nearest neighbour (KNN) technique. 

#Load and view dataset 
data("iris") # load Iris Dataset 
str(iris) #view structure of dataset 
#view statistical summary of dataset 
summary(iris) 
#view top rows of dataset 
head(iris) 

#Preprocess the dataset 
set.seed(99) # required to reproduce the results 
rnum<- sample(rep(1:150)) # randomly generate numbers from 1 to 150 
rnum 
iris<- iris[rnum,] #randomize "iris" dataset 
head(iris)

# Normalize the dataset between values 0 and 1 
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x))) 
} 

iris.new<- as.data.frame(lapply(iris[,c(1,2,3,4)],normalize)) 
head(iris.new) 
# subset the dataset 
iris.train<- iris.new[1:130,] 
iris.train.target<- iris[1:130,5] 
iris.test<- iris.new[131:150,] 
iris.test.target<- iris[131:150,5] 
summary(iris.new) 

#Apply k-NN classification algorithm 
library(class) 
model1<- knn(train=iris.train, test=iris.test, cl=iris.train.target, k=16) 
#model1 
#Verify results 
table(iris.test.target, model1)

#Load the iris data from datasets library of R. Do the cluster analysis of species by using k-means technique.

#Load and view dataset 
require("datasets") 
data("iris") # load Iris Dataset 
str(iris) #view structure of dataset 
#view statistical summary of dataset 
summary(iris) 
#view top rows of dataset 
head(iris)

#Preprocess the dataset 
iris.new<- iris[,c(1,2,3,4)] 
iris.class<- iris[,"Species"] 
head(iris.new) 
head(iris.class) 
normalize <- function(x){ 
  return ((x-min(x))/(max(x)-min(x))) 
} 


iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length) 
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width) 
iris.new$Petal.Length<- normalize(iris.new$Petal.Length) 
iris.new$Petal.Width<- normalize(iris.new$Petal.Width) 
head(iris.new) 

#Apply k-means clustering algorithm 
#apply k-means algorithm with no. of centroids(k)=3 
result<- kmeans(iris.new,3) 
# gives no. of records in each cluster 
result$size 
# gives value of cluster center datapoint value(3 centers for k=3) 
result$centers 
#gives cluster vector showing the custer where each record falls 
result$cluster

#Verify results of clustering 
par(mfrow=c(2,2), mar=c(5,4,2,2)) 
# Plot to see how Sepal.Length and Sepal.Width data points have been distributed in clusters 
plot(iris.new[c(1,2)], col=result$cluster) 
# Plot to see how Sepal.Length and Sepal.Width data points have been distributed originally as per "class" attribute in 
dataset 
plot(iris.new[c(1,2)], col=iris.class) 
# Plot to see how Petal.Length and Petal.Width data points have been distributed in clusters 
plot(iris.new[c(3,4)], col=result$cluster) 
plot(iris.new[c(3,4)], col=iris.class)

table(result$cluster,iris.class)


