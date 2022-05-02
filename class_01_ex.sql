-- 문제 1 shopdb_1 데이터 베이스를 생성
-- create database shopdb_1

-- 문제 2 membertbl 테이블 생성

create table membertbl(
	memberId char(8) not null,
    memberName char(10) not null
);

-- 문제 3 productTbl 테이블 생성

create table productTbl(
	productNumber char(8) not null,
    price int not null,
    expirationDate date,
    primary key(productNumber)
);

-- 문제 4 (간단한 테이블 생성 필드 2개 이상)
create table todoTbl(
	exercise boolean not null,
	study boolean not null
);



-- 문제 5 (간단한 테이블 생성 필드 3개 이상 primary key 지정)(
	create table userInfo(
    userId char(10),
    userPassword char(10),
    primary key(userId)
	);


