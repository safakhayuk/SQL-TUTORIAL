--exercise 1
select 
PurchaseOrderID,
OrderDate,
SubTotal,
TaxAmt
from Purchasing.PurchaseOrderHeader ph
where exists (
select 1
from Purchasing.PurchaseOrderDetail po
where po.PurchaseOrderID=ph.PurchaseOrderID and OrderQty>500 )
order by 1


--exercise 2
select 
ph.*
from Purchasing.PurchaseOrderHeader ph
where exists (
select 1
from Purchasing.PurchaseOrderDetail po
where OrderQty>500 and UnitPrice>50 and
po.PurchaseOrderID=ph.PurchaseOrderID)
order by PurchaseOrderID


--exercise 3
select 
ph.*
from Purchasing.PurchaseOrderHeader ph
where not exists (
select 1
from Purchasing.PurchaseOrderDetail po
where RejectedQty>0 and
po.PurchaseOrderID=ph.PurchaseOrderID)
order by PurchaseOrderID

