create database apple_project; 
create table category(
category_id  varchar(100) primary key,
category varchar(100)
);
select * from sales;
create table products(
product_id_id  varchar(100) primary key,
product_name varchar(100) not null,
category_id varchar(100),
launch_date date,
price int 
);

create table sales(
sale_id  varchar(100) ,
sale_date varchar(100),
store_id varchar(100),
product_id  varchar(100),
quantity int 
);

create table stores(
store_id  varchar(100) primary key UNIQUE,
store_name varchar(100),
city varchar(100),
country  varchar(100)
); 

create table warranty(
claim_id  varchar(100),
claim_date date,
sales_id varchar(100),
repair_status  varchar(100)
); 

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE sales 
SET sale_date = STR_TO_DATE(@sale_date, '%Y-%m-%d');
SET SQL_SAFE_UPDATES = 0;


UPDATE sales
SET sales_date_new = STR_TO_DATE(sale_date, '%d-%m-%Y');

ALTER TABLE sales
CHANGE sales_date_new sale_date DATE;
