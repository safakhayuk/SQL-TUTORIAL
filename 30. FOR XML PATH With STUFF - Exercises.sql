select 
SubcategoryName=ps.Name,
Products= 
stuff(
		(
		select 
		';' + pp.Name
		from Production.Product pp
		where pp.ProductSubcategoryID=ps.ProductSubcategoryID
		and ListPrice>50
		for xml path('')
		),
		1,1,'')
from Production.ProductSubcategory ps