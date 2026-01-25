197. Rising Temperature
SELECT A.id
FROM Weather A
JOIN Weather B
    ON A.recordDate = DATEADD(day, 1, B.recordDate)
WHERE A.temperature > B.temperature;

595. Big Countries
Select name,population,area from World 
where area>=3000000 or population >=25000000

577. Employee Bonus
Select A.name , B.bonus
from Employee A 
left join Bonus B on A.empID=B.empID
where B.bonus is null or B.bonus<1000
  
584. Find Customer Referee
  Select name from Customer 
where referee_id is null or referee_id <>2

586. Customer Placing the Largest Number of Orders
WITH CTE AS (
    SELECT customer_number, COUNT(*) AS cnt
    FROM Orders
    GROUP BY customer_number
)
SELECT customer_number
FROM CTE
WHERE cnt = (
    SELECT MAX(cnt)
    FROM CTE
);
