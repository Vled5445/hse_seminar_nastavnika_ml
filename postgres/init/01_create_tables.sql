CREATE TABLE wells (
    well_id INT PRIMARY KEY,
    well_name VARCHAR(100),
    field VARCHAR(100),
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE production (
    well_id INT,
    date DATE,
    oil_rate_tons FLOAT,       -- дебит нефти, т/сут
    water_cut FLOAT,
    gas_oil_ratio FLOAT,
    PRIMARY KEY (well_id, date)
);

CREATE TABLE telemetry (
    well_id INT,
    timestamp TIMESTAMP,
    pressure_psi FLOAT,
    temperature_c FLOAT,
    power_kw FLOAT,
    pump_runtime_hours FLOAT,
    downtime_minutes FLOAT,
    flow_rate_tons_h FLOAT,
    PRIMARY KEY (well_id, timestamp)
);

CREATE TABLE pump_sensors (
    pump_id INT,
    timestamp TIMESTAMP,
    vibration_mm_s FLOAT,
    temperature_c FLOAT,
    current_a FLOAT,
    rpm FLOAT,
    PRIMARY KEY (pump_id, timestamp)
);

CREATE TABLE pump_failures (
    pump_id INT,
    failure_time TIMESTAMP,
    failure_type VARCHAR(50)
);

CREATE TABLE deliveries (
    delivery_id SERIAL PRIMARY KEY,
    route_id INT,
    driver_id INT,
    volume_ton FLOAT,
    cost_rub FLOAT,
    delay_hours FLOAT,
    weather VARCHAR(50),
    distance_km FLOAT,
    planned_time_h FLOAT,
    actual_time_h FLOAT
);

CREATE TABLE well_targets (
    well_id INT,
    date DATE,
    target_rate_tons FLOAT,
    pressure_target_psi FLOAT,
    temp_target_c FLOAT,
    power_target_kw FLOAT,
    pump_runtime_target_h FLOAT
);
