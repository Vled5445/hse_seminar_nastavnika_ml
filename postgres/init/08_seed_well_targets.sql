-- Целевые/фактические показатели по скважинам (для ML)
INSERT INTO well_targets (well_id, date, target_rate_tons, pressure_target_psi, temp_target_c, power_target_kw, pump_runtime_target_h)
SELECT 
    w.well_id,
    d::date,
    -- целевой дебит: 50-150 тонн/сутки
    50 + random() * 100 + (w.well_id * 10),
    -- давление: 900-1400 psi
    900 + random() * 500,
    -- температура: 45-85°C
    45 + random() * 40,
    -- мощность: 60-180 kW
    60 + random() * 120,
    -- время работы: 18-24 часа
    18 + random() * 6
FROM wells w
CROSS JOIN generate_series('2025-01-01'::date, '2025-01-30'::date, '1 day') d
ORDER BY w.well_id, d;
