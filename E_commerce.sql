 create database E_commerce;
use E_commerce;

create table Supplier(
supp_id int primary key,
supp_name varchar(50),
city_supp varchar(50),
supp_phone float
);
drop table Customer;
create table Customer(
cus_id int primary key,
cust_name varchar(20),
cust_phone double,
cust_city varchar(20),
cus_gender varchar(10) 
);

create table Category(
cat_id int primary key,
cat_name varchar(20)

);

drop table Product;
create table Product (
pro_id int primary key,
pro_name varchar(30),
pro_desc varchar (50),
cat_id int,
foreign key (cat_id) references Category(cat_id)
);

create table ProductDetails(
prod_id int primary key,
pro_id int,
foreign key (pro_id) references Product(pro_id),
supp_id int,
foreign key (supp_id) references Supplier(supp_id),
price float
);

create table Orders(
ord_id int primary key,
ord_amount float,
ord_date varchar(50),
cus_id int ,
foreign key (cus_id)references Customer(cus_id),
prod_id int,
foreign key(prod_id) references ProductDetails(prod_id)
);
 
 
 drop table Rating;
 
 create table Rating(
 rat_id int primary key,
cus_id int ,
foreign key (cus_id)references Customer(cus_id),
 supp_id int,
foreign key (supp_id) references Supplier(supp_id),
rat_stars int
 );
 
 
 insert into Supplier values(1,"Rajesh Retails","Delhi",1234567890);
 insert into Supplier values(2,"Appario Ltd.","Mumbai",2589631470);
 insert into Supplier values(3,"Knome products","Banglore",9785462315);
 insert into Supplier values(4,"Bansal Retails","Kochi",8975463285);
 insert into Supplier values(5,"Mittal Ltd.","Lucknow",7898456532);
 select * from Supplier;
 
 insert into Customer values(1,"AAKASH",99999999,"DELHI","M");
 insert into Customer values (2,"AMAN",9785463,"NOIDA","M");
insert into Customer values(3,"NEHA",9999999,"MUMBAI","F");
insert into Customer values(4,"MEGHA",99945765,"KOLKATA","F");
insert into Customer values(5,"PULKIT",7894561,"LUCKNOW","M");
select * from Customer;

insert into Category values(1,"BOOKS");
insert into Category values(2,"GAMES");
insert into Category values(3,"GROCERIES");
insert into Category values(4,"ELECTRONICS");
insert into Category values(5,"CLOTHES");
 select * from Category;
 
 insert into Product values(1,"GTA V","DFJDJFDJFDJFDJFJF",2);
 insert into Product values(2,"TSHIRT","DFDFJDFJDKFD",5);
 insert into Product values(3,"ROG LAPTOP","DFNTTNTNTERND",4); 
insert into Product values(4,"OATS","REURENTBTOTH",3);
insert into Product values(5,"HARRY POTTER","NBEMCTHTJTH",1);
select * from Product;

insert into ProductDetails values(1,1,2,1500);
insert into ProductDetails values(2,3,5,30000);
insert into ProductDetails values(3,5,1,3000);
insert into ProductDetails values(4,2,3,2500);
insert into ProductDetails values(5,4,1,1000);
select * from ProductDetails;

insert into Orders values(20,15,"2021-10-12",3,5);
insert into Orders values(25,30500,"2021-9-16",5,2);
insert into Orders values(26,2000,"2021-10-05",1,1);
insert into Orders values(30,3500,"2021-8-16",4,3);
insert into Orders values(50,2000,"2021-10-6",2,1);

select * from Orders;

insert into Rating values(1,2,2,4);
insert into Rating values(2,3,4,3);
insert into Rating values(3,5,1,5);
insert into Rating values(4,1,3,2);
insert into Rating values(5,4,5,4);
select * from Rating;

-- 3) Display the number of the customer group by their genders who have placed any order
-- of amount greater than or equal to Rs.3000.

select * from Orders;
select * from Customer inner join Orders on Orders.cus_id=Customer.cus_id;
select cg.cus_gender, count(cus_gender) from (select cus_gender from Customer c inner join Orders o on 
o.cus_id=c.cus_id where o.ord_amount>=3000)as cg group by cus_gender;


-- 4)Display all the orders along with the product name ordered by a customer having
-- Customer_Id=2.
 
 
 select * from Orders where cus_id=2;
 select o.ord_id, o.ord_amount, o.ord_date,p.pro_id, p.pro_name from Orders o inner join Product p 
 on p.pro_id=o.prod_id and o.cus_id=2;
 
 
 -- 5)Display the Supplier details who can supply more than one product.
 
 select * from Supplier;
 select * from Product;
 select * from ProductDetails;
 select supp_id ,count(pro_id) from ProductDetails group by supp_id;
 select supp_id from (select supp_id ,count(pro_id) from ProductDetails group by supp_id) 
 as pd where pd.Product>1;
 select Supplier where supp_id in (select supp_id from (select supp_id ,count(pro_id) from ProductDetails group by supp_id) 
 as pd where pd.Product>1);
 select supp_id from ProductDetails group by supp_id having count(prod_id)>1;
 select * from Supplier where supp_id in (select supp_id from ProductDetails group by supp_id having 
 count(prod_id)>1);
 
 
 
 -- 6)Find the category of the product whose order amount is minimum.
 
 select min(ord_amount) from Orders;
 select * from Orders where ord_amount=(select min(ord_amount) from Orders ) ;
 select c.cat_name from Product p inner join Category c on c.cat_id=p.cat_id where p.pro_id in
 (select * from Orders where ord_amount=(select min(ord_amount) from Orders ));
 
 
-- 7)Display the Id and Name of the Product ordered after “2021-10-05".

select * from Orders where ord_date>"2021-10-5";
select pro_id, pro_name from Product p inner join Orders o on
 o.prod_id=p.pro_id where o.ord_date>"2021-10-5"; 

-- 9)Display customer name and gender whose names start or end with character 'A'.
select * from Customer where cust_name like 'A%'or cust_name like 'A%';
select * from Customer where cus_gender='M'; 


-- 10)Display the total order amount of the male customers.
select sum(ord_amount) from Orders o inner join Customer c on c.cus_id=o.cus_id
and c.cus_gender='M'
