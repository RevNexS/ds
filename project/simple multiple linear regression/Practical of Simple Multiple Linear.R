# Practical of simple/multiple linear regression

# Height 151 174 138 186 128 136 179 163 152 
# Weight 63 81 56 91 47 57 76 72 62

H<-c(151,174,138,186,128,136,179,163,152,131) 
W<-c(63,81,56,91,47,57,76,72,62,48)
relation<-lm(W~H) 
print(relation) 
print(summary(relation)) 
png(file="linreg.png") 
plot(W,H,col="blue", main="Height and Weight regression", abline(relation),cex=1.3, pch=16, xlab="Weight in 
KG", ylab="Height in Cms") 
dev.off()
newdata<-data.frame(H=170)
result<-predict(relation,newdata) 
print(result)

# Experiment using R (using in-built datasets e.g. Iris) 

# Perform linear regression on the iris dataset of R for predicting sepal.length on sepal.width

lm(Petal.Width ~ Petal.Length, data=iris)$coefficients

plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Iris 
Data", xlab="Petal length", ylab="Petal width")
summary(lm(Petal.Width ~ Petal.Length, data=iris))

# Experiment using R (Multiple Regression)

#Load the data of mtcars 
input<-mtcars[,c("mpg","disp","hp","wt")] 
#print the cars data 
print(head(input)) 
#Creating Relationship Model 
model<-lm(mpg~disp+hp+wt, data=input) 
print(model) 
# Printing the Co-efficient 
cat("### The Coefficient VALUES # # #","\n") 
a<-coef(model)[1] 
xdisp<-coef(model)[2] 
xhp<-coef(model)[3] 
xwt<-coef(model)[4] 
print(a) 
print(xdisp)
#creating equation for regression model 
y=a+xdisp.x1+xhp.x2+xwt.x3 
#applying equation to predict new values 
#For car with disp=221, hp=102 and wt=2.91, predict the milage 
#creating equation for regression model 
#y=a+xdisp.x1+xhp.x2+xwt.x3 
x1<-221 
x2<-102 
x3<-2.91 
y=a+xdisp*x1+xhp*x2+xwt*x3 
print(y)

