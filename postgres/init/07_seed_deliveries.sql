-- Генерация данных по доставкам
INSERT INTO deliveries (route_id, driver_id, volume_ton, cost_rub, delay_hours, weather, distance_km, planned_time_h, actual_time_h)
SELECT 
    (random() * 5)::int + 1 as route_id,
    (random() * 10)::int + 1 as driver_id,
    10 + random() * 40 as volume_ton,
    5000 + random() * 25000 as cost_rub,
    -- задержка зависит от погоды
    CASE 
        WHEN w.weather = 'Снегопад' THEN random() * 10 + 2
        WHEN w.weather = 'Дождь' THEN random() * 6 + 1
        WHEN w.weather = 'Туман' THEN random() * 4 + 0.5
        ELSE random() * 2
    END as delay_hours,
    w.weather,
    50 + random() * 200 as distance_km,
    2 + random() * 8 as planned_time_h,
    0 as actual_time_h
FROM (
    VALUES 
        ('Ясно'), ('Дождь'), ('Снегопад'), ('Туман'), ('Облачно')
) AS w(weather)
CROSS JOIN generate_series(1, 50)  -- 50 доставок
ORDER BY random();

-- Обновим actual_time_h на основе planned_time_h + delay
UPDATE deliveries SET actual_time_h = planned_time_h + delay_hours;

