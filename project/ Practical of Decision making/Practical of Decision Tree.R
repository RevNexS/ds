# Load the party package. It will automatically load other 
# dependent packages. 
library(party) 
# Print some records from data set readingSkills. 
print(head(readingSkills))

# Create the input data frame. 
input.dat <- readingSkills[c(1:105),] 
# Give the chart file a name. 
png(file = "decision_tree.png") 
# Create the tree. 
output.tree <- ctree(nativeSpeaker ~ age + shoeSize + score, data = input.dat) 
# Plot the tree. 
plot(output.tree) 
# Save the file. 
dev.off()

#From the decision tree shown above we can conclude that anyone whose readingSkills score is less than 38.3 and age is more than 6 is not a native Speaker. 

# Create the Data in form of table 
dat <- read.table(text =" 
 Outlook Temp Humidity Windy Play 
 1 Sunny Hot High FALSE No 
 2 Sunny Hot High TRUE No 
 3 Overcast Hot High FALSE Yes 
 4 Rainy Mild High FALSE Yes 
 5 Rainy Cool Normal FALSE Yes 
 6 Rainy Cool Normal TRUE No 
 7 Overcast Cool Normal TRUE Yes 
 8 Sunny Mild High FALSE No 
 9 Sunny Cool Normal FALSE Yes 
 10 Rainy Mild Normal FALSE Yes 
 11 Sunny Mild Normal TRUE Yes 
 12 Overcast Mild High TRUE Yes 
 13 Overcast Hot Normal FALSE Yes 
 14 Rainy Mild High TRUE No" 
) 
dat$Windy <- as.factor(dat$Windy) 

#install Party Package 
install.packages(“C50) 
#use package 
library(C50) 
#Create Tree Model 
c5_mod <- C5.0(Play ~ Outlook + Temp + Humidity + Windy, data = dat) 
#Visualize the Decision Tree 
plot(c5_mod)

