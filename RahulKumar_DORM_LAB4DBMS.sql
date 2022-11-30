drop database if exists Data_Management;
create database Data_Management; 
use Data_Management;
drop table if exists Supplier ;
create table Supplier (
SUPP_ID int primary key not null,
SUPP_NAME varchar(50) not null,
SUPP_CITY varchar(50) not null,
SUPP_PHONE varchar(50) not null
);
drop table if exists customer;
create table Customer (
CUS_ID int primary key not null,
CUS_NAME varchar(20) not null,
CUS_CITY varchar(30) not null,
CUS_PHNE varchar(10) not null,
CUS_GENDER char
);
drop table if exists category;
create table category (
CAT_ID int primary key not null,
CAT_NAME varchar(20) not null
);
drop table if exists Product;
create table Product (
PRO_ID int primary key not null,
PRO_NAME varchar (20) not null default "Dummy",
PRO_DESC varchar(60),
CAT_ID int ,
foreign key(CAT_ID) references category(CAT_ID)
);
drop table if exists supplier_pricing;
create table supplier_pricing(
PRICING_ID int primary key ,
PRO_ID int not null ,
SUPP_ID int not null,
SUPP_PRICE int default 0,
foreign key(PRO_ID) references product (PRO_ID),
foreign key(SUPP_ID) references supplier (SUPP_ID)
);
drop table if exists Order_;
create table Order_(
ORD_ID int primary key ,
ORD_AMOUNT int not null,
ORD_DATE date not null,
CUS_ID int not null,
PRICING_ID int not null,
foreign key(CUS_ID) references customer (CUS_ID),
foreign key(PRICING_ID) references supplier_pricing (PRICING_ID)
);
drop table if exists rating;
create table rating (
RAT_ID int primary key ,
ORD_ID int not null,
foreign key(ORD_ID) references Order_(ORD_ID),
RAT_RATSTARS int not null
);

insert into supplier values (1,"Rajesh Retails","Delhi",1234567890);
insert into supplier values (2,"Appario Ltd","Mumbai",46541231564);
insert into supplier values (3,"Knome Products","Banglore",4567398647);
insert into supplier values (4,"Bansal Retails","Konchi",78713007861);
insert into supplier values (5," Mittal Ltd","Lucknow",71689454732);

insert into customer values (1,"AKASH",9999999999,"DELHI",'M');
insert into customer values (2,"AMAN",7524454248,"NOIDA",'M');
insert into customer values (3,"NEHA",9999999999,"MUMBAI",'F');
insert into customer values (4,"MEGHA",9994562399,"KOLKATA",'F');
insert into customer values (5,"PULKIT",7894669999,"LUCKNOW",'M');

insert into category values (1,"Books");
insert into category values (2,"Gamers");
insert into category values (3,"Groceries");
insert into category values (4,"Electronics");
insert into category values (5,"Clothes");

insert into product values (1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into product values (2," T SHIRT","SIZE-L with Black, Blue and White variations",5);
insert into product values (3,"ROG LAPTOP","Windows 10 with 15 inch screen and i7 processor,1TB SSD",4);
insert into product values (4,"OATS","Highly Nutritious from Nestle",3);
insert into product values (5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into product values (6,"MILK","1L Toned MIlk",3);
insert into product values (7,"BOAT EARPHONES","1.5Meter long Dolby Atmos",4);
insert into product values (8,"JEANS","Stretchable Denim Jeans with various sizes and color",5);
insert into product values (9,"Project IGI","compatible with windows 7 and above",2);
insert into product values (10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into product values (11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into product values (12,"Train Your Brain","By Shireen Stephen",1);


INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

insert into order_ values (101,1500,'2021-10-06',2,1);
insert into order_ values (102,1000,'2021-10-12',3,5);
insert into order_ values (103,30000,'2021-09-16',5,2);
insert into order_ values (104,1500,'2021-10-05',1,1);
insert into order_ values (105,3000,'2021-08-16',4,3);
insert into order_ values (106,1450,'2021-08-18',1,9);
insert into order_ values (107,789,'2021-09-01',3,7);
insert into order_ values (108,780,'2021-09-07',5,6);
insert into order_ values (109,3000,'2021-00-10',5,3);
insert into order_ values (110,2500,'2021-09-10',2,4);
insert into order_ values (111,1000,'2021-09-15',4,5);
insert into order_ values (112,789,'2021-09-16',4,7);
insert into order_ values (113,31000,'2021-09-16',1,8);
insert into order_ values (114,1000,'2021-09-16',3,5);
insert into order_ values (115,3000,'2021-09-16',5,3);
insert into order_ values (116,99,'2021-09-17',2,14);

insert into rating values (1,101,4);
insert into rating values (2,102,3);
insert into rating values (3,103,1);
insert into rating values (4,104,2);
insert into rating values (5,105,4);
insert into rating values (6,106,3);
insert into rating values (7,107,4);
insert into rating values (8,108,4);
insert into rating values (9,109,3);
insert into rating values (10,110,5);
insert into rating values (11,111,3);
insert into rating values (12,112,4);
insert into rating values (13,113,2);
insert into rating values (14,114,1);
insert into rating values (15,115,1);
insert into rating values (16,116,0);


/*  Q 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000*/
select Count(CUS_ID),CUS_GENDER from customer where Cus_id =any (select cus_Id from order_ group by CUS_ID having sum(ORD_AMOUNT)>=3000) group by CUS_GENDER;

/*  Q 4) Display all the orders along with product name ordered by a customer having Customer_Id=2 */
select PRO_ID ,Pro_Name from product where PRO_ID=any(select pro_id from supplier_pricing where PRICING_ID=any(select PRICING_ID from order_ where CUS_ID=2));

/*  Q 5) Display the Supplier details who can supply more than one product */
 SELECT  s.SUPP_ID,s.SUPP_NAME,s.SUPP_CITY,s.SUPP_PHONE, count(sp.PRO_ID) distinct_product_count FROM DATA_MANAGEMENT.supplier_pricing sp , data_management.supplier s
where s.SUPP_ID = sp.SUPP_ID group by sp.SUPP_ID 
having count(sp.PRO_ID)>1;

/*  Q 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product */
select C.CAT_ID, C.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE from category as C
inner join product as p on C.CAT_ID=p.CAT_ID
inner join supplier_pricing as sp on sp.PRO_ID=p.PRO_ID
group by C.CAT_NAME having min(sp.SUPP_PRICE);

/*  Q 7) Display the Id and Name of the Product ordered after “2021-10-05” */
select PRO_ID ,pro_name from product where PRO_ID=any(select pro_Id from supplier_pricing where PRICING_ID=any(select pricing_id from order_ where Ord_date>'2021-10-05'));

/*  Q 8) Display customer name and gender whose names start or end with character 'A'. */
select cus_name ,cus_gender from customer where cus_name like 'a%' or CUS_NAME like '%a';

/*  Q 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.*/
Delimiter $$

create procedure display() 
begin 
SELECT s.SUPP_ID, s.SUPP_NAME, r.RAT_RATSTARS ,
CASE WHEN r.RAT_RATSTARS = 5 THEN  'Excellent Service'
WHEN r.RAT_RATSTARS>4 THEN 'Good Service'
WHEN r.RAT_RATSTARS>2 THEN 'Average Service'
ELSE 'Poor Service' END AS Type_of_Service
FROM  data_management.rating r, data_management.`order_` o, data_management.supplier_pricing sp,
 data_management.supplier s
WHERE o.ORD_ID = r.ORD_ID
AND sp.PRICING_ID = o.PRICING_ID
AND s.SUPP_ID = sp.SUPP_ID;
end $$

Delimiter ;

call display()



