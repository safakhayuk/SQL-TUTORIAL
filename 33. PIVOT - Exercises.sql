select *
from
(select 
VacationHours,
JobTitle,
'Employee Gender'=Gender
from HumanResources.Employee) a
pivot (
sum(VacationHours)
for jobtitle in ([Sales Representative], [Buyer], [Janitor])) b