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

create table donor(
donor_id int primary key,
donor_name varchar(20),
donor_age int,
donor_gender varchar(10),
donor_phone varchar(15),
blood_group_id int, 
last_donation_date DATE,
FOREIGN KEY (blood_group_id) REFERENCES blood_group(blood_group_id)
);

insert into donor values
(1, 'Rahul', 25, 'Male', '9876543210', 1, '2026-08-15'),
(2, 'Priya', 28, 'Female', '9846358726',2,'2026-07-20'),
(3, 'Arjun', 32, 'Male', '8643975468', 3, '2026-06-10'),
(4, 'Sneha', 24, 'Female', '8642835971', 4, '2026-08-05'),
(5, 'Kiran', 30, 'Male', '9730184687', 5, '2026-05-25'),
(6, 'Anjali', 27, 'Female', '9106728106', 6, '2026-07-12'),
(7, 'Vikram', 35, 'Male', '9604380344', 7, '2026-04-18'),
(8, 'Meena', 29, 'Female', '7603486297', 8, '2026-06-30'),
(9, 'Ravi', 26, 'Male', '7692468031',1,'2026-08-22'),
(10, 'Pooja', 31, 'Female', '9346800173', 2, '2026-05-15');

create table donation(
id int primary key,
donor_id int,
blood_group_id int,
donation_date DATE,
units_donated int,
FOREIGN KEY (donor_id) references donor(donor_id),
foreign key (blood_group_id) references blood_group(blood_group_id));
 
INSERT INTO donation
VALUES
(1, 1, 1, '2026-08-15', 1),
(2, 2, 2, '2026-07-20', 1),
(3, 3, 3, '2026-06-10', 2),
(4, 4, 4, '2026-08-05', 1),
(5, 5, 5, '2026-05-25', 1),
(6, 6, 6, '2026-07-12', 2),
(7, 7, 7, '2026-04-18', 1),
(8, 8, 8, '2026-06-30', 1),
(9, 9, 1, '2026-08-22', 1),
(10, 10, 2, '2026-05-15', 2);

create table blood_stock(
stock_id int primary key,
blood_group_id int,
units_available int,
expiry_date DATE,
collection_date DATE,
foreign key (blood_group_id)references blood_group(blood_group_id));

INSERT INTO blood_stock
VALUES
(1, 1, 15, '2026-10-15', '2026-09-20'),
(2, 2, 10, '2026-10-18', '2026-09-23'),
(3, 3, 20, '2026-10-20', '2026-09-25'),
(4, 4, 8,  '2026-10-12', '2026-09-18'),
(5, 5, 12, '2026-10-22', '2026-09-27'),
(6, 6, 18, '2026-10-25', '2026-09-28'),
(7, 7, 7,  '2026-10-10', '2026-09-16'),
(8, 8, 14, '2026-10-19', '2026-09-24');

create table blood_issue(
issue_id int primary key,
request_id int,
stock_id int,
issue_date DATE,
units_issued int,
foreign key(request_id) references blood_request(request_id),
foreign key(stock_id) references blood_stock(stock_id));

INSERT INTO blood_issue
VALUES
(1, 101, 1, '2026-09-21', 2),
(2, 102, 2, '2026-09-22', 1),
(3, 103, 3, '2026-09-23', 2),
(4, 104, 4, '2026-09-24', 1),
(5, 105, 5, '2026-09-25', 2),
(6, 101, 6, '2026-09-26', 1),
(7, 104, 7, '2026-09-27', 1),
(8, 102, 8, '2026-09-28', 2),
(9, 105, 1, '2026-09-29', 1),
(10, 103, 2, '2026-09-30', 1);

