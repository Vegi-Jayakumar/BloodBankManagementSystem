create database bloodbank_db;

use bloodbank_db;

create table blood_group(
blood_group_id int primary key, 
blood_group_name varchar(20)
);

insert into blood_group values
(1, 'O positive'),
(2, 'O negative'), 
(3, 'A positive'),
(4, 'A negative'),
(5, 'B positive'),
(6, 'B negative'),
(7, 'AB positive'),
(8, 'AB negative');

select*from blood_group;
