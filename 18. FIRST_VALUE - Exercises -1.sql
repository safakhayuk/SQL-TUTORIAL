select
BusinessEntityID ,
JobTitle,
HireDate,
VacationHours,
FirstHireVacationHours=FIRST_VALUE(vacationhours) over(partition by JobTitle order by hiredate)
from HumanResources.Employee
order by JobTitle, HireDate

