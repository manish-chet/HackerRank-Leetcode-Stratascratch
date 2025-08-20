-- using JOIN
SELECT e1.Name AS Employee 
FROM Employee e1 
JOIN Employee e2 ON e1.ManagerId = e2.Id 
WHERE e1.Salary > e2.Salary;

-- using SUBQUERY
SELECT e.Name AS Employee
FROM Employee e
WHERE e.Salary > (
  SELECT m.Salary
  FROM Employee m 
  WHERE m.id = e.ManagerId)
