create database shop;
use shop;

create table offices(
o_id int not null auto_incerement,
primary key(o_id),
);

create table officers(
oficer_id int not null auto_incerement,
officer_name varchar(255),
pay int not null,
o_id int not null,
primary key(officer_id),
forign key(o_id) references offices(o_id),
);


create taable coustomers(
c_id int not null auto_incerement,
c_name varchar(255),
primary key(c_id),
);

create table crops(
crop_id int not null auto_incerement,
crop_name varchar(255),
price int,
priamry key(crop_id),
);

create table orders(
order_id int not null auto_incerement,
o_id int not null,
c_id int not null,
crop_id int not null,
priamry key(order_id),
foregin key(o_id) references offices(o_id),
foregin key(c_id) references coustomers(c_id),
foregin key(crop_id) references crops(crop_id),
);