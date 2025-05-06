select *,
Rolling3MonthTotal= SUM(Total) over(order by OrderYear, OrderMonth Rows between 2 preceding and current row),
MovingAvg6Month= AVG(Total) over(order by OrderYear, OrderMonth Rows between 6 preceding and 1 preceding),
MovingAvgNext2Months=AVG(Total) over(order by OrderYear, OrderMonth Rows between current row and 2 following)
from 
(select 
OrderYear=Year(orderdate),
OrderMonth=MONTH(orderdate),
Total= sum(SubTotal)
from Purchasing.PurchaseOrderHeader
group by Year(orderdate),MONTH(orderdate)
) a
order by OrderYear, OrderMonth