###--------------------------------------
#Student Name: Alec Gray
#GNumber: G00758578
###--------------------------------------

#PLEASE MAKE SURE YOU ARE IN THE RIGHT DIRECTORY
#PLEASE MAKE SURE PACKAGES ARE INSTALLED BEFORE RUNNING 
rm(list=ls())

#install.packages("sqldf")
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("corrplot")
library(sqldf)
library(ggplot2)
library(dplyr)
library(corrplot)
print("A. Identify data types for each attribute in the dataset (5 points)")
acme <- read.csv('~/Desktop/AIT_580/Datasets/Acme.csv')
print(sapply(acme, class))

print("B. Produce a summary statistics of each attribute in the dataset (5 points)")

for (i in 1:ncol(acme)) {
  print(colnames(acme[i]))
  print(summary(acme[,i]))
  
}

print("Produce Visulizations for each attribute (Hint: use hist() function) (5 points)")
years <- hist(acme$Years, xlab = paste(names(acme$Years)), 
     main = paste(names(acme$Years)), col = "purple4")

years

stSalary <- hist(acme$StSalary, xlab = paste(names(acme$StSalary)), 
     main = paste(names(acme$StSalary)), col = "purple4")

stSalary

gender <- ggplot(acme, aes(x = Gender, fill = Gender)) + geom_bar()
gender
degree <- ggplot(acme, aes(x = Degree, fill = Degree)) + geom_bar()

degree

print("Years of experience and starting salary for all employees")
plot(acme$Years, acme$StSalary, main = "Scatterplot", xlab = "Years",
     ylab = "StSalary", las = 1, col = 10)
males <- sqldf("select * from acme where Gender = 'M'")
females <- sqldf("select * from acme where Gender = 'F'")

par(mfrow=c(3,3))
plot(males$Years, males$StSalary, main = "Males Scatterplot", xlab = "Years",
     ylab = "StSalary", las = 1, col = 10)

plot(females$Years, females$StSalary, main = "Females Scatterplot", xlab = "Years",
     ylab = "StSalary", las = 1, col = 10)

BS <- sqldf("select * from acme where Degree = 'BS'")
plot(BS$Years, BS$StSalary, main = "BS Degree Scatterplot", xlab = "Years",
     ylab = "StSalary", las = 1, col = 10)

MS <- sqldf("select * from acme where Degree = 'MS'")
plot(MS$Years, MS$StSalary, main = "MS Degree Scatterplot", xlab = "Years",
     ylab = "StSalary", las = 1, col = 10)

pHD <- sqldf("select * from acme where Degree = 'PhD'")
plot(pHD$Years, pHD$StSalary, main = "PhD Degree Scatterplot", xlab = "Years",
     ylab = "StSalary", las = 1, col = 10)

print("Display the relationship between a. Years of Experience and Starting Salary for all
      employees (5 points) b. Years of Experience and Starting Salary for each gender
      (5 points) c. Years of Experience and Starting Salary for each degree (5 points)")

print("Starting salary has an overall strong positive correlation with years of experience 
      (0.71).
      It surprised me to see a stronger correlation of these two variables amongst
      females (0.75) rather than males (0.67) It makes sense that there does not 
      exist a strong correlation for each degree type. A starting salary with a 
      Masters (0.45) is slightly higher than a starting salary with a BS (0.36), which makes
      sense because a person could start a 'first job' with a MS and get paid more
      because of it. However, not many people are going to start off with a pHD (0.046).
      If we had data for salary increases, we would probably see a strong correlation
      between general salaries and degree type.")

print(cor(acme$Years, acme$StSalary))
print(cor(males$Years, males$StSalary))
print(cor(females$Years, females$StSalary))
print(cor(BS$Years, BS$StSalary))
print(cor(MS$Years, MS$StSalary))
print(cor(pHD$Years, pHD$StSalary))

print("4. What can you conclude about Acme with respect to gender bias after your
      overall analysis? (5 points)")
print("Both males and females will enjoy better starting pay with more years of experience,
      however, females are more likely than are males to consistently see a higher starting
      in this trend.")
