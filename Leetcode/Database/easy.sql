----------Duplicate-Emails----------
SELECT  email
FROM person
GROUP BY email
HAVING COUNT(*) > 1

----------TRIANGLE-JUDGEMENT----------
SELECT x, y, z,
       CASE 
         WHEN x + y > z AND x + z > y AND y + z > x 
           THEN 'Yes'   -- It **is** a valid triangle
         ELSE 'No'      -- It is **not** a valid triangle
       END AS triangle
FROM triangle;

----------Employee-bonus----------
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b 
    ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

----------Employee-earning-more-than-manager----------

SELECT e1.Name AS Employee 
FROM Employee e1 
JOIN Employee e2 ON e1.ManagerId = e2.Id 
WHERE e1.Salary > e2.Salary;


SELECT e.Name AS Employee
FROM Employee e
WHERE e.Salary > (
  SELECT m.Salary
  FROM Employee m 
  WHERE m.id = e.ManagerId)

----------Gameplay-Analysis----------
select player_id,
       min(event_date) as first_login 
FROM activity
group by player_id

----------Delete-duplciate-emails----------
DELETE p1 
FROM Person p1, Person p2
WHERE p1.email = p2.email
AND p1.id > p2.id;

----------Customer-who-never-order----------
SELECT name AS Customers 
FROM Customers
WHERE id NOT IN (SELECT customerId  
                 FROM Orders);
                 

SELECT name AS Customers
FROM Customers c
LEFT JOIN Orders o 
ON c.id = o.customerId
WHERE o.CustomerId IS NULL;


SELECT name AS Customers 
FROM Customers c
WHERE NOT EXISTS (
    SELECT customerId 
    FROM Orders o
    WHERE c.id = o.customerId);

----------Find-valid-emails----------
select * from users where email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$';

----------customer-placing-largest-number-of-orders----------
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;
----------Big-countries----------
select name,population,area
from world
where (population >= 25000000) or (area >=3000000)
----------classes-with-atleast-5-students----------
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
----------sales-person----------
SELECT s.name
FROM SalesPerson s
WHERE s.sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);
----------biggest-single-number----------
SELECT (
    SELECT MAX(num)
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    ORDER BY num DESC
    limit 1
) AS num;
----------not-boring-movies----------
select * 
from cinema
where (id%2)!=0 and description!='boring'
order by rating desc
