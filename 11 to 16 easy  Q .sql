
596. Classes With at Least 5 Students
Select class from Courses 
group by class
having count(class)>=5
607. Sales Person
-- Select Distinct S.name from SalesPerson S
-- left join Orders O on S.sales_id =O.sales_id
-- left join Company  C on  O.com_id =C.com_id 
-- where O.com_id is null or O.com_id<>1

SELECT S.name
FROM SalesPerson S
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders O
    JOIN Company C
        ON O.com_id = C.com_id
    WHERE O.sales_id = S.sales_id
      AND C.name = 'RED'
);


610. Triangle Judgement
SELECT 
    x,
    y,
    z,
    CASE 
        WHEN x + y > z 
         AND x + z > y 
         AND y + z > x 
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;


619. Biggest Single Number
Select max(num) as num from (select num from MyNumbers 
group by num having count(num)=1 )t 

620. Not Boring Movies
