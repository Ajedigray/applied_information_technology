# Applied_Information_Technology
Projects From AIT 580

## Project_1.sql
Access the project by entering the `SQL queries on EmployeeAttrition` directory.

### Description and Purpose
1. This project requires a virtual machine with `pgAdmin III` installed
2. It creates a postgreSQL dataset from the `EmployeeAttrition(1).csv`
3. It answers the following questions
    - Write an SQL query to create table for given dataset. Use the SQL command below to display the characteristics of the table.
    
    `SELECT * FROM information_schema.columns WHERE table_name = 'employee_attrition';`
    
    - Count the total number of records in the table.
    - How many unique JOBROLE	are there in the dataset. Order them by	alphabetical order from	A to Z.
    - Find EMPLOYEENUMBER, EDUCATIONFIELD, JOBROLE for all the	employees whose AGE is greater than 50 and ATTRITION is YES
    - Count the different MARITALSTATUS when ATTRITION is YES in the dataset. Arrange the count in descending order.
    - For each JOBROLE	when the ATTRITION is No, find the average MONTHLYINCOME for only those	employees whose DAILYRATE is greater than or equal to 110.
  
 
 ## Project_2.js
 Access the project by entering the `NoSQL queries on EmployeeAttrition` directory.
 
 ### Description and Purpose
 1. This project requires a virtual machine with `Studio 3T Linux` installed
 2. It requires a connection to the `EmployeeAttrition(1).csv`file
 3. It answers the following questions
    - Count the	total	number	of	records	in	the	table.
    - How	many	unique	JOBROLE	are	there	in	the	dataset?
    - Find	EMPLOYEENUMBER,	EDUCATIONFIELD,	JOBROLE	for	all	the	employees whose	AGE	is greater than	equal	to 50	and ATTRITION is YES
    - Count	the	different	MARITALSTATUS	when	ATTRITION	is	YES	in	the	dataset. Arrange	the	count	in descending order
    - For each JOBROLE, find	the	average	MONTHLYINCOME. Arrange the	output	in	descending	order
    - For	all	the	employees	having	AGE	less	than	equal	to	18,	sort	the	DEPARTMENT	from	A	to	Z	first	and then EMPLOYEENUMBER	in	ascending	order
    
 ## employeeAttrition.R
 Access this project by entering the `R` directory. <br/>
 Review the Project_specificiations.pdf for instructions to interpret this project. <br/>
 This project performs queries and analysis on the `EmployeeAttrition.csv` dataset using the R
 programming language.
 
 ### Describption and Purpose
 1. This project requires either a virtual machine or Linux, Mac, or Windows Operating System
 2. It requires R or RStudio
 3. It answers the problems outlined in Project_specifications.pdf
