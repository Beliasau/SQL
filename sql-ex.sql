-- Задание: 1 
-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
select model,
    speed,
    hd
from pc
where price < 500 -- Задание: 2 
    -- Найдите производителей принтеров. Вывести: maker
    -- Select DISTINCT maker
    -- from product, printer
    -- Where product.model = printer.model        производители принтеров из таблицы printer
SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer' -- все существующие производители принтеров в бд
    -- Задание: 3 
    -- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
Select model,
    ram,
    screen
FROM laptop
Where price > 1000 -- Задание: 4 
    -- Найдите все записи таблицы Printer для цветных принтеров.
Select *
FROM printer
WHERE color = 'y' -- Задание: 5 
    -- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
SElECT model,
    speed,
    hd
FROM pc
Where price < 600
    AND cd IN ('12x', '24x') -- Задание: 6 
    -- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
    -- Select DISTINCT maker, speed
    -- FROM product, laptop
    -- WHERE product.model = laptop.model AND hd >= 10
SELECT DISTINCT Product.maker,
    Laptop.speed
FROM Product,
    Laptop
WHERE Product.model = Laptop.model
    AND Laptop.hd >= 10 -- Задание: 7 
    -- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
    -- Задание: 8 
    -- Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT DISTINCT maker
FROM Product
WHERE type = 'pc'
except
SELECT DISTINCT maker
FROM Product
WHERE type = 'laptop' -- (EXCEPT) В результирующий набор попадают только те строки первого запроса, которые отсутствуют во втором . 
    -- Задание: 9 
    -- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
select DISTINCT product.maker
from product
    join pc on product.model = pc.model
where pc.speed >= 450 -- Задание: 10 
    -- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT TOP 1 WITH TIES model,
    price
FROM Printer
ORDER BY price DESC -- (первая  — TOP 1) выполняется сортировка по убыванию цены. В результирующий набор попадает одна 
    -- WITH TIES включит в результирующий набор не только N строк (в нашем случае одну), но и все ниже идущие строки, у которых значения в полях сортировки (у нас — price) совпадают со значениями N-ой строки (у нас — первой).
    -- Задание: 11 
    -- Найдите среднюю скорость ПК.
select avg(speed)
from pc -- Задание: 12 
    -- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
Select avg(speed)
from laptop
where price > 1000 -- Задание: 13
    -- Найдите среднюю скорость ПК, выпущенных производителем A.
Select AVG(pc.speed)
from pc
    join product ON pc.model = product.model
where maker = 'a' -- Задание: 14 
    -- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
select ships.class,
    ships.name,
    classes.country
from classes
    join ships on classes.class = ships.class
where classes.numGuns > 9;
-- Задание: 15 
-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
select hd
from pc
group by hd
having count(*) >= 2;
-- Задание: 16 
-- Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select distinct a.model as model,
    b.model as model_1,
    a.speed,
    a.ram
from pc as a,
    pc as b
where a.speed = b.speed
    and a.ram = b.ram
    and a.model > b.model;