-- Data Bhau SQL Workshop

-- My SQL Workshop Day-2 Assignment:-
-- Using Daatabase Tutorial and FLIGHTS table

use tutorial;

show tables;

-- To change limit of loading records
set global max_allowed_packet = 209715200;

-- To Load data without warning or easy loading with out incorrect datatype we use sql_mode
SET SESSION sql_mode = '';

create table flights(
actual_arrival_time int,
actual_flight_time int,
acutal_departure_time int,
air_time int,
air_traffic_delay varchar(155),
airline_code varchar(155),
airline_name varchar(155),
arrival_delay int,
cancellation_reason varchar(155),
carrier_delay int,
day varchar(155),
departure_delay int,
destination_airport varchar(155),
destination_city varchar(155),
destination_state varchar(155),
distance int,
flight_number int,
late_aircraft_delay int,
origin_airport varchar(155),
origin_city varchar(155),
origin_state varchar(155),
schedued_arrival_time int,
scheduled_departure_time int,
scheduled_flight_time int,
security_delay int,
was_cancelled varchar(155),
weather_delay int,
wheels_off_time int,
wheels_on_time int,
day_of_week varchar(155));

-- To Load data from csv file to TABLE
LOAD DATA LOCAL INFILE 'C:/Users/Kamble/OneDrive/Desktop/Individual/Vishwajeet/Learning/SQL/Data Bhau/tutorial/flights.csv'
INTO TABLE flights
FIELDS TERMINATED BY ','
ENCLOSED BY '"'    -- WRITE SINGLE " IN  COLON ' '
LINES TERMINATED BY '\n'
ignore 1 rows;


-- To Display tutorial.flights Table --
SELECT * FROM FLIGHTS
limit 10;

-- Count Records
SELECT count(*) FROM FLIGHTS1;
-- 593842 Rows --

-- To drop data from table
-- truncate table flights;

-- To drop tabole
-- drop table flights;

-- Solutions to Assignments Questions --

/*
Q1) Write a query to get max distance travelled by any flight.
*/
SELECT max(distance) FROM flights;

SELECT min(distance) FROM flights;

/*
Q2) Write a query to get average departure_delay where arrival_delay < 0.
*/
select avg(departure_delay) from tutorial.flights 
where arrival_delay < 0;

/*
Q3) Write a query to get count of flights from JFK where distance is between 1900 and 2200.
*/
select count(flight_number) from tutorial.flights 
where distance between 1900 and 2200 and origin_airport = 'JFK';

/*
Q4) Write a query to get mean airtime of flights whose distance is between 1900 and 2200 
and origin_airport in SNA,AUS,JFK
*/
select avg(air_time) from tutorial.flights 
where distance between 1900 and 2200 and origin_airport in ('SNA','AUS','JFK');

/*
Q5) Write a query to display count of flights from each airport that was cancelled.
*/
select origin_airport, count(flight_number) from tutorial.flights
where was_cancelled = true
group by origin_airport;

/*
Q6) Write a query to display average distance travelled by each flight everyday.
*/
select flight_number, day_of_week, avg(distance) from tutorial.flights 
group by flight_number, day_of_week;

/*
Q7) Write a query to display the total arrival delay each day.
*/
select day_of_week, sum(arrival_delay) from tutorial.flights
group by day_of_week;

/*
Q8) Write a query to display the days where average distance travelled is more than 500.
*/
select day_of_week, avg(distance) from tutorial.flights
group by day_of_week
having avg(distance) > 500;

/*
Q9) Write a query to display the arrival_airport where average arrival_delay  >  5.
*/
select destination_airport, avg(arrival_delay) from tutorial.flights
group by destination_airport
having avg(arrival_delay) > 5;

/*
Q10) What is the difference between having and where clause ?
Answer:- 
WHERE clause cannot be used with aggregate functions whereas HAVING clause can be used with aggregate functions. 
This means the WHERE clause is used for filtering individual rows on a table whereas the HAVING clause is used to filter groups
*/

/*
Q11) Write a query to display all flight_number where total airtime on a Thursday > 200
*/
select flight_number, sum(air_time) from tutorial.flights 
where day_of_week in ('Thursday')
group by flight_number
having sum(air_time) > 200;

