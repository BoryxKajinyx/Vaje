/*
	NALOGE ZA PB JADRALEC
*/
-- 1.
select ime
from jadralec
where rating mod 2 = 0;
-- 2.
select distinct c1.ime
from coln c1, coln c2
where c1.cid != c2.cid and c1.ime = c2.ime;
-- 3.
select ime
from jadralec
where rating mod 2 = 1;
-- 4.
select c.ime
from coln c
join rezervacija r on r.cid = c.cid
join jadralec j on j.jid = r.jid
where c.dolzina > 35 and j.starost <= 35;
-- 5.
select j.ime, r.dan
from jadralec j
join rezervacija r on r.jid = j.jid
join coln c on c.cid = r.cid
where c.ime = "Bavaria" or c.ime = "Sun Odyssey";
-- 6.
select j1.ime
from jadralec j1, jadralec j2
where j1.jid != j2.jid and j1.ime = j2.ime;
-- 7.
select j.ime
from jadralec j
join rezervacija r on r.jid = j.jid
join coln c on c.cid=r.cid
where year(dan) = 2006 and month(dan) in (4,5,6,7,8,9)
	and c.ime like "%sun%";
/*
	NALOGE ZA EMPLOYEES
*/
-- 1.
select last_name
from employees
where last_name like "%ski%";
-- 2.
select dept_name
from departments;
-- 3.
select e.first_name, e.last_name
from employees e
join salaries s on s.emp_no=e.emp_no
where s.salary >= 70000
group by e.first_name, e.last_name
having sum(datediff(s.to_date, s.from_date)) > 365;
-- 4.
select e.first_name, e.last_name
from employees e
join titles t on t.emp_no=e.emp_no
where t.title = "Senior Staff";
-- 5.
select last_name
from employees
where last_name like "pea%";
-- 6.
select last_name, title
from employees
join titles on employees.emp_no = titles.emp_no
where last_name like "pea%";
-- 7.
select *
from employees
where year(birth_date) between 1950 and 1960
		and first_name rlike ".*[a|e|i|o|u]$"
        and year(hire_date) >= 1990;
/*
	NALOGE ZA TRAVIAN
*/
-- 1.
select *
from aliansa
where alliance like "%mgp%";
-- 2.
select tribe
from pleme;
-- 3.
select player
from igralec i
join naselje n on i.pid=n.pid
where population >= 1000;
-- 4.
select village
from igralec i
join naselje n on n.pid = i.pid
where player = "Ronin";
-- 5.
select player
from igralec
where player like "moj%";
-- 6.
select player, tribe
from igralec i
join pleme p on p.tid = igralec.tid
where player like "moj%";
-- 7.
select n.*
from naselje n
where x >= 0 and y >= 0 and population >= 750
	and village rlike ".*[a|e|i|o|u]$";
