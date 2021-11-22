create database TravelOnTheGo;
use TravelOnTheGo;
create table PASSENGER(
pass_name varchar(50),
category varchar(20),
gender varchar(10),
bording_city varchar(30),
destination_city  varchar(30),
distance int,
bus_type varchar(20)
);

drop table PRICE;
create table PRICE(
bus_type varchar(30),
distance int,
price int 
);

insert into PASSENGER values("Sejal","AC","f","Bengaluru","Chennai",350,"Sleeper" );
insert into PASSENGER values("Anmol","Non-AC","m","Mumbai","Hyderabad",700,"Sitting");
insert into PASSENGER values("Pallavi","AC","f","Panaji","Bengaluru",600,"Sleeper");
insert into PASSENGER values("Khusboo","AC","f","Chennai","Mumbai",1500,"Sleeper");
insert into PASSENGER values("Udit","Non-AC","m","Trivandrum","panaji",1000,"Sleeper");
insert into PASSENGER values("Ankur","AC","m","Nagpur","Hyderabad",500,"Sitting");
insert into PASSENGER values("Hemant","Non-AC","m","panaji","Mumbai",700,"Sleeper");
insert into PASSENGER values("Manish","Non-AC","m","Hyderabad","Bengaluru",	500,"Sitting");
insert into PASSENGER values("Piyush","AC","m","Pune","Nagpur",700,"Sitting");
select * from PASSENGER;

insert into PRICE values("Sleeper",350,770);
insert into PRICE values("Sleeper",500,1100);
insert into PRICE values("Sleeper",600,1320);
insert into PRICE values("Sleeper",700,1540);
insert into PRICE values("Sleeper",1000,2200);
insert into PRICE values("Sleeper",1200,2640);
insert into PRICE values("Sleeper",350,434);
insert into PRICE values("Sitting",500,620);
insert into PRICE values("Sitting",500,620);
insert into PRICE values("Sitting",600,744);
insert into PRICE values("Sitting",700,868);
insert into PRICE values("Sitting",1000,1240);
insert into PRICE values("Sitting",1200,1488);
insert into PRICE values("Sitting",1500,1860);
select * from PRICE;


-- 3) How many females and how many male passengers travelled for a minimum distance of
-- 600 KM s?

select * from PASSENGER;
select gender, count(distance) from  PASSENGER group by distance having distance<=600;


-- 4) Find the minimum ticket price for Sleeper Bus.

select bus_type, min(price) from  PRICE group by bus_type having min(price);




-- 5)Select passenger names whose names start with character 'S'
    
    select * from PASSENGER where pass_name like 's%' ;



-- 6)Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output

select pass_name ,bording_city,destination_city,price  from PASSENGER p
inner join PRICE r on p.distance=r.distance order by price;


-- 7)What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KM s

select pass_name,distance,bus_type from PASSENGER where distance=1000 and bus_type="Sitting";


-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.

select pass_name,distance from PASSENGER Order by pass_name desc;




