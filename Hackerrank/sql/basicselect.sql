1.
       select * 
       from city
       where COUNTRYCODE='USA' and POPULATION>100000
2. 
       select name
       from city 
       where population>120000 and countrycode='USA'
3.
       select * from city
4. 
       select * 
       from city 
       where Id=1661
5.
       select * 
       from city 
       where countrycode ='JPN'
6. 
       select name
       from city 
       where countrycode='JPN'
7. 
       select city, state 
       from station
8. 
       select distinct(city)
       from station
       where (ID % 2)=0
9.
       select count(City) - count(distinct(City)) as difference
       from station
10. 
       select city, length(city) as c_len 
       from station 
       order by c_len asc, city asc 
       limit 1;
       select city, length(city) as c_len
       from station order by c_len desc, city asc
       limit 1;
11. 
       select distinct city
       from station 
       where city like 'A%' or
             city like 'E%' or
             city like 'I%' or
             city like 'O%' or
             city like 'U%' 

       SELECT DISTINCT city FROM station WHERE city REGEXP '^[AEIOUaeiou]';
12.
       select distinct city
       from station 
       where city like '%A' or
             city like '%E' or
             city like '%I' or
             city like '%O' or
             city like '%U' 

       SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '[aeiouAEIOU]$';
13.
        SELECT DISTINCT city 
        FROM station 
        WHERE city REGEXP '^[AEIOUaeiou]' 
        and 
         city REGEXP '[AEIOUaeiou]$'
14. 
        SELECT DISTINCT city 
        FROM station 
        WHERE city NOT REGEXP '^[AEIOUaeiou]' 
15.
        SELECT DISTINCT city 
        FROM station 
        WHERE city NOT REGEXP '[AEIOUaeiou]$' 
16.
        SELECT DISTINCT city 
        FROM station 
        WHERE city NOT REGEXP '^[AEIOUaeiou]' 
        or city NOT REGEXP '[AEIOUaeiou]$' 
17.      
        SELECT DISTINCT city 
        FROM station 
        WHERE city NOT REGEXP '^[AEIOUaeiou]' 
        and city NOT REGEXP '[AEIOUaeiou]$' 
18.
       select  name 
       from students 
       where marks > 75
       order by RIGHT(Name, 3),ID ASC
19.
       select name 
       from employee
       order by name asc
20.
       select name 
       from employee
       where salary > 2000 and months <10
       order by name asc
21. 
       SELECT CASE WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle' 
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR B = C OR C = A THEN 'Isosceles' 
            ELSE 'Scalene'
       END AS TriangleType FROM TRIANGLES;
22.
       select concat(name, 
              case when occupation='Doctor' then '(D)'
              when occupation='Singer' then '(S)' 
              when occupation='Actor' then '(A)' 
              when occupation='Professor' then '(P)' 
              end) 
       from occupations
       order by name; 
       -----
       select case when occupation='Doctor' then concat('There are a total of ',count(name),' doctors.') 
                   when occupation='Singer' then concat('There are a total of ',count(name),' singers.') 
                   when occupation='Actor' then concat('There are a total of ',count(name),' actors.')
                   when occupation='Professor' then concat('There are a total of ',count(name),' professors.') 
               end 
       from occupations
       group by occupation 
       order by count(name);
23.
       SELECT MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
       MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
       MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
       MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor     
       FROM
           ( select Name, Occupation, row_number() over (partition by Occupation order by Name) as rn
               from OCCUPATIONS
           )as sub
       GROUP BY rn
       order by rn;
24.       
       select N,
       case when N not in (select  distinct P from BST where P is not null) then 'Leaf'
            when P is null then 'Root'
            else 'Inner'
       end as node_type
       from BST
       order by N

25.       
       select c.company_code,
       c.founder,
       count(distinct lead_manager_code),
       count(distinct senior_manager_code),
       count(distinct manager_code),
       count(distinct employee_code)
       from Company c
            join Employee using (company_code)
       group by c.company_code, c.founder
       order by c.company_code

26.       
       

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT ceil(avg(Salary) - avg(REPLACE(Salary,'0',''))) FROM Employees;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------