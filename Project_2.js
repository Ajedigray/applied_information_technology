db.employee_attrition.find({})
//1.a. Count the	total	number	of	records	in	the	table.
//Answer: 1470
db.employee_attrition.count()

//1.b. How	many	unique	JOBROLE	are	there	in	the	dataset.
//Answer:9
db.employee_attrition.distinct("JobRole").sort()

//1.c. c. Find	EMPLOYEENUMBER,	EDUCATIONFIELD,	JOBROLE	for	all	the	employees whose	AGE	is	
//greater than	equal	to	50	and	ATTRITION is YES	
//Answer: Please See output
db.employee_attrition.find(
{$and: [
  {Age: {$gte: 50}}, 
  {Attrition: "Yes"}
  ]},
 {_id: false,
   EmployeeNumber: true,
    EducationField: true, 
    JobRole: true
    }
)
//Count	the	different	MARITALSTATUS	when	ATTRITION	is	YES	in	the	dataset. Arrange	the	count	
//in	descending	order	(Hint:	aggregate function)	
//Answer: Single-120, Married-84, Divorced-33. Please see output for ordering.
db.employee_attrition.aggregate(
	[
		{$match: {Attrition: "Yes"}},
		{$group: {_id: "$MaritalStatus", total: {$sum: 1}}},
		{$sort: {total: -1}}
	]
)

//e. For each JOBROLE, find	the	average	MONTHLYINCOME. Arrange	the	output	in	descending	order	
//(Hint:	Use	aggregate	function)	
//Answer: Please see output
db.employee_attrition.aggregate(
	[
	  {$match: {}},
	  {$group: {_id: "$JobRole", average: {$avg: "$MonthlyIncome"}}},
	  {$sort: {average: -1}}  
	]
)

//. For	all	the	employees	having	AGE	less	than	equal	to	18,	sort	the	DEPARTMENT	from	A	to	Z	first	
//and then EMPLOYEENUMBER	in	ascending	order.	Print	only	DEPARTMENT	and	
//EMPLOYEENUMBER in	the	output. (Hint:	Use	sort	function	only)	
//Answer: Please see output.
db.employee_attrition.find(
	{
	  Age: {$lte: 18}
	},
	{
	  _id: false,
	  Department: true,
	  EmployeeNumber: true
	}
).sort({Department:1, EmployeeNumber: 1})




