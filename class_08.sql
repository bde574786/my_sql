
-- AND 와 OR

select *
from membertbl;

insert into membertbl values('jsa', '김주한', '부산시 진구');

-- 이름 홍길동, 주소가 부산지 진구

select *
from membertblf
where membername = '홍길동'
and memberaddress = '부산시 진구';

-- 주소가 부산시 진구 or 경기도 부턴시
select *
from membertbl
where memberaddress = '부산시 진구'
or memberaddress = '경기도 부천시';


-- 주소가 (부산시 진구 or 경기도 부천시) and 이름이 김주한
select *
from membertbl
where (memberaddress = '부산시 진구'
or memberaddress = '경기도 부천시')
and membername = '김주한';


-- 샘플 테이플 생성
create table membercart(
	id int not null auto_increment,
    name varchar(30) not null,
    amount int not null,
    primary key(id)
);

desc membercart;
select * from membercart;

-- 테이블에 컬럼 추가
alter table membercart add productname varchar(30) not null;

-- 테이블에 컬럼명을 수정해보자
alter table membercart rename column name to name2;
alter table shopcart rename column name to productname;

-- 테이블에 컬럼명을 삭제해보자
alter table membercart drop column name2;

-- 테이블 이름 변경하기
rename table membercart to mycart;

select * from mycart;

-- 테이블 이름 변경하기
rename table membercart to mycart; -- 1
alter table mycart rename shopcart; -- 2


-- 데이터 입력
insert into shopcart values(1, 1, '청바지');

-- 기본 전략 auto_increment() 자동 증가 
insert into shopcart(amount, productname) values(2, '운동화');
insert into shopcart(amount, productname) values(12, '잠바');
insert into shopcart(amount, productname) values(3, '핸드폰');
insert into shopcart(amount, productname) values(5, '지갑');

desc shopcart;

select * from shopcart;

-- BETWEEN
select *
from shopcart
where amount between 2 and 5;


