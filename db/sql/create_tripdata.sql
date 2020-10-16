---DROP TABLE IF EXISTS TRIPDATA;
CREATE TABLE TRIPDATA (
	ID BIGSERIAL NOT NULL,
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
	isweekend SMALLINT NOT NULL DEFAULT 0,
        sourceID SMALLINT NOT NULL,
	PRIMARY KEY(id)
);
CREATE INDEX ON TRIPDATA (ID, PULocationID, pickup_month, pickup_hour, traffic, isholiday, isweekend, sourceID);

DROP TABLE IF EXISTS TRIPDATA_GEO;
CREATE TABLE TRIPDATA_GEO (
	ID BIGSERIAL NOT NULL,
	pickup_datetime TIMESTAMP NOT NULL,
	dropoff_datetime TIMESTAMP NOT NULL,
	pickup_latitude REAL NOT NULL DEFAULT 0,
	pickup_longitude REAL NOT NULL DEFAULT 0,
	dropoff_latitude REAL NOT NULL DEFAULT 0,
   	dropoff_longitude REAL NOT NULL DEFAULT 0,
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
	isweekend SMALLINT NOT NULL DEFAULT 0,
   	sourceID SMALLINT NOT NULL,
	PRIMARY KEY(id)
);
CREATE INDEX ON TRIPDATA_GEO (ID, pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude,  sourceID);

---DROP TABLE IF EXISTS TRIPDATA_FILENAME CASCADE;
CREATE TABLE TRIPDATA_FILENAME (
	ID SMALLSERIAL NOT NULL,
        filename VARCHAR(30) NOT NULL,
	updateon TIMESTAMP NOT NULL DEFAULT NOW(),
	islocked SMALLINT NOT NULL DEFAULT 1,
	PRIMARY KEY(id)
);
CREATE INDEX ON TRIPDATA_FILENAME (ID, filename);
CREATE UNIQUE INDEX ON TRIPDATA_FILENAME (filename);
