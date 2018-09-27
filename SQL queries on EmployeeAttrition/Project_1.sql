--Homework 5 SQL Statements
--setting up employee_attrition table and linking it to EmployeeAttrition.csv
CREATE TABLE employee_attrition(
  age int NOT NULL, 
  attrition varchar(5) NOT NULL,
  businesstravel varchar(50) NOT NULL,
  dailyrate int NOT NULL,
  department varchar(100) NOT NULL,
  distanceFromHome int NOT NULL,
  education int NOT NULL,
  educationField varchar(50) NOT NULL,
  employeeCount int NOT NULL,
  employeeNumber int NOT NULL,
  environmentSatisfaction int NOT NULL,
  gender varchar(6) NOT NULL,
  hourlyRate int NOT NULL,
  jobInvolvement smallint NOT NULL,
  jobLevel smallint NOT NULL,
  jobRole varchar(50) NOT NULL,
  jobSatisfaction smallint NOT NULL,
  maritalStatus varchar(10) NOT NULL,
  monthlyIncome int NOT NULL,
  monthlyRate int NOT NULL,
  numCompaniesWorked smallint NOT NULL,
  over18 char(1) NOT NULL,
  overTime varchar(3) NOT NULL,
  percentSalaryHike smallint NOT NULL,
  performanceRating smallint NOT NULL,
  relationshipSatisfaction smallint NOT NULL,
  standardHours int NOT NULL,
  stockOptionLevel smallint NOT NULL,
  totalWorkingYears int NOT NULL,
  trainingTimesLastYear smallint NOT NULL,
  workLifeBalance smallint NOT NULL,
  yearsAtCompany int NOT NULL,
  yearsInCurrentRole int NOT NULL,
  yearsSinceLastPromotion int NOT NULL,
  yearsWithCurrManager int NOT NULL
  
);

COPY employee_attrition(
age, attrition, businesstravel,
dailyrate, department, distanceFromHome,
education, educationField, employeeCount,
employeeNumber, environmentSatisfaction,
gender, hourlyRate, jobInvolvement,
jobLevel, jobRole, jobSatisfaction,
maritalStatus, monthlyIncome, monthlyRate,
numCompaniesWorked, over18, overTime, percentSalaryHike,
performanceRating, relationshipSatisfaction,
standardHours, stockOptionLevel, totalWorkingYears,
trainingTimesLastYear, workLifeBalance,
yearsAtCompany, yearsInCurrentRole, yearsSinceLastPromotion,
yearsWithCurrManager
)
FROM '/home/administrator/Documents/EmployeeAttrition(1).csv' DELIMITER ',' CSV HEADER;

--1. Write an SQL query to create table for given dataset. Use the SQL command below to display the
--characteristics of the table.	
SELECT * FROM information_schema.columns WHERE table_name =
'employee_attrition';

--2.a. Count the total number of records in the table. (5 points)
--Answer: 1470
SELECT count(*) as Records
FROM employee_attrition;

--2.b. How many unique JOBROLE	are there in the dataset. Order them by	alphabetical order from	A to Z. (5 points)
--Answer: 9
SELECT DISTINCT jobrole 
FROM employee_attrition
ORDER BY jobrole ASC;

--2.c. Find EMPLOYEENUMBER, EDUCATIONFIELD, JOBROLE for all the	employees whose AGE is	
--greater than 50 and ATTRITION	is YES
--Answer: Please see output
SELECT employeeNumber as eNum, educationField as eField, jobRole as jRole
FROM employee_attrition
WHERE age > 50 AND attrition != 'No';

--2.d. Count the different MARITALSTATUS when ATTRITION is YES in the dataset. Arrange the count in descending order
--(Hint: Use GROUP BY statement)
--Answer: Single-120, Married-84, Divorced-33
SELECT maritalStatus, count(*) as Total
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY maritalStatus;

--2.e.For each JOBROLE	when the ATTRITION is No, find the average MONTHLYINCOME for only those	employees 
--having DAILYRATE greater than or equal to 110 (Hint: Use GROUP BY and HAVING statements together) 
--I didn't use Having as it didn't seem necessary or helpful for this question
--Answer: Please see output
SELECT jobRole, round(avg(monthlyIncome), 2) as Avg_Monthly
FROM employee_attrition
WHERE attrition = 'No' AND dailyRate >= 110
GROUP BY jobRole;

