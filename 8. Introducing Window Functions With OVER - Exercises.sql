SELECT FirstName, LastName, JobTitle, Rate, 
AverageRate= avg(Rate) over(),
MaximumRate= max(Rate) over(),
DiffFromAvgRate = Rate-avg(Rate) over(),
PercentofMaxRate = Rate/max(Rate) over()
FROM Person.Person pp 
inner join HumanResources.Employee  H on h.BusinessEntityID=pp.BusinessEntityID
inner join HumanResources.EmployeePayHistory He on he.BusinessEntityID=pp.BusinessEntityID