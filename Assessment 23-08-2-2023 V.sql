
/* *************************************************************** 
*****************Assessment 1 (Vivek Rana)************************
**************************************************************** */

create database Assessmentdb;
use Assessmentdb;

create table country (
	id int primary key not null auto_increment,
    country_name varchar(50),
    country_name_eng varchar(50),
    country_code char(3)
);

create table city (
	id int primary key not null auto_increment,
    city_name varchar(50),
    lat varchar(50),
    long_ varchar(50),
    country_id int not null,
    foreign key(country_id) references country(id)
    );

create table customer (
	id int primary key not null auto_increment,
    customer_name varchar(50),
    city_id int not null,
    customer_address varchar(100),
    next_call_date date,
    ts_inserted datetime,
    foreign key(city_id) references city(id)
);

select * from country, city, customer;

insert into country (country_name, country_name_eng, country_code) values ('Deutschland','Germany','DEU');
insert into country (country_name, country_name_eng, country_code) values ('Srbija','Serbia','SRB');
insert into country (country_name, country_name_eng, country_code) values ('Hrvatska','Croatia','HRV');
insert into country (country_name, country_name_eng, country_code) values ('United States of America','United States of America','USA');
insert into country (country_name, country_name_eng, country_code) values ('Polska','Poland','POL');
insert into country (country_name, country_name_eng, country_code) values ('Espana','Spain','ESP');
insert into country (country_name, country_name_eng, country_code) values ('Rossiya','Russia','RUS');

select * from country;

insert into city (city_name, lat, long_, country_id) values ('Berlin', 52.520008, 13.404954, 1);
insert into city (city_name, lat, long_, country_id) values ('Belgrade', 44.787197, 20.457273, 2);
insert into city (city_name, lat, long_, country_id) values ('Zaagreb', 45.815299, 15.966568, 3);
insert into city (city_name, lat, long_, country_id) values ('New York',40.730610, '-73.93524', 4);
insert into city (city_name, lat, long_, country_id) values ('Los Angeles', 34.052235, '-118.2436', 4);
insert into city (city_name, lat, long_, country_id) values ('Warsaw', 52.237049, 21.017532, 5);

select * from city;

insert into customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) values ('Jewelry Store', 4, 'Long Street 120', '2020/01/21','2020/01/09 14:01:20.000');
insert into customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) values ('Bakery', 1, 'Kurfurstendamm 25', '2020/02/21','2020/01/09 17:52:15.000');
insert into customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) values ('Cafe', 1, 'Tauentzienstrabe 44', '2020/01/21','2020/01/10 08:02:49.000');
insert into customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) values ('Restaurant', 3, 'Ulica lipa 15', '2020/01/21','2020/01/10 09:20:21.000');

select * from customer;

-- Task : 1 (join multiple tables using left join)
-- List all Countries and customers related to these countries.

select country_name_eng , customer_name from country 
left join city
on country.id = city.country_id
left join customer
on city.id = customer.city_id;

-- For each country displaying its name in English, the name of the city customer is located in as well as the name of the customer.

select country_name_eng, city_name, customer_name from country
join city 
on country.id = city.country_id
join customer 
on city.id = customer.city_id; 
 
-- Return even countries without related cities and customers.

select country_name, city_name, customer_name from country 
left join city 
on country.id = city.country_id
left join customer 
on city.id = customer.city_id
where city_name is  null;

-- Task : 2 (join multiple tables using both left and inner join)
-- Return the list of all countries that have pairs(exclude countries which are not referenced by any city). 
-- For such pairs return all customers.
select country_name, city_name from country 
left join city
on country.id = city.country_id
inner join customer
on city.id = customer.city_id;

-- Return even pairs of not having a single customer

select country_name, city_name, customer_name from country 
left join city
on country.id = city.country_id
right join customer
on city.id = customer.city_id;

select country_name_eng, city_name, customer_name from country 
join city on country.id = city.country_id 
left join customer on country.id = customer.city_id
having customer_name is null; 

-- Make sure to make your code clean kneat