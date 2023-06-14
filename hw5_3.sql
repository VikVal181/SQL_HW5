CREATE TABLE hw5.Timetable
(
train_id INTEGER,
station VARCHAR(20),
station_time TIME
);

INSERT INTO hw5.Timetable (train_id,station,station_time)
VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

CREATE VIEW hw5.WithTimeToNeext AS SELECT *, 
TIMEDIFF(LEAD(station_time) OVER (
PARTITION BY train_id ORDER BY station_time), station_time) time_to_next_station
FROM hw5.Timetable;

SELECT * FROM hw5.WithTimeToNeext
