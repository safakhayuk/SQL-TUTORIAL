select
p.ProductID, p.Name as ProductName, pl.ListPrice, pl.ModifiedDate,
HighestPrice=FIRST_VALUE(pl.listprice) over(partition by p.productID order by pl.listprice desc),
LowestPrice=FIRST_VALUE(pl.listprice) over(partition by p.productID order by pl.listprice),
PriceRange=FIRST_VALUE(pl.listprice) over(partition by p.productID order by pl.listprice desc)-
	FIRST_VALUE(pl.listprice) over(partition by p.productID order by pl.listprice)
from Production.Product p
join Production.ProductListPriceHistory pl on pl.ProductID=p.ProductID
order by ProductID, ModifiedDate