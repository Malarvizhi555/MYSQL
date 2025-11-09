use test

CREATE TABLE events(
      Event_id INT AUTO_INCREMENT PRIMARY KEY,
      Event_name VARCHAR(100),
      Event_date DATETIME,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO events(Event_name, Event_date) VALUES
("Team Meeting",   '2025-01-15 10:30:00'),
("Conference",     '2025-02-10 09:00:00'),
("Online Webinar", '2025-03-05 15:45:00'),
("Workshop",       '2025-03-20 13:30:00');

select * from events

SELECT Event_id, Event_name, Year(event_date) AS Event_Year FROM events;

SELECT Event_id, Event_name, event_date, Date(event_date) AS Event_Date FROM events;

SELECT Event_id, Event_name, event_date, Day(event_date) AS Event_Day FROM events;

SELECT Event_id, Event_name, event_date, event_date + interval 30 day as Date_plus_30 FROM Events;

SELECT Event_id, Event_name, event_date, event_date - interval 30 day as Date_minus_30 FROM Events;

SELECT Event_id, Event_date, DATE_FORMAT(Event_date, '%W, %M %e %y') as Formatted_date from events;

SELECT Event_id, Event_date, DATE_FORMAT(Event_date, '%h : %i %p') as Formatted_Time from events;