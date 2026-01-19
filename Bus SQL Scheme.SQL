
-- Dimension Tables


CREATE TABLE dim_route (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(50),
    region VARCHAR(50)
);

INSERT INTO dim_route VALUES
(1, 'X1 Bristol – Weston', 'South West'),
(2, '75 Bristol – Cribbs', 'South West'),
(3, '8 City Circular', 'Midlands'),
(4, 'X92 Leicester – Melton', 'Midlands');


CREATE TABLE dim_vehicle (
    vehicle_id INT PRIMARY KEY,
    vehicle_type VARCHAR(30),
    capacity INT
);

INSERT INTO dim_vehicle VALUES
(101, 'Single Deck', 75),
(102, 'Double Deck', 95),
(103, 'Electric Single Deck', 70);


CREATE TABLE dim_stop (
    stop_id INT PRIMARY KEY,
    stop_name VARCHAR(100),
    town VARCHAR(50)
);

INSERT INTO dim_stop VALUES
(1, 'Bristol Bus Station', 'Bristol'),
(2, 'Weston Town Centre', 'Weston'),
(3, 'Cribbs Causeway', 'Bristol'),
(4, 'Leicester Haymarket', 'Leicester'),
(5, 'Melton Bus Station', 'Melton');


CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    day_of_week VARCHAR(10),
    is_weekend BOOLEAN
);

INSERT INTO dim_date VALUES
('2025-01-06', 'Monday', FALSE),
('2025-01-07', 'Tuesday', FALSE),
('2025-01-08', 'Wednesday', FALSE),
('2025-01-11', 'Saturday', TRUE);

-- Fact Tables

CREATE TABLE fact_trips (
    trip_id INT PRIMARY KEY,
    route_id INT,
    vehicle_id INT,
    service_date DATE,
    scheduled_departure TIME,
    actual_departure TIME,
    scheduled_arrival TIME,
    actual_arrival TIME,
    passengers INT,
    FOREIGN KEY (route_id) REFERENCES dim_route(route_id),
    FOREIGN KEY (vehicle_id) REFERENCES dim_vehicle(vehicle_id)
);

INSERT INTO fact_trips VALUES
(1001, 1, 102, '2025-01-06', '07:30', '07:34', '08:45', '08:55', 82),
(1002, 1, 102, '2025-01-06', '17:30', '17:50', '18:45', '19:10', 91),
(1003, 2, 101, '2025-01-07', '08:00', '08:01', '08:40', '08:42', 54),
(1004, 3, 103, '2025-01-08', '09:15', '09:05', '10:00', '09:55', 61),
(1005, 4, 101, '2025-01-11', '10:00', NULL, '11:10', NULL, 0);


CREATE TABLE fact_ticket_sales (
    ticket_id INT PRIMARY KEY,
    trip_id INT,
    ticket_type VARCHAR(20),
    price DECIMAL(6,2),
    FOREIGN KEY (trip_id) REFERENCES fact_trips(trip_id)
);

INSERT INTO fact_ticket_sales VALUES
(1, 1001, 'Single', 2.50),
(2, 1001, 'Single', 2.50),
(3, 1001, 'Day', 5.80),
(4, 1002, 'Single', 2.50),
(5, 1002, 'Return', 4.60),
(6, 1003, 'Single', 2.20),
(7, 1004, 'Day', 5.50);

