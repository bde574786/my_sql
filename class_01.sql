
--
use shopdb;

-- 데이터 베이스를 생성하는 구문
-- create database shopdb_1
    
-- 데이터 베이스를 삭제하는 구문
-- drop database shopdb_1

-- 테이블 생성하는 구문
-- create table 테이블명(
-- 	필드명 필드타입,
--     필드명 필드타입,
--     primary key(필드명)
-- );

-- 테이블 삭제 방법
-- drop table membertbl_1;

-- memberTbl 테이블 생성
create table memberTBL(
	memberId char(8) not null,
    memberName char(5) not null,
	memberAddress char(20),
    primary key(memberId)
	);

-- select 구문
select * from membertbl;

-- 테이블 구조 확인 방법
desc membertbl;


-- 테이블 만들기 2
create table productTBL(
	productId int not null,
    productName char(4) not null,
    cost int not null,
    makeDate date,
    company char(5),
	amount int,
    primary key(productId)
);

select * from productTBL;
desc productTBL;
