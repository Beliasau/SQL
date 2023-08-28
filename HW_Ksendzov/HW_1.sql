--SQL_DDL
--Первая часть.



--Таблица employees
--1) Создать таблицу employees
--- id. serial, primary key,
--- employee_name. Varchar(50), not null
--2) Наполнить таблицу employee 70 строками.


create table employees1(
id serial primary key,
employee_name varchar(50) not null
);

insert into employees1(employee_name)
values 
('Rhys'),
('Uthman'),
('Enzo'),
('Zahir'),
('Roman'),
('Maximus'),
('Brody'),
('Nikolas'),
('Tyrone'),
('Aaron'),
('Layton'),
('Orion'),
('Ismael'),
('Pierson'),
('Ford'),
('Rhys'),
('Wells'),
('Yasir'),
('Wiley'),
('David'),
('Omer'),
('Grey'),
('Esteban'),
('Zacharias'),
('Adriel'),
('Quinton'),
('Nikolai'),
('Winston'),
('Ishaan'),
('Karter'),
('Tyrone'),
('Uriel'),
('Pembroke'),
('Hassan'),
('Oliver'),
('William'),
('Emery'),
('Jasper'),
('Myles'),
('Grant'),
('Houston'),
('Gilbert'),
('Harlow'),
('Chase'),
('Nelson'),
('Nate'),
('Yuri'),
('Gregory'),
('Willis'),
('Fredrick'),
('Zev'),
('Xaviell'),
('Raphael'),
('Nikolas'),
('Jackson'),
('Gary'),
('Giancarlo'),
('Kingsley'),
('Denver'),
('Daniel'),
('Clayton'),
('Nevin'),
('Shepherd'),
('Matias'),
('Isiah'),
('Xackery'),
('Giovanni'),
('Marshall'),
('Terrance'),
('Dexter');






--
--Таблица salary
--3) Создать таблицу salary
--- id. Serial primary key,
--- monthly_salary. Int, not null
--4) Наполнить таблицу salary 16 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

create table salary1(
id serial primary key,
monthly_salary int not null
);

insert into salary1(monthly_salary)
values 
(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

insert into salary1(monthly_salary)
values 
(2600);

select * from salary1;



--Таблица employee_salary
--5) Создать таблицу employee_salary
--- id. Serial primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--6) Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id


create table employee_salary1(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

insert into employee_salary1(employee_id, salary_id )
values 
(81,1),
(82,2),
(83,3),
(84,4),
(85,5),
(86,6),
(87,7),
(88,8),
(89,9),
(90,10),
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,1),
(18,2),
(19,3),
(20,4),
(21,5),
(22,6),
(23,7),
(24,8),
(25,9),
(26,10),
(27,11),
(28,12),
(29,13),
(30,14);





--Таблица roles
--7) Создать таблицу roles
--- id. Serial primary key,
--- role_name. int, not null, unique
--8) Поменять тип столба role_name с int на varchar(30)
--9) Наполнить таблицу roles 20 строками:


create table roles1(
id serial primary key,
role_name int not null unique
)

alter table roles1
alter column role_name type varchar(30);

insert into roles1(role_name)
values 
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');





--Таблица roles_employee
--10) Создать таблицу roles_employee
--- id. Serial primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--11) Наполнить таблицу roles_employee 40 строками:

create table roles_employee1(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees1(id),
foreign key (role_id)
	references roles1(id)
);

insert into roles_employee1(employee_id, role_id)
values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,1),
(22,2),
(23,3),
(24,4),
(25,5),
(26,6),
(27,7),
(28,8),
(29,9),
(30,10),
(31,11),
(32,12),
(33,13),
(34,14),
(35,15),
(36,16),
(37,17),
(38,18),
(39,19),
(40,20);



