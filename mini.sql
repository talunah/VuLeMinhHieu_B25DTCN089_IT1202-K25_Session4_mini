create database btth;
use btth;
drop database btth;

create table student(
	student_id int primary key auto_increment,
	student_name varchar(100) not null,
	date_of_birth date not null,
	student_email varchar(100) not null unique
);

create table teacher(
	teacher_id int primary key auto_increment,
    teacher_name varchar(100) not null,
	teacher_email varchar(100) not null unique
);

create table course(
	course_id int primary key auto_increment,
	course_name varchar(100) not null unique,
	course_description text,
    number_of_lessons int check(number_of_lessons>0) not null,
    teacher_id int ,
    foreign key(teacher_id) references teacher(teacher_id)
);
create table score(
	student_id int auto_increment,
    course_id int auto_increment,
    midterm_score float(2,1) check(midterm_score BETWEEN 0 AND 10),
    final_score float(2,1) check(final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)

);
create table Enrollment(
	student_id int auto_increment,
    course_id int auto_increment,
    enroll_date DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

insert into student (student_name, date_of_birth, student_email)
values
	('Nguyen Van A', '2004-05-10', 'a@gmail.com'),
	('Tran Thi B', '2003-08-12', 'b@gmail.com'),
	('Le Van C', '2004-01-20', 'c@gmail.com'),
	('Pham Thi D', '2002-11-05', 'd@gmail.com'),
	('Dang Viet Dung', '2003-06-18', 'e@gmail.com');

insert into teacher (teacher_name, teacher_email)
values
	('Dr. Nguyen', 'nguyen@uni.edu'),
	('Dr. Tran', 'tran@uni.edu'),
	('Dr. Le', 'le@uni.edu'),
	('Dr. Pham', 'pham@uni.edu'),
	('Dr. Hoang', 'hoang@uni.edu');

insert into course (course_name, course_description, number_of_lessons, teacher_id)
values
	('Database', 'Hoc ve SQL', 20,4),
	('Java', 'Lap trinh Java', 25,3),
	('Web', 'HTML CSS JS', 15,2),
	('Python', 'Lap trinh Python', 30,1),
	('AI', 'Tri tue nhan tao', 40,3);

insert into enrollment (student_id,course_id,enroll_date)
values
	(2,1,CURRENT_DATE),
	(4,4,CURRENT_DATE),
	(2,3,CURRENT_DATE),
	(1,2,CURRENT_DATE),
	(3,1,CURRENT_DATE);
    
INSERT INTO score (student_id,course_id,midterm_score, final_score)
values
	(2,1,8.5, 9.0),
	(4,4,7.0, 8.0),
	(2,3,6.5, 7.5),
	(1,2,9.0, 9.5),
	(3,1,5.5, 6.0);
    
update student
set student_email = 'newemail@gmail.com'
where student_id = 3;

update course
set course_description = 'Hoc SQL tu co ban den nang cao'
where course_id = 1;

update score
set final_score = 9.5
where student_id = 1 AND course_id = 2;

delete from Enrollment
where student_id = 4 AND course_id = 4;

delete from Score
where student_id = 4 AND course_id = 4;

SELECT * FROM Student;

SELECT * FROM Teacher;

SELECT * FROM Course;

SELECT * FROM Enrollment;

SELECT * FROM Score;

