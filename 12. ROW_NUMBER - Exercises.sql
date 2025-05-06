select p.Name, p.ListPrice, ps.Name, pc.Name,pc.ProductCategoryID,
Price_Rank = Row_Number() over(order by ListPrice desc),
Category_Price_Rank =Row_Number() over(partition by pc.ProductCategoryID order by ListPrice desc),
from Production.Product p
inner join Production.ProductSubcategory ps on ps.ProductSubcategoryID=p.ProductSubcategoryID
inner join Production.ProductCategory pc on pc.ProductCategoryID=ps.ProductCategoryID



---ex 4
select p.Name, p.ListPrice, ps.Name, pc.Name,pc.ProductCategoryID,
Price_Rank = Row_Number() over(order by ListPrice desc),
Category_Price_Rank =Row_Number() over(partition by pc.ProductCategoryID order by ListPrice desc),
Top_5_Price_In_Category = 
case when Row_Number() over(partition by pc.ProductCategoryID order by ListPrice desc)<=5
then 'Yes'
Else 'No'
end
from Production.Product p
inner join Production.ProductSubcategory ps on ps.ProductSubcategoryID=p.ProductSubcategoryID
inner join Production.ProductCategory pc on pc.ProductCategoryID=ps.ProductCategoryID