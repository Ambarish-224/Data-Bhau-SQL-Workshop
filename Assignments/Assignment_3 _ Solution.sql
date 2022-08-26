-- Data Bhau SQL Workshop

-- My SQL Workshop Day-3 Assignment:-
-- Using Database Tutorial and crunchbase_acquisitions table

use tutorial;

-- Creating table with column headers

create table if not exists customer
(
customer_id int,
cust_name varchar(55),
city varchar(55),
grade int,
salesman_id int
);

create table if not exists orders
(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int
);

create table if not exists salesman
(
salesman_id int,
`name` varchar(35),
city varchar(35),
commission float
);


/*
alter table table_name
modify column_name datatype;
*/


-- to drop table
-- drop table salesman;

-- To drop data from table
-- truncate table table_name;

select * from salesman;

-- To change limit of loading records
set global max_allowed_packet = 209715200;

-- To Load data without warning or easy loading with out incorrect datatype we use sql_mode
SET SESSION sql_mode = '';

show variables like "secure_file_priv";

-- we can use this to on local-infile
SHOW GLOBAL VARIABLES LIKE 'local_infile';
set global local_infile = 1;

-- Creating table
-- To Load data from csv file to TABLE
LOAD DATA LOCAL INFILE 'C:/Users/Kamble/OneDrive/Desktop/Individual/Vishwajeet/Learning/SQL/Data Bhau/tutorial/customer.csv'
INTO TABLE customer
FIELDS TERMINATED BY ','
ENCLOSED BY '"'    -- WRITE SINGLE " IN  COLON ' '
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/Kamble/OneDrive/Desktop/Individual/Vishwajeet/Learning/SQL/Data Bhau/tutorial/salesman.csv'
INTO TABLE salesman
FIELDS TERMINATED BY ','
ENCLOSED BY '"'    -- WRITE SINGLE " IN  COLON ' '
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/Kamble/OneDrive/Desktop/Individual/Vishwajeet/Learning/SQL/Data Bhau/tutorial/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'    -- WRITE SINGLE " IN  COLON ' '
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- To display data --
select * from orders;
select * from salesman;
select * from customer;


/*
-- To drop Table -- 
drop table orders;
*/

-- SOLVE ASSIGNMENT QUESTIONS --

/*
1.	Write query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city
*/
select s.`name` as salesman, c.cust_name, s.city 
from
salesman as s
join
customer as c
on
s.salesman_id = c.salesman_id;

/*
2.	Write a query to find salesmen who have no customers.
*/
select s.name salesmen, c.cust_name 
from
salesman as s
left join
customer as c
on 
s.salesman_id = c.salesman_id
where cust_name is null;

/*
3.	Write a query to find customers who have no orders.
*/
select c.*, o.*
from
customer as c
left join
orders as o
on 
c.customer_id = o.customer_id
where ord_no is null;


/*
4.	Write a query to find number of orders per customer.
*/
select c.customer_id, c.cust_name customers, count(o.ord_no) order_count
from
customer as c
inner join
orders as o
on 
c.customer_id = o.customer_id
group by c.cust_name
order by 1,2;


/*
5.	Write a query to find customers who have placed more than 1 orders.
*/
select c.customer_id, c.cust_name customers, count(o.ord_no) as order_count
from
customer as c
inner join
orders as o
on 
c.customer_id = o.customer_id
group by c.cust_name
having count(o.ord_no) > 1;


/*
6.	Write a query to find customers who placed an order between 2012-09-01 and 2012-10-01
*/
select c.*, o.*
from
customer as c
inner join
orders as o
on 
c.customer_id = o.customer_id
where o.ord_date between '2012-09-01' and '2012-10-01';
-- where (orders.ord_date > 2012-09-01) and (orders.ord_date < 2012-10-01);


/*
7.	Write a query to find orders sold and amount taken from customers by each salesman.
*/
select a.salesman_id, a.name,
count(b.ord_no) as order_sold,
sum(b.purch_amt) as order_amt_collected
from
salesman as a
inner join 
orders as b
on a.salesman_id = b.salesman_id
group by 1,2
order by 1,2;


/*
8.	Write a query to find those orders where the order amount exists between 500 and 2000. 
Return ord_no, purch_amt, cust_name, city.
*/
select ord_no, purch_amt, cust_name, city
from
orders
inner join
customer
on 
orders.salesman_id - customer.salesman_id
where purch_amt between 500 and 2000
order by 2;


/*
9.	Write a SQL query to locate those salespeople who do not live in the same city 
where their customers live and have received a commission of more than 12% from the company. 
Return Customer Name, customer city, Salesman, salesman city, commission.
*/
select c.cust_name customer_name, c.city customer_city, 
s.`name` salesman_name, s.city salesman_city, s.commission
from
customer as c
join
salesman as s
on c.salesman_id = s.salesman_id
where (s.city <> c.city) and s.commission > 0.12;


/*
10.	write a SQL query to find the details of an order. 
Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
*/
select
a.ord_no,a.ord_date,a.purch_amt,
b.cust_name as customer_name,
c.name as salesman_name,
c.commission
from
orders as a
join
customer as b
on a.customer_id = b.customer_id
join
salesman as c
on a.salesman_id = c.salesman_id
order by 1;




