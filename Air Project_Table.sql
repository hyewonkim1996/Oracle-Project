/*----------------------------------------회원 테이블----------------------------------------------------*/
create table member(
id varchar2(15), 
name varchar2(20) not null,
num varchar2(13),
birth date not null,
passport varchar2(10) unique not null,
grade varchar2(4) default '일반' check(grade in('일반', 'vip', 'vvip')),
point int default 100,
constraint PK_member primary key (id)
);

/*----------------------------------------항공권 테이블----------------------------------------------------*/
create table airport(
departures varchar2(30) not null,
arrivals varchar2(20) not null,
time timestamp default sysdate,
a_time timestamp default sysdate,
air_name varchar2(10) primary key,
price int not null
);

/*----------------------------------------구매내역 테이블----------------------------------------------------*/
create table booking(
b_num int primary key,
b_date date default sysdate,
b_pay varchar2(10) check(b_pay in('신용카드','무통장입금','네이버페이','카카오페이')),
id varchar2(15),
air_name varchar2(10),
constraint FK_id foreign key (id) references member (id)
on delete set null,
constraint FK_air_name foreign key (air_name) references airport (air_name)
on delete cascade
);

/*----------------------------------------좌석정보 테이블----------------------------------------------------*/
create table seat(
s_grade varchar2(8) default '이코노미' check(s_grade in('이코노미', '비즈니스', '퍼스트')),
s_row number(3) check(s_row between 1 and 80),
s_seat varchar2(2) check(s_seat in('A','B','C','D','E','F')),
b_num int,
air_name varchar2(10),
constraint FK_b_num_seat foreign key (b_num) references booking (b_num)
on delete cascade,
constraint FK_air_name_seat foreign key (air_name) references airport (air_name)
on delete cascade
);