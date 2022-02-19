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