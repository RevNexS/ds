#Read the data from Satindex.csv 
data2<-read.csv(file.choose(),sep=",",header = T) 
#display Column Names 
names(data2)
#display Summary 
summary(data2) 
#perform 2-way ANoVA 
anv1<-aov(formula = Satindex~ Dept+Experience+Dept*Experience = data2) 
summary(anv1)


# Create the data in CSV file using notepad and save the file as Heights.csv 
#Read the data from Heights.csv

#Girls height 155 152 157 144 168 150 152 155 158 138 145 150 155 167 155 
#Boys height 70 150 152 155 158 146 158 157 140 154 152 156 150 150 146

data1<-read.csv(file.choose(),sep = ",",header = T) 
#Display Column Names 
names(data1) 
#Display Summary 
summary(data1) 
head(data1) 

#Perform 1-Way ANoVA 
anv<-aov(formula = GirlsHeight~BoysHeight,data=data1) 
summary(anv)

#Visualize 1-Way ANoVA 
png(file="1-wAnova.png") 
plot(anv)

