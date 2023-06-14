CREATE TABLE hw5.Analysis
(
an_id INT AUTO_INCREMENT PRIMARY KEY, 
an_name VARCHAR(20),
an_cost INTEGER,
an_price INTEGER,
an_group INTEGER
);

INSERT INTO hw5.Analysis (an_name, an_cost, an_price, an_group)
VALUES
('Blood1', 100, 150, 1),
('Blood2', 120, 180, 2),
('Blood3', 170, 200, 3),
('Blood4', 140, 210, 1),
('Blood5', 180, 240, 2),
('Blood6', 140, 170, 3),
('Blood7', 100, 150, 1);

CREATE TABLE hw5.Groups
(
gr_id INT AUTO_INCREMENT PRIMARY KEY, 
gr_name VARCHAR(20),
gr_temp INTEGER
);

INSERT INTO hw5.Groups (gr_name, gr_temp)
VALUES
('Group1', 20),
('Group2', 5),
('Group3', 10);

CREATE TABLE hw5.Orders
(
ord_id INT AUTO_INCREMENT PRIMARY KEY, 
ord_datetime DATETIME,
ord_an INTEGER
);

INSERT INTO hw5.Orders (ord_datetime, ord_an)
VALUES
('2020-02-04 00:06:18', 3),
('2020-02-05 16:06:18', 4),
('2020-02-06 12:26:18', 2),
('2020-02-07 11:16:18', 1),
('2020-02-23 10:16:18', 5);

#Вывести название и цену для всех анализов, которые продавались 5 февраля 2020
# и всю следующую 

CREATE VIEW hw5.weekorders AS 
SELECT an_name, an_price 
FROM hw5.Orders LEFT JOIN hw5.Analysis
ON hw5.Orders.ord_an = hw5.Analysis.an_id
WHERE hw5.Orders.ord_datetime > '2020-02-05 00:00:10' AND hw5.Orders.ord_datetime < '2020-02-14 00:00:10';

SELECT * from hw5.weekorders