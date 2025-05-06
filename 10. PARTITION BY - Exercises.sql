SELECT 
pp.Name, pp.ListPrice, ps.Name, pc.Name,
AvgPriceByCategory = AVG(listprice) over(partition by pc.productcategoryID),
AvgPriceByCategoryAndSubcategory = avg(listprice) over(partition by pc.productcategoryID, ps.ProductSubcategoryID),
ProductVsCategoryDelta= listprice-AVG(listprice) over(partition by pc.productcategoryID)
from Production.Product pp
inner join Production. ProductSubcategory ps on ps.ProductSubcategoryID=pp.ProductSubcategoryID
inner join Production. ProductCategory pc on pc.ProductCategoryID=ps.ProductCategoryID