###--------------------------------------
#Student Name: Alec Gray
#GNumber: G00758578
###--------------------------------------
#PLEASE MAKE SURE YOU ARE IN THE CORRECT DIRECTORY
#PLEASE MAKE SURE PACKAGES ARE INSTALLED BEFORE RUNNING 

rm(list=ls())

employees <- read.csv('~/Desktop/AIT_580/Datasets/EmployeeAttrition.csv')
#sqldf is a package that implements RSQLite, which allows R to run Sql-like queries
#install.packages("sqldf")
library(sqldf)


print("a. Find the number of rows and columns in the dataset (5 points)")
query_1 <- sqldf("select count(*) as count from employees;")
print(query_1)
print("ncol gives the number of columns in the dataframe")
print(ncol(employees))

print("b. Find the maximum Age in the dataset (5 points)")
query_2 <- sqldf("select max(Age) as oldest from employees;")
print(query_2)

print("c. Find the minimum DailyRate in the dataset (5 points)")
query_3 <- sqldf("select min(DailyRate) Lowest_rate from employees")
print(query_3)

print("d. Find the average/mean MontlyIncome in the dataset (5 points)")
query_4 <- sqldf("select round(avg(MonthlyIncome), 2) as Average_Income from employees")
print(query_4)

print("e. How many employees rated WorkLifeBalance as 1 (5 points)")
query_5 <- sqldf("select count(*) as Employees from employees where WorkLifeBalance = 1;")
print(query_5)

print("f. What percent of total employees have TotalWorkingYears less than equal to 5? Also calculate the percentage for TotalWorkingYears greater than 5 (5 points)")
query_6 <- sqldf("select count(*) as lessEqualPercent from employees where TotalWorkingYears <= 5;")
query_7 <- sqldf("select count(*) as greaterPercent from employees where TotalWorkingYears > 5;")
query_8 <- sqldf("select count(*) from employees;")

#employees with less than or exactly 5 years of working experience
lessEqualPercent <- round((query_6/query_8)*100, 2)
print(lessEqualPercent)

#employees with more than 5 years of working experience
greatPercent <- round((query_7/query_8)*100, 2)
print(greatPercent)

print("g. Print EmployeeNumber, Department and MaritalStatus for those employees whose Attrition is Yes
      and RelationshipSatisfaction is 1 and YearsSinceLastPromotion is greater than 3 (10 points)")

query_9 <- sqldf("select EmployeeNumber as Enum, Department as Dept, MaritalStatus from employees
                  where Attrition = 'Yes' and RelationshipSatisfaction = 1 and YearsSinceLastPromotion > 3;")
print(query_9)
print("h. Find the mean, median, mode, standard deviation and frequency distribution of EnvironmentSatisfaction
        for males and females separately. (Hint: For frequency distribution use table() function (10 points)")

maleSubSet <- sqldf("select * from employees where Gender = 'Male'")
femaleSubSet <- sqldf("select * from employees where Gender = 'Female'")

satisfactionStats <- function(dframe){
  #the following displays the mean and median values
  
  print("Mean")
  print(round(mean(dframe$EnvironmentSatisfaction),2))
  print("Median")
  print(round(median(dframe$EnvironmentSatisfaction),2))
  print("Standard Deviation")
  print(round(sd(dframe$EnvironmentSatisfaction),2))
  
  #there is no mode function in R that provides highest frequency. In fact, 
  #the table() function gives the frequency distribution of the data, and from it
  #we can interpret the mode. The mode in this data is 4 (occuring 272 times)
  
  satisfactionRating <- table(dframe$EnvironmentSatisfaction)

  print("Satisfaction Rating")
  print(satisfactionRating)
  
  
  #barplot used instead to show frequency distribution
 
  tbl <- table(dframe$EnvironmentSatisfaction)
  barplot(tbl, col = 'purple4', main = 'Environment Satisfaction Ratings',
          xlab = 'Rating', ylab = 'Frequency')
}
print("Males")
satisfactionStats(maleSubSet)
print("Females")
satisfactionStats(femaleSubSet)
