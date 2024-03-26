/*
	NALOGE ZA PB JADRALEC
*/
-- 1.
SELECT ime
FROM jadralec
WHERE rating mod 2 = 0;
-- 2.
SELECT DISTINCT c1.ime
FROM coln c1, coln c2
WHERE c1.cid != c2.cid AND c1.ime = c2.ime;
-- 3.
SELECT ime
FROM jadralec
WHERE rating mod 2 = 1;
-- 4.
SELECT c.ime
FROM coln c
JOIN rezervacija r ON r.cid = c.cid
JOIN jadralec j ON j.jid = r.jid
WHERE c.dolzina > 35 AND j.starost <= 35;
-- 5.
SELECT j.ime, r.dan
FROM jadralec j
JOIN rezervacija r ON r.jid = j.jid
JOIN coln c ON c.cid = r.cid
WHERE c.ime = "Bavaria" or c.ime = "Sun Odyssey";
-- 6.
SELECT j1.ime
FROM jadralec j1, jadralec j2
WHERE j1.jid != j2.jid AND j1.ime = j2.ime;
-- 7.
SELECT j.ime
FROM jadralec j
JOIN rezervacija r ON r.jid = j.jid
JOIN coln c ON c.cid=r.cid
WHERE YEAR(dan) = 2006 AND MONTH(dan) IN (4,5,6,7,8,9)
	AND c.ime LIKE "%sun%";
/*
	NALOGE ZA EMPLOYEES
*/
-- 1.
SELECT last_name
FROM employees
WHERE last_name LIKE "%ski%";
-- 2.
SELECT dept_name
FROM departments;
-- 3.
SELECT e.first_name, e.last_name
FROM employees e
JOIN salaries s ON s.emp_no=e.emp_no
WHERE s.salary >= 70000
group by e.first_name, e.last_name
having sum(datediff(s.to_date, s.FROM_date)) > 365;
-- 4.
SELECT e.first_name, e.last_name
FROM employees e
JOIN titles t ON t.emp_no=e.emp_no
WHERE t.title = "Senior Staff";
-- 5.
SELECT last_name
FROM employees
WHERE last_name LIKE "pea%";
-- 6.
SELECT last_name, title
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
WHERE last_name LIKE "pea%";
-- 7.
SELECT *
FROM employees
WHERE YEAR(birth_date) between 1950 AND 1960
		AND first_name rLIKE ".*[a|e|i|o|u]$"
        AND YEAR(hire_date) >= 1990;
/*
	NALOGE ZA TRAVIAN
*/
-- 1.
SELECT *
FROM aliansa
WHERE alliance LIKE "%mgp%";
-- 2.
SELECT tribe
FROM pleme;
-- 3.
SELECT player
FROM igralec i
JOIN naselje n ON i.pid=n.pid
WHERE population >= 1000;
-- 4.
SELECT village
FROM igralec i
JOIN naselje n ON n.pid = i.pid
WHERE player = "Ronin";
-- 5.
SELECT player
FROM igralec
WHERE player LIKE "moj%";
-- 6.
SELECT player, tribe
FROM igralec i
JOIN pleme p ON p.tid = igralec.tid
WHERE player LIKE "moj%";
-- 7.
SELECT n.*
FROM naselje n
WHERE x >= 0 AND y >= 0 AND population >= 750
	AND village rLIKE ".*[a|e|i|o|u]$";
