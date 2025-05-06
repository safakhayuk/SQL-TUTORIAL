select * 
from

(select 
PurchaseOrderID,
VendorID,
OrderDate,
TaxAmt,
Freight,
TotalDue,
Most_expensive=ROW_NUMBER() over(partition by VendorID order by TotalDue desc)
from Purchasing.PurchaseOrderHeader) a

where Most_expensive in (1,2,3)

--exercise2
select * 
from

(select 
PurchaseOrderID,
VendorID,
OrderDate,
TaxAmt,
Freight,
TotalDue,
Most_expensive=Dense_Rank() over(partition by VendorID order by TotalDue desc)
from Purchasing.PurchaseOrderHeader) a

where Most_expensive in (1,2,3)