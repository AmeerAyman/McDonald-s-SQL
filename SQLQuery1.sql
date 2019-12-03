create database company121;

create table employees
(
ssn int,
Fname varchar(30) not null,
Email varchar (30),
minit char ,
Lname varchar (30),
Bdate date,
Addresss varchar (50),
Sex varchar (10),
Salary int,
Super_ssn int,
Dno int,
constraint Emp_pk primary key (ssn),
constraint Emp_fk foreign key (Super_ssn) references employees (ssn),
constraint Emp_fk1 foreign key (Dno) references Department (Dnumber)
on delete set null
on update cascade 
);
create table Department  
(
Dname varchar (30),
Dnumber int not null,
Mgr_ssn int,
Mgr_start_date date,
constraint Dep_pk Primary key (Dnumber),
);
create table Dept_Locations
(
Dnumber int,
Dlocation varchar (40)
constraint Dept_Location_pk primary key (Dnumber,Dlocation),
constraint Dept_Location_fk foreign key(Dnumber) references Department (Dnumber),
);

create table Project 
(
Pname varchar (20),
Pnumber int,
Plocation varchar (30),
Dnum int,
constraint Project_pk primary key (Pnumber),
constraint Project_fk foreign key(Dnum) references Department (Dnumber)
on delete set null
on update cascade 


);
create table Works_on
(
Essn int,
Pno int,
Hourss int,
constraint Works_on_pk primary key (Essn,Pno),
constraint Works_on_fk foreign key(Essn)references employees (ssn),
constraint Works_on_fk1 foreign key(Pno) references Project (Pnumber),

);
create table dependents
(
Essn int,
Dependent_name varchar (40),
Sex varchar (10),
Bdate date,
Relationship varchar(30),
constraint Dependent_pk primary key (Essn,Dependent_name),
constraint Dependent_fk foreign key(Essn) references employees (ssn),

);

insert into employees
values(1, 'Ahmed', 'ahmed@hotmail.com' ,'S', 'Sami', '1986/10/12','6 pp stret','M',10000,null,1  )
insert into employees
values(2, 'jamal', 'ahmed@hotmail.com' ,'H', 'Sami', '1986/11/12','1 pp stret','M',10000,2 ,3 )
insert into employees
values(3, 'Samer', 'Samer@hotmail.com' ,'A', 'Sami', '1986/9/12','25 pp stret','M',10000,3, 2 )

insert into Department 
values ('Pr',1,1,'1990/6/6')
insert into Department
values ('Hr',2,1,'1996/6/9')
insert into Department 
values ('Media',3,1,'1999/3/9')

insert into Project 
values ('Pro1',1,'cairo',3)
insert into Project 
values ('Pro2',2,'cairo',3)
insert into Project 
values ('Pro3',3,'cairo',3)

update employees
set Salary=(Salary*0.2)+Salary
where Salary<=3000;

delete from Project;

delete from department
where Dnumber='3';
