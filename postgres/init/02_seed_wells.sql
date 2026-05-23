INSERT INTO wells VALUES
(1, 'Well-A', 'Field1', 55.0, 37.0),
(2, 'Well-B', 'Field1', 55.1, 37.1),
(3, 'Well-C', 'Field2', 56.0, 38.0),
(4, 'Well-D', 'Field2', 56.1, 38.1),
(5, 'Well-E', 'Field3', 57.0, 39.0);

-- Генерируем production на 30 дней для каждой скважины
INSERT INTO production
SELECT well_id, d::date, random()*100+50, random()*0.3, random()*500+100
FROM wells CROSS JOIN generate_series('2025-01-01','2025-01-30', interval '1 day') d;
-- telemetry: для каждой скважины по 24 записи в сутки (каждый час) со случайными значениями
-- аналогично pump_sensors для 3 насосов, deliveries, well_targets
