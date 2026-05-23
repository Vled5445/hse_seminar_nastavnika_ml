-- Генерация отказов насосов (несколько штук за месяц)
INSERT INTO pump_failures (pump_id, failure_time, failure_type)
VALUES 
    (1, '2025-01-08 14:30:00', 'bearing_failure'),
    (1, '2025-01-22 08:15:00', 'overheating'),
    (2, '2025-01-12 16:45:00', 'seal_leak'),
    (2, '2025-01-25 22:00:00', 'vibration'),
    (3, '2025-01-05 10:00:00', 'bearing_failure'),
    (3, '2025-01-18 03:30:00', 'electrical_fault'),
    (3, '2025-01-28 19:15:00', 'overheating');
