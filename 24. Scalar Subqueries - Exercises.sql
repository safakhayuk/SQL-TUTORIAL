select
BusinessEntityID,
JobTitle,
VacationHours,
MaxVacationHours= (select MAX(VacationHours) from HumanResources.Employee),
Percent_VacationHours=REPLACE(FORMAT(VacationHours * 1.0 / (SELECT MAX(VacationHours) FROM HumanResources.Employee),'N2'),'.',',')
from HumanResources.Employee
where 
VacationHours * 1.0 / (SELECT MAX(VacationHours) FROM HumanResources.Employee)>=0.8

