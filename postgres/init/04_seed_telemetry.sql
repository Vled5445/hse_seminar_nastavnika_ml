-- Генерация телеметрии для 5 скважин за 30 дней, каждый час (24 записи в сутки)
INSERT INTO telemetry (well_id, timestamp, pressure_psi, temperature_c, power_kw, pump_runtime_hours, downtime_minutes, flow_rate_tons_h)
SELECT 
    w.well_id,
    d::timestamp + interval '1 hour' * h,
    -- давление: 800-1500 psi, зависит от скважины
    800 + random() * 700 + (w.well_id * 50),
    -- температура: 40-90°C
    40 + random() * 50 + (w.well_id % 3) * 10,
    -- мощность: 50-200 kW
    50 + random() * 150,
    -- время работы насоса: 0.5-1.0 часов (за час)
    0.5 + random() * 0.5,
    -- время простоя: 0-30 минут
    random() * 30,
    -- дебит: 2-10 тонн/час
    2 + random() * 8 + (w.well_id * 0.5)
FROM wells w
CROSS JOIN generate_series('2025-01-01'::date, '2025-01-30'::date, '1 day') d
CROSS JOIN generate_series(0, 23) h
ORDER BY w.well_id, d, h;
