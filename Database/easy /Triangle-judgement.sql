SELECT x, y, z,
       CASE 
         WHEN x + y > z AND x + z > y AND y + z > x 
           THEN 'Yes'   -- It **is** a valid triangle
         ELSE 'No'      -- It is **not** a valid triangle
       END AS triangle
FROM triangle;
