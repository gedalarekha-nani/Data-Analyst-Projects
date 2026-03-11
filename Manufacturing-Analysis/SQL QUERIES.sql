Use manufacturing;

UPDATE manufacturing_data
SET Total_Manufactured = `produced qty` + `today manufactured qty`;


-- KPI(1) Manufacture Qty
SELECT SUM(Total_Manufactured) AS Manufacture_Qty
FROM manufacturing_data;


-- KPI(2) Rejected Qty
SELECT SUM(`Rejected Qty`) AS Rejected_Qty
FROM manufacturing_data;


-- KPI(3) Processed/Produced Qty
SELECT SUM(`Produced Qty`) AS Produced_Qty
FROM manufacturing_data;


-- KPI(4) Total Wastage % (safe division)
select concat(round((SUM(`Rejected Qty`)/(sum(Total_Manufactured)-SUM(`Rejected Qty`))) * 100,2),'%') AS Total_Wastage_Qty
FROM manufacturing_data;


-- KPI(5) Employee-wise Rejected Qty
SELECT `Emp Name`, SUM(`Rejected Qty`) AS Emp_Wise_Rejected_Qty
FROM manufacturing_data
GROUP BY `Emp Name`
ORDER BY Emp_Wise_Rejected_Qty DESC;


-- KPI(6) Machine-Wise Rejected Qty(top 5)
SELECT `Machine Code`, SUM(`Rejected Qty`) AS Machine_Wise_Rejected_Qty
FROM manufacturing_data
GROUP BY `Machine Code`
ORDER BY Machine_Wise_Rejected_Qty DESC
LIMIT 5;


-- KPI(7) Production Comparision Trend
select monthname(`Doc Date`) as Month_Name, 
SUM(`Produced Qty`) as Monthly_producton_trend
from manufacturing_data
group by month(`Doc Date`), Month_Name
order by month(`Doc Date`);


-- KPI(8) Manufacture Vs Rejected
select (SUM(Total_Manufactured)) as Total_Manufactured,
         SUM(`Rejected Qty`) as Total_Rejected
         from manufacturing_data;


-- KPI(9) Department wise manufacture vs rejected
SELECT `Department Name`, SUM(Total_Manufactured)as Manufactured_Qty, 
SUM(`Rejected Qty`) as Rejected_Qty,
CONCAT(ROUND(SUM(`Rejected Qty`)*100/SUM(`Produced Qty`),2),"%") as Rej_Percent 
from manufacturing_data 
group by `Department Name` 
order by Rejected_Qty desc;
