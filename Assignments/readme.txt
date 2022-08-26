# Data-Bhau-SQL-Workshop

In Assignments .docx file Drive Dataset Links will be given with solutions.
SQL Assignments files are also given you can open them in sql query editor.
Change Directory location to your saved dataset csv file from the drive link TO LOAD DATA IN TABLE using CSV to see solutions


ASSIGNMENT FOR CLASS 1 - INTRODUCTION TO SQL BY DATA BHAU 

Use https://mode.com/ : 
Tables: 
●	tutorial.crunchbase_acquisitions

1.	Write a query to select all the columns from the table.
2.	Write a query to select company_name, company_region and company city from the table.
3.	Write a query to select all distinct values of company_state_code from the table.
4.	Write a query to display the rows where acquired year >= 2015.
5.	Write a query to display all the rows where id is between 33 and 91 OR acquired year is between 2005 and 2012.
6.	Write a query to display the rows where company_state_code is ‘TX’
7.	Write a query to display the rows where company_state_code in (AL,AR,AZ,CA,CO,CT)
8.	Write a query to display all the rows where company_city starts with “Al”
9.	Write a query to display all the rows where company_city ends with “dia”



ASSIGNMENT FOR CLASS 2 - AGGREGATE FUNCTIONS BY DATA BHAU 

Use https://mode.com/ : 
Tables: 
●	tutorial.flights

1.	Write a query to get max distance travelled by any flight.
2.	Write a query to get average departure_delay where arrival_delay < 0.
3.	Write a query to get count of flights from JFK where distance is between 1900 and 2200.
4.	Write a query to get mean airtime of flights whose distance is between 1900 and 2200 and origin_airport in SNA,AUS,JFK
5.	Write a query to display count of flights from each airport that was cancelled.
6.	Write a query to display average distance travelled by each flight everyday.
7.	Write a query to display the total arrival delay each day.
8.	Write a query to display the days where average distance travelled is more than 5000.
9.	Write a query to display the arrival_airport where average arrival_delay  >  5.
10.	What is the difference between having and where clause ?
11.	Write a query to display all flight_number where total airtime on a Thursday > 200



ASSIGNMENT FOR CLASS 3 – JOINS-1 BY DATA BHAU 

Consider the following Table Schemas: 

SALESMAN:
salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12
        5008 | harry ben  | San Jose |       0.18
        5009 | Mike       | Delhi    |       0.19


CUSTOMER
 customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
        3111 | nick ben       | London     |   121 |        5005
        3112 | hk             | London     |   131 |        5005

ORDERS
ord_no      purch_amt   ord_date    customer_id  salesman_id
----------  ----------  ----------  -----------  -----------
70001       150.5       2012-10-05     3005         5002
70009       270.65      2012-09-10     3001         5005
70002       65.26       2012-10-05     3002         5001
70004       110.5       2012-08-17     3009         5003
70007       948.5       2012-09-10     3005         5002
70005       2400.6      2012-07-27     3007         5001
70008       5760        2012-09-10     3002         5001
70010       1983.43     2012-10-10     3004         5006
70003       2480.4      2012-10-10     3009         5003
70012       250.45      2012-06-27     3008         5002
70011       75.29       2012-08-17     3003         5007
70013       3045.6      2012-04-25     3002         5001

Use the above tables and write the queries based on the above tables and data.

1.	Write query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city
2.	Write a query to find salesmen who have no customers.
3.	Write a query to find customers who have no orders.
4.	Write a query to find number of orders per customer.
5.	Write a query to find customers who have placed more than 1 orders.
6.	Write a query to find customers who placed an order between 2012-09-01 and 2012-10-01
7.	Write a query to find orders sold and amount taken from customers by each salesman.
8.	Write a query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
9.	write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.
10.	write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 


