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
  
