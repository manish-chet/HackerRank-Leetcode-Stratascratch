1. 
       SELECT CASE WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle' 
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR B = C OR C = A THEN 'Isosceles' 
            ELSE 'Scalene'
       END AS TriangleType FROM TRIANGLES;
2.
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
3.
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
4.       
       select N,
       case when N not in (select  distinct P from BST where P is not null) then 'Leaf'
            when P is null then 'Root'
            else 'Inner'
       end as node_type
       from BST
       order by N

5.       
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
