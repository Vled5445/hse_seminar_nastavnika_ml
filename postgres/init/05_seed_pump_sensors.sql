-- Генерация данных сенсоров для 3 насосов
-- pump_id 1,2,3 соответствуют скважинам 1,2,3
INSERT INTO pump_sensors (pump_id, timestamp, vibration_mm_s, temperature_c, current_a, rpm)
SELECT 
    p.pump_id,
    d::timestamp + interval '1 hour' * h,
    -- вибрация: 1-5 мм/с (норма), иногда выше
    CASE WHEN random() < 0.1 THEN 5 + random() * 10  -- 10% аномалий
         ELSE 1 + random() * 4
    END,
    -- температура насоса: 30-80°C
    30 + random() * 50,
    -- ток: 10-50 A
    10 + random() * 40,
    -- обороты: 1000-3000 RPM
    1000 + random() * 2000
FROM (VALUES (1), (2), (3)) AS p(pump_id)
CROSS JOIN generate_series('2025-01-01'::date, '2025-01-30'::date, '1 day') d
CROSS JOIN generate_series(0, 23) h
ORDER BY p.pump_id, d, h;
