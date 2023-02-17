--ДЗ по SQL_Joins
--SQL HomeWork 2. Joins
--
--Подключится к 
--Host: 159.69.151.133
--Port: 5056
--DB: подключение к той таблице где делали DDL операции
--User: подключение к тем пользователем каким делали DDL операции
--Pass: 123
--
--Если для какого-то кейса надо сделать дополнительную таблицу, 
-- наполнить её данными, то делайте )


-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employees1.employee_name as name, salary1.monthly_salary as salary
from employees1, salary1, employee_salary1
where employee_salary1.employee_id = employees1.id 
and employee_salary1.salary_id = salary1.id ;





-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employees1.employee_name as name, salary1.monthly_salary as salary
from employees1, salary1, employee_salary1
where employee_salary1.employee_id = employees1.id 
and employee_salary1.salary_id = salary1.id 
and salary1.monthly_salary < 2000;






-- 3. Вывести все зарплатные позиции, но работник по ним 
-- не назначен. (ЗП есть, но не понятно кто её получает.)

select salary1.monthly_salary as salary
from salary1 left join employee_salary1
on salary1.id = employee_salary1.salary_id 
where employee_salary1.employee_id is null;






-- 4. Вывести все зарплатные позиции  меньше 3000 но работник 
-- по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select salary1.monthly_salary as salary
from salary1 left join employee_salary1
on salary1.id = employee_salary1.salary_id 
where employee_salary1.employee_id is null 
and salary1.monthly_salary < 3000;







-- 5. Найти всех работников кому не начислена ЗП.

select  * from employees1;

select employees1.employee_name  as name
from employees1 left join employee_salary1
on employees1.id = employee_salary1.employee_id 
where employee_salary1.employee_id is null;





-- 6. Вывести всех работников с названиями их должности.

select employees1.employee_name as name, roles.role_name as role
from employees1, roles, roles_employee1 
where employees1.id = roles_employee1.employee_id 
and roles_employee1.role_id = roles.id;

--выведет всех работников, кому только назначены должности

select employees1.employee_name as name, roles.role_name as role
from employees1 
	left join roles_employee1 on employees1.id = roles_employee1.employee_id
	left join roles on roles_employee1.role_id = roles.id;

--выведет всех работников с должностями даже если они ему не назначены






-- 7. Вывести имена и должность только Java разработчиков.

select employees1.employee_name as name, roles1.role_name as role
from employees1, roles1, roles_employee1 
where employees1.id = roles_employee1.employee_id 
and roles_employee1.role_id = roles1.id
and roles1.role_name like '%Java developer%';





-- 8. Вывести имена и должность только Python разработчиков.

select employees1.employee_name as name, roles1.role_name as role
from employees1, roles1, roles_employee1 
where employees1.id = roles_employee1.employee_id 
and roles_employee1.role_id = roles1.id
and roles1.role_name like '%Python developer%';





-- 9. Вывести имена и должность всех QA инженеров.

select employees1.employee_name as name, roles1.role_name as role
from employees1, roles1, roles_employee1 
where employees1.id = roles_employee1.employee_id 
and roles_employee1.role_id = roles1.id
and roles1.role_name like '%QA engineer%';







-- 10. Вывести имена и должность ручных QA инженеров.

select employees1.employee_name as name, roles1.role_name as role
from employees1, roles1, roles_employee1 
where employees1.id = roles_employee1.employee_id 
and roles_employee1.role_id = roles1.id
and roles1.role_name like '%QA engineer%';








-- 11. Вывести имена и должность автоматизаторов QA

select employees1.employee_name as name, roles1.role_name as role
from employees1, roles1, roles_employee1 
where employees1.id = roles_employee1.employee_id 
and roles_employee1.role_id = roles1.id
and roles1.role_name like '%Automation QA%';







-- 12. Вывести имена и зарплаты Junior специалистов

select employees1.employee_name as name, salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%Junior%';








-- 13. Вывести имена и зарплаты Middle специалистов

select employees1.employee_name as name, salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%Middle%';







-- 14. Вывести имена и зарплаты Senior специалистов

select employees1.employee_name as name, salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%Senior%';









-- 15. Вывести зарплаты Java разработчиков

select salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%Java developer%';









-- 16. Вывести зарплаты Python разработчиков

select salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%Python developer%';








-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employees1.employee_name as name, salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like 'Junior Python developer';








-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employees1.employee_name as name, salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like 'Middle JavaScript developer';








-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employees1.employee_name as name, salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like 'Senior Java developer';







-- 20. Вывести зарплаты Junior QA инженеров

select salary1.monthly_salary  as salary
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like 'Junior % QA engineer';









-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(salary1.monthly_salary) as salary_Junior
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%Junior%';








-- 22. Вывести сумму зарплат JS разработчиков

select sum(salary1.monthly_salary) as salary_JS_developer
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%JavaScript developer%';








-- 23. Вывести минимальную ЗП QA инженеров

select min(salary1.monthly_salary) as min_salary_QA
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%QA engineer%';







-- 24. Вывести максимальную ЗП QA инженеров

select max(salary1.monthly_salary) as max_salary_QA
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%QA engineer%';









-- 25. Вывести количество QA инженеров

select count(employees1.employee_name) as count_qa
from employees1 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id
where roles1.role_name like '%QA engineer';


select count(roles_employee1.employee_id) as count_qa
from roles_employee1
	join roles1 on roles_employee1.role_id = roles1.id
where roles1.role_name like '%QA engineer';








-- 26. Вывести количество Middle специалистов.

select count(roles_employee1.employee_id) as count_Middle
from roles_employee1
	join roles1 on roles_employee1.role_id = roles1.id
where roles1.role_name like '%Middle%';









-- 27. Вывести количество разработчиков

select count(roles_employee1.employee_id) as count_developer
from roles_employee1
	join roles1 on roles_employee1.role_id = roles1.id
where roles1.role_name like '%developer%';









-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(salary1.monthly_salary) as sum_salary_dev
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where roles1.role_name like '%developer%';






-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employees1.employee_name, roles1.role_name, salary1.monthly_salary 
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
order by salary1.monthly_salary;





-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию 
-- у специалистов у которых ЗП от 1700 до 2300

select employees1.employee_name, roles1.role_name, salary1.monthly_salary 
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where salary1.monthly_salary between 1700 and 2300
order by salary1.monthly_salary;






-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у 
-- специалистов у которых ЗП меньше 2300

select employees1.employee_name, roles1.role_name, salary1.monthly_salary 
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where salary1.monthly_salary < 2300
order by salary1.monthly_salary;





-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у 
-- специалистов у которых ЗП равна 1100, 1500, 2000

select employees1.employee_name, roles1.role_name, salary1.monthly_salary 
from salary1 
	join employee_salary1 on salary1.id = employee_salary1.salary_id 
	join employees1 on employee_salary1.employee_id = employees1.id 
	join roles_employee1 on employees1.id = roles_employee1.employee_id 
	join roles1 on roles_employee1.role_id = roles1.id 
where salary1.monthly_salary in (1100, 1500, 2000)
order by salary1.monthly_salary;





