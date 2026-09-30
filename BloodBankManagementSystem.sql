/*Blood Bank Management System*/

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

create table patient(
patient_id int primary key,
patient_name varchar(50),
age int,
gender enum('Male','Female','Transgender','Prefer not to say') default 'Prefer not to say',
hospital_name varchar(50),
phone varchar(10) unique,
blood_group_id int,
foreign key (blood_group_id) references blood_group(blood_group_id)
);

insert into patient values
(1, 'Aarav Sharma', 34, 'Male', 'Apollo Hospital', '9875462310', 1),
(2, 'Priya Verma', 28, 'Female', 'Fortis Healthcare', '9876543221', 3),
(3, 'Alex Mercer', 42, 'Transgender', 'Max Super Speciality', '9875654323', 2),
(4, 'Sam Taylor', 19, 'Prefer not to say', 'Apollo Hospital', '9876543824', 4),
(5, 'Rajesh Patel', 55, 'Male', 'Manipal Hospital', '9876543925', 1);

create table blood_request(
request_id int primary key,
patient_id int,
status enum('Pending','Completed') default 'Pending',
request_date date,
units_required int,
Blood_group_id int,
foreign key (blood_group_id) references blood_group(blood_group_id),
foreign key (patient_id) references patient(patient_id)
);

insert into blood_request values
(101, 1, 'Pending', '2026-09-25', 2, 1),
(102, 2, 'Completed', '2026-09-26', 1, 3),
(103, 3, 'Pending', '2026-09-28', 3, 2),
(104, 1, 'Completed', '2026-09-29', 1, 1),
(105, 5, 'Pending', '2026-09-30', 2, 1);
