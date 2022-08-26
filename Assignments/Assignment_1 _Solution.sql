-- Data Bhau SQL Workshop

-- My SQL Workshop Day-1 Assignment:-
-- Using Database Tutorial and crunchbase_acquisitions table

use tutorial;

-- Creating table with column headers
create table if not exists crunchbase_acquisitions(
company_permalink varchar(125),
company_name varchar(125),
company_category_code varchar(125),
company_country_code varchar(125),
company_state_code varchar(125),
company_region varchar(125),
company_city varchar(125),
acquirer_permalink varchar(125),
acquirer_name varchar(125),
acquirer_category_code varchar(125),
acquirer_country_code varchar(125),
acquirer_state_code varchar(125),
acquirer_region varchar(125),
acquirer_city varchar(125),
acquired_at varchar(125),
acquired_month varchar(125),
acquired_quarter varchar(125),
acquired_year int ,
price_amount varchar(125),
price_currency_code varchar(125),
id int);

-- To drop data from table
-- truncate table crunchbase_acquisitions;

select * from crunchbase_acquisitions;

-- To change limit of loading records
set global max_allowed_packet = 209715200;

-- To Load data without warning or easy loading with out incorrect datatype we use sql_mode
SET SESSION sql_mode = '';

-- To Load data from csv file to TABLE
LOAD DATA LOCAL INFILE 'C:/Users/Kamble/OneDrive/Desktop/Individual/Vishwajeet/Learning/SQL/Data Bhau/tutorial/crunchbase_acquisitions.csv'
INTO TABLE crunchbase_acquisitions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'    -- WRITE SINGLE " IN  COLON ' '
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- To Count number of records or data
select count(*) from crunchbase_acquisitions;

-- To display data
select * from crunchbase_acquisitions;

-- SOLVE ASSIGNMENT QUESTIONS --

/*
Q.1) Write a query to select all 
     the columns from the table.
*/
select * from tutorial.crunchbase_acquisitions;

/*
Q.2) Write a query to select company_name, company_region
 and company city from the table
*/
select  company_name, company_region, company_city from tutorial.crunchbase_acquisitions;

/*
Q.3) Write a query to select all distinct
     values of company_state_code from 
     the table
*/
select distinct(company_state_code) from tutorial.crunchbase_acquisitions;

/*
Q.4) Write a query to display the 
     rows where acquired year >= 2005.
*/
select * from tutorial.crunchbase_acquisitions
where acquired_year >= 2005;

/*
Q.5) Write a query to display all the
     rows where id is between 33 and 91 
     OR acquired year is between 2005 and  
     2012.
*/
select * from tutorial.crunchbase_acquisitions 
where id between 33 and 91 or acquired_year between 2005 and 2012;

/*
Q.6) Write a query to display the rows
     where company_state_code is ‘TX’
*/
select * from tutorial.crunchbase_acquisitions 
where company_state_code = 'TX';

/*
Q.7) Write a query to display the rows
        where company_state_code in 
       (AL,AR,AZ,CA,CO,CT)
*/
Select * from tutorial.crunchbase_acquisitions
where company_state_code in ('AL','AR','AZ','CA','CO','CT');

/*
Q.8) Write a query to display all the
         rows where company_city starts
         with “Al”
*/
select * from tutorial.crunchbase_acquisitions 
-- we can use like to find inbetween letters of strings in columns and also we have used % to get all letters after our mention conditon string
where company_city like 'Al%';

/*
Q.9) Write a query to display all the 
         rows where company_city ends 
         with “dia”.
*/
select * from tutorial.crunchbase_acquisitions 
where company_city like '%dia';


