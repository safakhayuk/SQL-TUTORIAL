select p.Name, p.ListPrice, ps.Name, pc.Name, 
Price_Rank = Row_Number() over(order by ListPrice desc),
Category_Price_Rank =Row_Number() over(partition by pc.ProductCategoryID order by ListPrice desc),
Category_Price_Rank_With_Rank=RANK() over(partition by pc.ProductCategoryID order by ListPrice desc),
Category_Price_Rank_With_Dense_Rank=DENSE_RANK() over(partition by pc.ProductCategoryID order by ListPrice desc),
row_top_5= case when Row_Number() over(partition by pc.ProductCategoryID order by ListPrice desc)<=5
then 'Yes'
Else 'No'
end,
rank_top_5=case when Rank() over(partition by pc.ProductCategoryID order by ListPrice desc)<=5
then 'Yes'
Else 'No'
end,
dense_rank_top_5=case when dense_Rank() over(partition by pc.ProductCategoryID order by ListPrice desc)<=5
then 'Yes'
Else 'No'
end
from Production.Product p
inner join Production.ProductSubcategory ps on ps.ProductSubcategoryID=p.ProductSubcategoryID
inner join Production.ProductCategory pc on pc.ProductCategoryID=ps.ProductCategoryID