select 
PurchaseOrderID,
VendorID,
OrderDate,
TotalDue,
NonRejectedItems= 
(select 
COUNT(po.PurchaseOrderID) 
from Purchasing.PurchaseOrderDetail po 
where po.PurchaseOrderID=ph.PurchaseOrderID and po.RejectedQty=0),
MostExpensiveItem=
(select 
max(po.UnitPrice) 
from Purchasing.PurchaseOrderDetail po 
where po.PurchaseOrderID=ph.PurchaseOrderID)
from Purchasing.PurchaseOrderHeader ph