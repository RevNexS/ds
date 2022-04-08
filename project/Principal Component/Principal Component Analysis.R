#Load Iris Data 
data_iris <- iris[1:4] 
#Calculate the covariance matrix of the loaded iris data set 
Cov_data <- cov(data_iris ) 
# Find out the eigenvectors and eigenvalues using the covariance matrix 
Eigen_data <- eigen(Cov_data) 
#Calculate PCA 
PCA_data <- princomp(data_iris ,cor="False") 
#Compare the output variances

Eigen_data$values 
PCA_data$sdev^2 
PCA_data$loadings[,1:4] 
Eigen_data$vectors 

# view the summary of the model. 
summary(PCA_data) 

#Create a biplot of pca data 
png("pca-biplot.png") 
biplot (PCA_data) 
dev.off()

png("pca-screeplot.png") 
screeplot(PCA_data, type="lines") 
dev.off()

