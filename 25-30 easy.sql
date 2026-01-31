1327. List the Products Ordered in a Period
/* Write your T-SQL query statement below */
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
    ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01'
  AND o.order_date <  '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

1179. Reformat Department Table
-- SELECT
--     id,
--     SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
--     SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
--     SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
--     SUM(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
--     SUM(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
--     SUM(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
--     SUM(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
--     SUM(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
--     SUM(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
--     SUM(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
--     SUM(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
--     SUM(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
-- FROM Department
-- GROUP BY id;
/* Write your T-SQL query statement below */
SELECT
    id,
    MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
    MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
    MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
    MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
    MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
    MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
    MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
    MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
    MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
    MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
    MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
    MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id


1407. Top Travellers
SELECT 
    u.name,
    COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r
    ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;

