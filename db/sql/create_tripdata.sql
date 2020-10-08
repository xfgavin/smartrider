DROP TABLE IF EXISTS TRIPDATA;
CREATE TABLE TRIPDATA (
	pickup_datetime TIMESTAMP NOT NULL,
	dropoff_datetime TIMESTAMP NOT NULL,
	PULocationID SMALLINT NOT NULL DEFAULT 0,
	DOLocationID SMALLINT NOT NULL DEFAULT 0,
	passenger_count SMALLINT NOT NULL DEFAULT 0,
	trip_distance REAL NOT NULL DEFAULT 0,
	fare_amount REAL NOT NULL DEFAULT 0,
	pickup_date DATE NOT NULL,
	pickup_year SMALLINT NOT NULL DEFAULT 0,
	pickup_month SMALLINT NOT NULL DEFAULT 0,
	pickup_day SMALLINT NOT NULL DEFAULT 0,
	pickup_hour SMALLINT NOT NULL DEFAULT 0,
	duration REAL NOT NULL DEFAULT 0,
	speed REAL,
	traffic SMALLINT NOT NULL DEFAULT 0,
	rate REAL NOT NULL DEFAULT 0,
	isholiday SMALLINT NOT NULL DEFAULT 0,
	isweekend SMALLINT NOT NULL DEFAULT 0
);
CREATE INDEX ON TRIPDATA (PULocationID, pickup_month, pickup_hour, traffic, isholiday, isweekend);
