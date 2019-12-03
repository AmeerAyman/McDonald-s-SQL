create database mcdonalds;

create table mac_community
(
serial_no int        not null,
title     varchar(20),
Ndate     date,
code      int,
branches_l varchar(30),
monthlySale int,

constraint mac_community_pk
primary key (serial_no),
);
create table employee
(
ssn    int           not null,
Fname  varchar(20)   not null,
minit  char,
Lname  varchar(20)   not null,
salary float         not null,
Job_t  varchar(30)   not null,
z_code int,
street varchar(30),
city   varchar(15),
Bdate  date,
super_ssn int,
serial_NO int        not null,

constraint emp_pk
primary key (ssn),

constraint employee_supervisor_fk
foreign key (super_ssn)references employee (ssn),

constraint community_employee_fk
foreign key (serial_no)references mac_community(serial_no)           
);

create table emp_phone
(
ssn   int,
phone int, 

constraint emp_phone_pk
primary key(ssn,phone),

constraint emp_phone_fk
foreign key (ssn) references employee(ssn),
);

create table delivery
(
orderNo  int            not null,
pilotName varchar(15)   not null,
Dcharge   int,
targetAddress varchar(30),
itemBought  varchar(30),
orderOnline varchar(30),

constraint delivery_pk
primary key (orderNo),
);

create table works_on
(
ssn  int  not null,
orderNo int not null,

constraint works_on_pk
primary key (ssn,orderNo),

constraint works_on_fk
foreign key (ssn) references employee (ssn),

constraint works_on_fk
foreign key (orderNo) references delivery (orderNo),

);

create table mcService 
(
serial_No   int,
title     varchar(20),
Ndate     date,
code      int,
branches_l varchar(30),
monthlySale int,
freeWifi  char,
HappyZone Varchar(30),
BirthdayParty Varchar(30),
GiftCard  char,     

constraint mcService_pk
primary key (serial_No)
);

create table mcCareer
(
serial_No   int,
title     varchar(20),
Ndate     date,
code      int,
branches_l varchar(30),
monthlySale int,
Benefit Varchar(20),
interviewTips Varchar(20),
Training Varchar(20),

constraint mcCareer_pk
primary key (serial_No)

);

create table menu
(
ItemNo int     not null,
ItemPrice int  not null,
Taxes int,

constraint menu_pk
primary key (ItemNo),

);

create table menu_promotions
(
ItemNo int     not null,
promotions varchar(30)  not null,

constraint menu_promotions_pk
primary key (ItemNo,promotions),

constraint menu_promotions_fk
foreign key (ItemNo) references menu (ItemNo),
);

create table serves
(
ssn  int    not null,
ItemNo int  not null,

constraint serves_pk
primary key (ssn,ItemNo),

constraint serves_fk
foreign key (ssn) references employee (ssn),

constraint serves_fk
foreign key (ItemNo) references menu (ItemNo),
 
);

create table mainMeals
(
ItemNo int     not null,
ItemPrice int  not null,
Taxes int,
Breakfast Varchar(30),
Combo Varchar(30),
Desert Varchar(30),
Sides Varchar (30),
HappyMeals Varchar (30),

constraint mainMeals_pk
primary key (ItemNo),
);

create table seasonSpecial_meals
(
ItemNo int     not null,
ItemPrice int  not null,
Taxes int,
CombosSpecial Varchar (30),
ExtraPounds_Meals Varchar (30),

constraint seasonSpecial_meals_pk
primary key (ItemNo),

);

-- emp values--
insert into employee
values ('104','Mohamed','M','Mazen','5000','finance','0137','alkornish','maadi','22/07/1970','06','12345'); 

insert into employee
values ('105','Mahmoud','A','Marwan','6000','finance','0122','dokki','giza','12/06/1979',' ','12379'); 

insert into employee
values ('106','ali','s','maher','4000','marketing','0134','karim banouna','almokattam','11/09/1980','06','12345'); 

insert into employee
values ('107','nahla','M','mohamed','5000','IT','0101','makram abeed','nasr city','03/05/1979','06','12345'); 

insert into employee
values ('108','Marwa','s','frhat','5500','accountant','0154','abaas alakad','nasr city','08/01/1990','06','12345'); 

insert into employee
values ('109','sohila','r','hosny','3500','HR','0121','oroba','masr algdeda','07/09/1987','06','12345'); 

insert into employee
values ('110','sara','a','ryad','5200','Marketing','0141','heliopolis','masr algdeda','30/10/1988','06','12345'); 

insert into employee
values ('111','ragb','M','Mazen','4100','HR','0153','roxy','masr algdeda','06/02/1983','06','12345'); 

insert into employee
values ('112','waal','b','kamel','5700','accountant','0118','salah aldeen','zamalek','12/06/1972','06','12345'); 

insert into employee
values ('113','roaa','t','fayez','4000','IT','0140','al nasr','maadi','15/11/1993','06','12345'); 


--main meals values--

insert into mainMeals
values ('8300','23.63','5%','big breakfast','chocoStrawSundae','BigMac','SML Fries','HMeal BigClub');

insert into mainMeals
values ('8305','10.00','2%','Egg McMuffin','oreo McFlurry','BigTasty','REG Fries','HMeal chFit');

insert into mainMeals
values ('8310','10.90','1.5%','SGS Egg Muffin','oero','McRoyale','MED Fries','HMeal BigMac');

insert into mainMeals
values ('8335','9.54','1%','SGS Muffin','straw sundae','Filet O Fish','LRG Fries','HMeal BigTasty');

insert into mainMeals
values ('8320','4.54','0.5%','Mc toast','caramal sundae','Mac Arabia','side salad','HMeal 6Nuggets');

insert into mainMeals
values ('8325','11.36','1.5%','chiken McMuffin','catop','The portuguse','apple slices','HMeal ChBurger');

insert into mainMeals
values ('8335','11.81','1.5%','spicy chicken MU','small cone','BigTasty chicken','world famousFries','HMeal McDo');

insert into mainMeals
values ('8440','5.00','0.3%','hash browns','cone cake','Double McChicken','fruit yogurt','HMeal 4Nuggets');

insert into mainMeals
values ('8445','8.18','0.5%','hot cakes','apple pie','BigMac chicken','yoplait go-gurt','HMeal ChBurger');

insert into mainMeals
values ('8450','3.64','0.1%','muffin','fundge sundae','Double Filet O fish','ranch snack wrap','HMeal Hamburger');


-- menu values--

insert into menu
values ('1111','25.34','5%');

insert into menu
values ('2222','11.75','2%');

insert into menu
values ('2244','27.34','5%');

insert into menu
values ('5555','8.24','1.5%');

insert into menu
values ('1357','32.75','6%');

insert into menu
values ('4444','13.50','2%');

insert into menu
values ('1122','21.32','4%');

insert into menu
values ('7777','10.12','2%');

insert into menu
values ('8885','22.15','4.5%');

insert into menu
values ('1233','30.00','6%');


