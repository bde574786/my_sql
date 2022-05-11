create database movie;

use movie;

create table 영화정보(
    번호 varchar(3) not null primary key,
    이름 varchar(20),
    개봉년도 int,
    매출액 int,
    관객수 int,
    평점 decimal(4.1)
);

select * from 영화정보;
desc table 영화정보;

select * from 배우정보;
desc table 배우정보;
drop table 영화정보;
drop table 출연;

create table 배우정보(
    번호 varchar(30) not null primary key,
    배우 varchar(20),
    출연자출생 int,
    키 int,
    몸무게 int,
    배우자 varchar(10)
);

create table 출연(
    영화번호 varchar(3) not null,
    배우번호 varchar(3) not null,
    역할 varchar(30),
    foreign key (영화번호) references 영화정보(번호),
    foreign key (배우번호) references 배우정보(번호)
);
 
 select * from 영화정보;
 select * from 배우정보;
 select * from 출연;
 desc 영화정보;
 desc 출연;
 
 INSERT INTO 영화정보
VALUES (1, '명량', 2014, 135748, 17613682, 8.49);
INSERT INTO 영화정보(번호, 이름, 개봉년도, 매출액, 관객수, 평점)
VALUES (2, '쉬리', 1999, null, 58200000, 8.79);
INSERT INTO 영화정보(번호, 이름, 개봉년도, 매출액, 관객수, 평점)
VALUES (3, '광해, 왕이 된 남자', 2012, 889002, 12319542, 9.23);
INSERT INTO 영화정보(번호, 이름, 개봉년도, 매출액, 관객수, 평점)
VALUES (4, '도둑들', 2012, 936655, 12983330, 7.60);
INSERT INTO 영화정보(번호, 이름, 개봉년도, 매출액, 관객수, 평점)
VALUES (5, '엽기적인 그녀', 2001, null, 1735692, 9.29);
