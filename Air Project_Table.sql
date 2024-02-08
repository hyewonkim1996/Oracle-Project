/*----------------------------------------ȸ�� ���̺�----------------------------------------------------*/
create table member(
id varchar2(15), 
name varchar2(20) not null,
num varchar2(13),
birth date not null,
passport varchar2(10) unique not null,
grade varchar2(4) default '�Ϲ�' check(grade in('�Ϲ�', 'vip', 'vvip')),
point int default 100,
constraint PK_member primary key (id)
);

/*----------------------------------------�װ��� ���̺�----------------------------------------------------*/
create table airport(
departures varchar2(30) not null,
arrivals varchar2(20) not null,
time timestamp default sysdate,
a_time timestamp default sysdate,
air_name varchar2(10) primary key,
price int not null
);

/*----------------------------------------���ų��� ���̺�----------------------------------------------------*/
create table booking(
b_num int primary key,
b_date date default sysdate,
b_pay varchar2(10) check(b_pay in('�ſ�ī��','�������Ա�','���̹�����','īī������')),
id varchar2(15),
air_name varchar2(10),
constraint FK_id foreign key (id) references member (id)
on delete set null,
constraint FK_air_name foreign key (air_name) references airport (air_name)
on delete cascade
);

/*----------------------------------------�¼����� ���̺�----------------------------------------------------*/
create table seat(
s_grade varchar2(8) default '���ڳ��' check(s_grade in('���ڳ��', '����Ͻ�', '�۽�Ʈ')),
s_row number(3) check(s_row between 1 and 80),
s_seat varchar2(2) check(s_seat in('A','B','C','D','E','F')),
b_num int,
air_name varchar2(10),
constraint FK_b_num_seat foreign key (b_num) references booking (b_num)
on delete cascade,
constraint FK_air_name_seat foreign key (air_name) references airport (air_name)
on delete cascade
);