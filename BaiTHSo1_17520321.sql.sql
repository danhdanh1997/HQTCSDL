-----------------BAI_2-------------
---CAU_1
select  cus.id, cus.name
from    s_customer cus
order by cus.id desc;


---CAU_4
select  emp.userid
from    s_emp emp
where   emp.id = 23;

---CAU_5
select  emp.first_name||' '||emp.last_name as Employees, dept_id
from    s_emp emp
where   dept_id = 10 or dept_id = 50
order by Employees;

---CAU_6
select  emp.first_name||' '||emp.last_name as Employees
from    s_emp emp
where   emp.first_name like '%S%' or emp.last_name like '%S%';

---CAU_7
select  emp.userid, emp.start_date
from    s_emp emp
where   emp.start_date between to_date('14/5/1990','dd/mm/yyyy') and to_date('26/5/1991','dd/mm/yyyy');

---CAU_8
select  emp.first_name||' '||emp.last_name as Employees, emp.salary
from    s_emp emp
where   emp.salary between 1000 and 2000;

---CAU_9
select  emp.first_name||' '||emp.last_name as Employee_Name, emp.salary as Mounthly_Salary
from    s_emp emp
where   emp.salary > 1350 and emp.dept_id in (31,42,50);

---CAU_10
select  emp.first_name||' '||emp.last_name as Employee_Name, emp.start_date
from    s_emp emp
where   extract(year from start_date) = 1991;

---CAU_11
select  emp.id, emp.first_name||' '||emp.last_name as Employee_Name, emp.salary
from    s_emp emp
where   emp.commission_pct = 15;

---CAU_12
select  last_name, start_date, to_char(next_day(add_months(start_date, 6),'MONDAY'),'fmDdspth "of" MONTH, YYYY')
from    s_emp;

---CAU_13
select  name
from    s_product
where   lower(name) like '%ski%';

---CAU_14
SELECT  last_name, ROUND(MONTHS_BETWEEN(SYSDATE, start_date)) MONTHS_WORKED
FROM    s_emp
ORDER BY MONTHS_BETWEEN(SYSDATE, start_date);

---CAU_15
select  count(distinct manager_id)
from    s_emp
where   manager_id is not null;

---CAU_16
select  max(total) Hightest, min(total) Lowest
from    s_ord;

---CAU_17
select  pro.id, pro.name, ite.quantity as ORDERED
from    s_item ite join s_product pro on ite.product_id = pro.id
where   ite.ord_id = 101;

---CAU_18
select  cus.id, cus.name, ord.id
from    s_customer cus left join s_ord ord on cus.id = ord.customer_id
order by cus.id;

---CAU_19
select  ord.customer_id, ite.product_id, ite.quantity
from    s_item ite join s_ord ord on ite.ord_id = ord.id
where   ord.total > 100000;

-----------------BAI_3-------------
---CAU_20
select  emp.id, emp.first_name||' '||emp.last_name as Employee_Name
from    s_emp emp
where   emp.id not in ( select distinct emp1.manager_id
                        from    s_emp emp1
                        where   emp1.manager_id is not null)
order by emp.id;

---CAU_21
select  name
from    s_product
where   name like 'Pro%'
order by name;

---CAU_22
select  name, short_desc
from    s_product
where   short_desc like '%bicycle%';

---CAU_23
select  short_desc
from    s_product;

---CAU_24
select  first_name||' '||last_name||'('||title||')' Cau_24
from    s_emp;

---CAU_25
select  distinct manager_id, count(manager_id) number_emp
from    s_emp
where   manager_id is not null
group by manager_id;

---CAU_26
select  distinct manager_id, count(manager_id) number_emp
from    s_emp
where   manager_id is not null
group by manager_id
having  count(manager_id) > 20;

---CAU_27
select  reg.id, reg.name, count(dep.id) number_dep
from    s_region reg join s_dept dep on dep.region_id = reg.id
group by reg.id, reg.name;

---CAU_28
select  cus.name, count(ord.id) number_order
from    s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name;

---CAU_29
select  cus.name, count(ord.id) number_order
from    s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name
order by count(ord.id) desc
fetch first 1 row only;

---CAU_30
select  cus.name
from    s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name
order by sum(ord.total) desc
fetch first 1 row only;

---CAU_31
select  emp.first_name, emp.last_name, emp.start_date
from    s_emp emp
where   emp.dept_id in (select  emp1.dept_id
                        from    s_emp emp1
                        where   emp1.first_name like '%Ben%');
---CAU_32
select  last_name, first_name, userid
from    s_emp
where   salary > (  select  avg(emp.salary)
                    from    s_emp emp);

---CAU_33
select  last_name, first_name, userid
from    s_emp
where   lower(last_name) like '%l%' and
        salary > (  select  avg(emp.salary)
                    from    s_emp emp);

---CAU_34
select  *
from    s_customer
where   id not in ( select  customer_id
                    from    s_ord);






