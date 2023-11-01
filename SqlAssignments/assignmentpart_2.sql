use assignments;
/* question 1  */
select * from employee
where deptno=10 and salary>=3000;

/* question 2  */


select * from students ;
select id,name,marks,case
when marks between 40 and 50 then 'Second Class'
when marks between 50 and 60 then 'First Class'
when marks between 60 and 80 then'First Class'
when marks between 80 and 100 then 'Distinctions'
else'fail' end as 'student_grades' from students ;

alter table students add column  student_grades varchar(20) after marks;
set sql_safe_updates=0;
update students set
student_grades =case
when marks between 40 and 50 then 'Second Class'
when marks between 50 and 60 then 'First Class'
when marks between 60 and 80 then'First Class'
when marks between 80 and 100 then 'Distinctions'
else'fail' end;
select * from students ;

select  student_grades,count(student_grades) as First_class from students
 group by student_grades
 having student_grades='First Class';

select  student_grades,count(student_grades) as Distinctions from students
 group by student_grades
 having student_grades='Distinctions';

 /* question 3  */ 
 select distinct id,city from station
 where id mod 2 = 0 
 order by city ;
 
  /* question 4  */
  

select count(city) as'Count of all Cities' from station;
select COUNT(distinct city) 'distinct Count of all Cities' from station;

    
select count(city) - count( distinct city) as 'the difference between the total number of city '
	from station;
    
    /* question 5  */
    select * FROM STATION ;

select distinct CITY FROM STATION 
WHERE city REGEXP '^[a e i o u]' order by city;

#or
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) IN ('a','e','i','o','u')  order by city;

select distinct CITY FROM STATION 
WHERE city REGEXP '^[a e i o u]' and city regexp '[a e i o u]$'  order by city;

select distinct CITY FROM STATION 
WHERE city not REGEXP '^[a e i o u]' order by city;

select distinct CITY FROM STATION 
WHERE city not REGEXP '^[a e i o u]' and city not regexp '[a e i o u]$'  order by city;

/* question 6 */

select * from emp;

SELECT *
FROM Emp 
WHERE Salary > 2000
  AND Hire_Date<=DATE_SUB(CURRENT_DATE(),INTERVAL 36 MONTH)
ORDER BY emp_no ;


-- question 7

select deptno,sum(salary) from employee
group by deptno ;

/* question 8  */

select * from city;

select name as City,population from city
where population > 100000
order by population desc;

/* question 9 */

select sum(population) from city where  district='California'
group by population;

/* question 10  */

select district,avg(population) as 'avg_population' from city 
group by district ;

/* question 11  */

select orderNumber,orders.customernumber,customerName,status,comments from customers
right join orders 
using (customernumber)
where status ='disputed';