create schema uniquest;

use uniquest; 

create table Universities
(
university_id int not null auto_increment,
university_name varchar(60) not null, 
location varchar(60), 
application_deadline date not null, 
constraint universitiesPK primary key (university_id)
);

create table Students 
(
student_id int not null auto_increment,
first_name varchar(60) not null, 
last_name varchar(60) not null,
email varchar (60) not null, 
gre_score int, 
toefl_score int,
preferred_location varchar(60),
phone varchar(60) not null, 
date_of_birth date not null, 
constraint studentsPK primary key (student_id)
);

create table Funding 
(
funding_id int not null auto_increment, 
university_id int not null, 
funding_source varchar(60) not null, 
amount int not null, 
funding_year year,
constraint fundingPK primary key (funding_id),
constraint fundingFK foreign key (university_id) references Universities(university_id) 
);

create table Programs
(
program_id int not null auto_increment, 
university_id int not null, 
program_name varchar(60) not null, 
program_level enum ('Undergraduate','Graduate'),
duration int not null, 
tuition_fee int not null,
constraint programsPK primary key (program_id),
constraint programFK foreign key (university_id) references Universities(university_id)
);

create table Ranking
(
ranking_id int not null auto_increment,
university_id int not null,
program_id int not null,
program_rank int not null, 
constraint rankingPK primary key (ranking_id),
constraint rankingFK1 foreign key (university_id) references Universities(university_id),
constraint rankingFK2 foreign key (program_id) references Programs(program_id)
);

create table Admissions
(
admission_id int not null auto_increment, 
university_id int not null, 
program_id int not null,
min_gre int not null, 
min_toefl int not null, 
min_gpa int not null, 
required_work_experience int not null,
admission_year year, 
constraint admissionPK primary key (admission_id),
constraint admissionFK1 foreign key (university_id) references Universities(university_id),
constraint admissionFK2 foreign key (program_id) references Programs(program_id)
);

create table Users
(
user_id int not null auto_increment,
student_id int not null, 
rule int not null, 
constraint usersPK primary key (user_id),
constraint usersFK foreign key (student_id) references Students(student_id)
);

create table Wishlist
(
wishlist_id int not null auto_increment, 
student_id int not null, 
program_id int not null, 
constraint wishlistPK primary key (wishlist_id),
constraint wishlistFK1 foreign key (student_id) references Students(student_id),
constraint wishlistFK2 foreign key (program_id) references Programs(program_id) 
);


Insert into Universities (university_name, location, application_deadline) VALUES
('Massachusetts Institute of Technology', 'Cambridge, MA', '2024-12-15'),
('Stanford University', 'California', '2024-12-01'),
('University of California Berkeley', 'California', '2024-11-30'),
('Harvard University', 'Massachusetts', '2024-12-15'),
('Georgia Institute of Technology', 'Atlanta, GA', '2024-11-01'),
('Carnegie Mellon University', 'Pennsylvania', '2024-12-10'),
('University of Michigan', 'Michigan', '2024-11-15'),
('University of Texas Austin', 'Texas', '2024-11-01');

INSERT INTO Students (first_name, last_name, email, gre_score, toefl_score, preferred_location, phone, date_of_birth) VALUES
('John', 'Smith', 'john.smith@email.com', 325, 105, 'California', '5551234567', '1998-05-15'),
('Emma', 'Johnson', 'emma.j@email.com', 318, 102, 'Massachusetts', '5552345678', '1999-03-22'),
('Michael', 'Brown', 'michael.b@email.com', 330, 110, 'Texas', '5553456789', '1997-11-30'),
('Sarah', 'Davis', 'sarah.d@email.com', 315, 98, 'Michigan', '5554567890', '1998-07-18'),
('James', 'Wilson', 'james.w@email.com', 328, 108, 'Georgia', '5555678901', '1999-01-25');

INSERT INTO Funding (university_id, funding_source, amount, funding_year) VALUES
(1, 'Research Grant', 50000, 2024),
(1, 'Merit Scholarship', 30000, 2024),
(2, 'Department Fellowship', 45000, 2024),
(3, 'Teaching Assistantship', 25000, 2024),
(4, 'Research Fellowship', 40000, 2024),
(5, 'Merit Award', 35000, 2024),
(6, 'Department Grant', 42000, 2024),
(7, 'Graduate Fellowship', 38000, 2024);

INSERT INTO Programs (university_id, program_name, program_level, duration, tuition_fee) VALUES
(1, 'Computer Science', 'Graduate', 2, 55000),
(1, 'Data Science', 'Graduate', 2, 52000),
(2, 'Artificial Intelligence', 'Graduate', 2, 58000),
(3, 'Software Engineering', 'Graduate', 2, 48000),
(4, 'Machine Learning', 'Graduate', 2, 56000),
(5, 'Robotics', 'Graduate', 2, 45000),
(6, 'Information Systems', 'Graduate', 2, 50000),
(7, 'Cybersecurity', 'Graduate', 2, 47000);

INSERT INTO Ranking (university_id, program_id, program_rank) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 4),
(5, 6, 5),
(6, 7, 6),
(7, 8, 7);

INSERT INTO Admissions (university_id, program_id, min_gre, min_toefl, min_gpa, required_work_experience, admission_year) VALUES
(1, 1, 320, 100, 3, 2, 2024),
(1, 2, 315, 100, 3, 1, 2024),
(2, 3, 318, 100, 3, 2, 2024),
(3, 4, 310, 95, 3, 1, 2024),
(4, 5, 325, 100, 3, 2, 2024),
(5, 6, 310, 95, 3, 1, 2024),
(6, 7, 315, 98, 3, 2, 2024),
(7, 8, 312, 95, 3, 1, 2024);

INSERT INTO Users (student_id, rule) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

INSERT INTO Wishlist (student_id, program_id) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 5),
(3, 4),
(4, 6),
(5, 2),
(5, 7);

Select * from Students;