CREATE SCHEMA hw5;

CREATE TABLE hw5.cars
(
Id INT AUTO_INCREMENT PRIMARY KEY, 
carname VARCHAR(20),
cost INTEGER 
);

INSERT INTO hw5.cars (carname, cost)
VALUES
('Audi', 52642),
('Mercedes',57127),
('Skoda',9000),
('Volvo',29000),
('Bentley',350000),
('Citroen',21000),
('Hummer',41400),
('Volkswagen',21600);

# Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
 CREATE VIEW hw5.CheapCars AS SELECT carname FROM hw5.cars WHERE cost<25000;
 SELECT * FROM hw5.CheapCars;
# Изменить в существующем представлении порог для стоимости: 
#пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW hw5.CheapCars AS SELECT carname FROM hw5.cars WHERE cost<30000;
 SELECT * FROM hw5.CheapCars;
# Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично
CREATE VIEW hw5.mycars AS SELECT Id,carname,cost FROM hw5.cars WHERE carname = 'Skoda' OR carname = 'Audi';
SELECT *  FROM hw5.mycars