
-- 175. Combine Two Tables
Select firstName,lastName,city,state  from
Person P
left join
Address A on P.personID=A.personID


-- 181. Employees Earning More Than Their Managers
Select a.name as Employee from Employee a
join
 Employee b on b.id=a.managerId
 where a.salary>b.salary

-- 182. Duplicate Emails
SELECT Email 
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- 183. Customers Who Never Order
SELECT A.name As Customers 
    FROM Customers A
    LEFT JOIN Orders B
        ON A.id = B.customerId
    WHERE b.customerId IS NULL;

-- 196. Delete Duplicate Emails
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY email
               ORDER BY id
           ) AS rn
    FROM Person
)
DELETE FROM cte
WHERE rn > 1;


-- 511. Game Play Analysis I
select  player_id, event_date as first_login
from(
select *,
row_number() over(partition by  player_id  order by event_date) rn
from Activity)x
where x.rn = 1


