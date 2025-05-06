select
po.PurchaseOrderID, po.OrderDate, po.TotalDue, pv.Name,
PrevOrderFromVendorAmt= Lag(TotalDue,1) over(partition by VendorID order by orderdate),
NextOrderByEmployeeVendor = LEAD(pv.name,1) over(partition by EmployeeID order by orderdate),
Next2OrderByEmployeeVendor=LEAD(pv.name,2) over(partition by EmployeeID order by orderdate)
from Purchasing.PurchaseOrderHeader po
Join Purchasing.Vendor pv on po.VendorID = pv.BusinessEntityID
where po.OrderDate>='2013-01-01' and po.TotalDue>500
order by VendorID

