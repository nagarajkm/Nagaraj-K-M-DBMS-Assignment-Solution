drop database if exists TravelOnTheGo;
create schema TravelOnTheGo;
use TravelOnTheGo;



create table passenger(
Passenger_name varchar(50) primary key ,Category varchar(50),Gender varchar(50),
Boarding_City varchar(50),Destination_City varchar(50),Distance int ,
Bus_Type varchar(50)
);

create table price( Bus_type varchar(50),Distance int , Price int primary key);
-- foreign key(Bus_type) references passenger(Bus_type));



insert into passenger value ("Sejal","AC","F","Bengaluru","Chennai","350","Sleeper");
insert into passenger value ("Anmol","Non-AC","M","Mumbai","Hyderabad","700","Sitting");
insert into passenger value ("Pallavi","AC","F","Panaji","Bengaluru","600","Sleeper");
insert into passenger value ("Khusboo","AC","F","Chennai","Mumbai","1500","Sleeper");
insert into passenger value ("Udit","Non-AC","M","Trivandrum","Panaji","1000","Sleeper");
insert into passenger value ("Ankur","AC","M","Nagpur","Hyderabad","500","Sitting");
insert into passenger value ("Hemant","Non-AC","M","Panaji","Mumbai","700","Sleeper");
insert into passenger value ("Manish","Non-AC","M","Hyderabad","Bengaluru","500","Sitting");
insert into passenger value ("Piyush","AC","M","Pune","Nagpur","700","Sitting");

select *from passenger;

insert into price value("Sleeper", 350, 770);
insert into price value("Sleeper", 500, 1100);
insert into price value("Sleeper", 600, 1320);
insert into price value("Sleeper", 700, 1540);
insert into price value("Sleeper", 1000, 2200);
insert into price value("Sleeper", 1200, 2640);
insert into price value("Sleeper", 1500, 2700);
insert into price value("Sitting", 500, 620);
insert into price value("Sitting", 600, 744);
insert into price value("Sitting", 700, 868);
insert into price value("Sitting", 1000, 1240);
insert into price value("Sitting", 1200, 1488);
insert into price value("Sitting", 1500, 1860);

select *from price;
-- 3
select Gender,count(Gender) from passenger where Distance>=600 group by Gender;
-- 4
select Bus_type, min(price) from price where Bus_type="Sleeper";
-- 5
select Passenger_name from passenger where Passenger_name like 'S%';


-- 6
select Passenger_name, Boarding_City, Destination_City, pp.Bus_Type, Price 
from passenger p 
join price pp on p.Bus_Type = pp.Bus_type AND p.Distance = pp.Distance ;
-- 7
select Passenger_name, Price 
from passenger p 
join price pp on p.Bus_Type = pp.Bus_type AND p.Distance = pp.Distance
where p.Bus_Type = 'Sitting' AND p.Distance = 1000;

-- 8
select pp.Bus_Type, pp.Price 
from passenger p 
join price pp ON p.Distance = pp.Distance
where pp.Distance = 
(
SELECT Distance 
FROM passenger 
WHERE (Boarding_City = 'Bengaluru' AND Destination_City = 'Panaji') 
OR (Boarding_City = 'Panaji' AND Destination_City = 'Bengaluru')
);
-- 9
select Distance-- , count(Distance)
from passenger 
group by Distance
having count(Distance) = 1
order by distance desc;



-- 10
SELECT passenger_name, (distance/(SELECT SUM(distance) from passenger)*100) 
as PerctDistance
from passenger;

-- 11
SELECT DISTANCE, PRICE, 
CASE WHEN Price > 1000 THEN 'Expensive'
	 WHEN Price > 500 THEN 'Average'
ELSE 'Cheap' END AS 'Category'
FROM Price;


