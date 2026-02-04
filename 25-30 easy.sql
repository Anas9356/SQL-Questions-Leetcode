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

1484. Group Sold Products By The Date

SELECT
    sell_date,
    COUNT(product) AS num_sold,
    STRING_AGG(product, ',') 
        WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
) t
GROUP BY sell_date
ORDER BY sell_date;


1211. Queries Quality and Percentage
SELECT
    query_name,
    ROUND(
        AVG(1.0 * rating / position),
        2
    ) AS quality,
    ROUND(
        100.0 * SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
1633. Percentage of Users Attended a Contest
/* Write your T-SQL query statement below */
SELECT
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY
    percentage DESC,
    r.contest_id ASC;




