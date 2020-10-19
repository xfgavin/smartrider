<img src="https://github.com/xfgavin/SmartRider/blob/master/images/rainbowbar_title.png?raw=true" width="100%">
Ride smarter, for less!
<img src="https://github.com/xfgavin/SmartRider/blob/master/images/icons.png?raw=true">

Ride share market has grown expontionally during past a few years, so does the need for a ride share planning platform. When you plan a trip, you can conveniently refer to Google Flight search, and get better idea of when and where to start the trip. Unfortunately, there is no such a system for rideshare planning yet.

### Solution
Here I would like to propose a data driven solution: [SmartRider](https://smartrider.dtrace.net). 
<img src="https://github.com/xfgavin/SmartRider/blob/master/images/snapshot.png?raw=true">

It is based on historical taxi trip data. Users can pick a location on the map, then adjust parameters like trip month, traffic situation, and social restrictions such as COVID.

Under the hood, I used New York city taxi trip data (yellow & green taxis only) and a Spark centered pipeline.

### The dataset
[New York city taxi trip data](https://registry.opendata.aws/nyc-tlc-trip-records-pds/).
This dataset has:

1. taxi trip from 2009 to present,
2. includes either pickup/dropoff geo location or [taxi zone id](https://s3.amazonaws.com/nyc-tlc/misc/taxi_zones.zip).
3. file size: ~240GB
4. nearly updates monthly.

### The tech stack
<img src="https://github.com/xfgavin/SmartRider/blob/master/images/techstack.png?raw=true">
This pipeline gets data from S3, ETLs data using a Spark cluster and saves data to PostgreSQL database with PostGIS extension. Finally, Dash from plotly is used to provide web service. Airflow is used to schedule data processing jobs when new data file exists.
Software packages/Tools used in this project

1. Apache Spark, ver: 3.0.1
<img src="https://spark.apache.org/images/spark-logo-trademark.png" width="200px">
2. Apache Airflow, ver: 1.10.12
<img src="https://airflow.apache.org/images/feature-image.png" width="200px">
3. PostGreSQL with PostGIS extension, ver: 12.4
<img src="https://postgis.net/images/postgis-logo.png" width="200px">
4. Plotly Dash, ver: 1.16.2
<img src="https://www.educative.io/api/edpresso/shot/6166549980250112/image/5979145793175552" width="200px">
5. Dash leaflet, ver: 0.1.4
<img src="http://dash-leaflet.herokuapp.com/assets/leaflet.png" width="200px">

### Engineering chanllenges
1. how to efficiently convert geo location to taxi zone id. Data before 2017 has pickup geo locations (point) with longitude and latitude, but data since 2017 only has pickup taxi zone id (area). To do the conversion, PostGIS is used because it has lots of geo related functions. Here are two options to do the conversion:
  1. convert during Spark ETL
  2. create a stored procedure in Postgres and convert inside database after Spark ETL
Option 1 took too long, for a csv with 10M rows, it could take at least 2 days and even longer.
Option 2 stood out by taking only less than half an hour.

2. data clean up. Data is always messy. In this dataset, there are some major issues:
  1. super short trip: elasped only couple of seconds, less than 0.5mile etc.
  2. less than minimal fare charges
  3. timestamps happens in future
  4. missing value
  5. no riders
  6. abnormal driving speed, either less than 5mph or higher than 100mph
  7. extreemly high rate

### Set up
Ansible and docker are used to setup spark cluster in Amazon AWS for this project. Please check [/setup/playbook](/setup/playbook)

Please also find scripts for database setup in [/db](/db)
