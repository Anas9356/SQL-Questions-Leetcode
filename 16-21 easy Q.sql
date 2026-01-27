627. Swap Sex of Employees
UPDATE Salary
SET sex =
    CASE
        WHEN sex = 'm' THEN 'f'
        WHEN sex = 'f' THEN 'm'
        ELSE sex
    END;

1050. Actors and Directors Who Cooperated At Least Three Times
SELECT 
    actor_id,
    director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

1068. Product Sales Analysis I
Select S.year,S.price,P.product_name from Sales S
inner join Product P on S.product_id = P.product_id  
  
1075. Project Employees I
SELECT 
    p.project_id,
    ROUND(AVG(CAST(e.experience_years AS DECIMAL(10,2))), 2) AS average_years
FROM Project p
JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;

1084. Sales Analysis III
-- SELECT p.product_id, p.product_name
-- FROM Product p
-- JOIN Sales s
--     ON p.product_id = s.product_id
-- GROUP BY p.product_id, p.product_name
-- HAVING 
--     MIN(s.sale_date) >= '2019-01-01'
--     AND MAX(s.sale_date) <= '2019-03-31';

SELECT p.product_id, p.product_name
FROM Product p
WHERE EXISTS (
    SELECT 1
    FROM Sales s
    WHERE s.product_id = p.product_id
      AND s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
)
AND NOT EXISTS (
    SELECT 1
    FROM Sales s
    WHERE s.product_id = p.product_id
      AND s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
);
