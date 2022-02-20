create schema TravelOnTheGo;

use TravelOnTheGo;

-- Passanger(Passanger_name,Catagory,Gender,Boarding_city,Destination_city,Distance,Bus_type)
create table Passanger(
Passanger_name varchar(60) primary key not null,
Catgory varchar(45) null,
Gender varchar(45) null,
Boarding_city varchar(45) null,
Destination_city varchar(45) null,
Distance int null,
Bus_type varchar(45) null
);

-- Price(Bus_type, Distance, Price)
create table Price(
Bus_type varchar(45) null,
Distance int null,
Price int null
);

-- Populating Passanger Table
insert into Passanger values("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
insert into Passanger values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into Passanger values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into Passanger values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into Passanger values("Udit","Non-AC","M","Trivandrum","panaji",1000,"Sleeper");
insert into Passanger values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into Passanger values("Hemant","Non-AC","M","panaji","Mumbai",700,"Sleeper");
insert into Passanger values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into Passanger values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");

-- Populating Price Table
insert into Price values("Sleeper",350,770);
insert into Price values("Sleeper",500,1100);
insert into Price values("Sleeper",600,1320);
insert into Price values("Sleeper",700,1540);
insert into Price values("Sleeper",1000,2200);
insert into Price values("Sleeper",1200,2640);
insert into Price values("Sleeper",1500,2700);
insert into Price values("Sitting",500,620);
insert into Price values("Sitting",600,744);
insert into Price values("Sitting",700,868);
insert into Price values("Sitting",1000,1240);
insert into Price values("Sitting",1200,1488);
insert into Price values("Sitting",1500,1860);

-- question 1     
select count(*)        
from passanger        
where distance >= 600        
group by gender;       
     
-- question 2     
select min(price)        
from price        
where bus_type = 'sleeper';       
     
-- question 3     
select *       
from passanger       
where passanger_name like 's%';       
     
-- question 4     
select passanger_name, boarding_city, destination_city, price, passanger.bus_type       
from passanger       
join price on passanger.bus_type=price.bus_type and passanger.distance=price.distance;       
     
-- question 5     
select passanger_name, price.price       
from passanger       
join price on passanger.bus_type=price.bus_type and passanger.distance=price.distance       
where passanger.distance = 1000 and price.bus_type = 'sitting';       
     
-- question 6     
select price.bus_type, price.price       
from price       
join passanger on passanger.distance=price.distance       
where (boarding_city='bengaluru' xor boarding_city='panaji') and (destination_city='bengaluru' xor destination_city='panaji');       
     
-- question 7     
select distinct distance       
from passanger       
order by distance desc;       
     
-- question 8     
select passanger_name, concat(distance * 100 / (select sum(distance) as dist from passanger), ' %') as percentage_distance       
from passanger;       
     
-- question 9    
select distance, price,    
case    
when price > 1000 then 'expensive'    
when price < 1000 and price > 500 then 'average'    
else 'cheap'    
end as price_notes    
from price;
