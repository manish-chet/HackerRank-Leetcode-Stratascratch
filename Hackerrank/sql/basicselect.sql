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
