-- ============================================
-- 1️⃣ Route Punctuality (average departure delay in minutes)
-- ============================================
SELECT
    r.route_name,
    COUNT(*) AS total_trips,
    ROUND(AVG(
        CASE
            WHEN t.actual_departure IS NULL THEN NULL
            ELSE TIME_TO_SEC(TIMEDIFF(t.actual_departure, t.scheduled_departure))/60
        END
    ), 2) AS avg_departure_delay_mins
FROM fact_trips t
JOIN dim_route r ON t.route_id = r.route_id
GROUP BY r.route_name;

-- ============================================
-- 2️⃣ Revenue per Route
-- ============================================
SELECT
    r.route_name,
    SUM(ts.price) AS total_revenue
FROM fact_ticket_sales ts
JOIN fact_trips t ON ts.trip_id = t.trip_id
JOIN dim_route r ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY total_revenue DESC;

-- ============================================
-- 3️⃣ Capacity Utilisation (% of seats filled)
-- ============================================
SELECT
    r.route_name,
    ROUND(AVG(t.passengers * 100.0 / v.capacity), 1) AS avg_capacity_utilisation_pct
FROM fact_trips t
JOIN dim_vehicle v ON t.vehicle_id = v.vehicle_id
JOIN dim_route r ON t.route_id = r.route_id
WHERE t.passengers > 0
GROUP BY r.route_name;
