1. 
  select count(*)
  from city
  where population > 100000
2.
  select sum(population) 
  from city
  where district='California'
3.
  select avg(population) 
  from city
  where district='California
4.
  select floor(avg(population))
  from city
5. 
  select sum(population)
  from city
  where countrycode='JPN'
6. 
  select max(population) - min(population) as difference
  from city
7. 
  SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', ''))) AS error_amount FROM EMPLOYEES
8. 
  select (months*salary), count(months*salary)
  from employee
  group by (months*salary)
  order by (months*salary) desc
  limit 1
9.
  select round(sum(lat_n),2),
       round(sum(long_w),2)
  from station
10. 
  select round(sum(lat_n),4)
  from station
  where (lat_n > 38.7880 and lat_n < 137.2345)
11. 
  select round(max(lat_n),4)
  from station
  where  lat_n < 137.2345
12.
  SELECT ROUND(LONG_W, 4)
  FROM STATION
  WHERE LAT_N = (
      SELECT MAX(LAT_N)
      FROM STATION
      WHERE LAT_N < 137.2345
  )
13.  
  select round(min(lat_n),4)
  from station
  where  lat_n > 38.7780
14.
  SELECT ROUND(LONG_W, 4)
  FROM STATION
  WHERE LAT_N = (
      SELECT min(LAT_N)
      FROM STATION
      WHERE LAT_N > 38.7780
  )
15.
  SELECT ROUND(
    (ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W))),
    4
  ) AS manhattan_distance
  FROM STATION
16.
  SELECT ROUND(
    SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW(MAX(LONG_W) - MIN(LONG_W), 2)),
    4
  ) AS euclidean_distance
  FROM STATION
17.
  SELECT ROUND(AVG(LAT_N), 4) AS median_lat
  FROM (
      SELECT LAT_N,
             ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
             COUNT(*) OVER () AS total_count
      FROM STATION
  ) sub
  WHERE row_num IN (
      (total_count + 1) / 2,
      (total_count + 2) / 2
  )

