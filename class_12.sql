


-- db 생성
create database reservationdb;
use reservationdb;

-- 테이블 생성 (예약)
create table reservation(
	id int auto_increment,
    name varchar(20) not null,
	reserveDate date not null,
	roomNum varchar(5) not null,
    primary key(id)
);

-- 고객 테이블
create table customer(
	id int auto_increment,
    name varchar(20) not null,
    age int not null,
    address varchar(10),
    primary key(id)
);


-- 데이터 입력
insert into reservation values(1, '홍길동', '2020-05-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-05-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-05-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-05-04 00:00:00', 4);


select * from reservation;

-- 문제 데이터 수정
-- 1 = roomNum 1001
-- 2 = roomNum 1002
-- 3 = roomNum 1003
-- 4 = roomNum 1004

update reservation set roomNum = '1001' where id = 1;
update reservation set roomNum = '1002' where id = 2;
update reservation set roomNum = '1003' where id = 3;
update reservation set roomNum = '1004' where id = 4;


select * from reservation;



-- 고객 테이블 데이터 생성
insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');



update customer set address = '인천' where id = 2;
update customer set address = '서울' where id = 3;
update customer set address = '수원' where id = 4;

select * from customer where address in ('서울');

-- 서브 쿼리
-- 주소가 서울인 고객들의 예약 정보를 확인하는 쿼리 
select id, reserveDate, roomNum, name
from reservation
where name in(
				select name 
                from customer 
                where address = '서울'
                ); 

select * from reservation;
select * from customer;




-- JOIN문으로 변경해서 같은 결과를 출력해주세요
select r.id, r.reserveDate, r.roomNum, r.name, c.address
from reservation as r
left join customer as c
on r.name = c.name
where c.address = '서울';



-- FROM 절 서브 쿼리
select name, reservedRoom
from (select name, reserveDate, roomNum as reservedRoom
		from reservation
        where roomNum > 1001) as reservationInfo;




-- 2020-05-02 예약정보 확인
select id, name, roomNum, reserveDate
from reservation
where name in (
                select name
                from customer
                where reserveDate = '2020-05-02')



-- 2020-05-02 일자로 예약한 고객의 id와 이름 조회하기
select id, name
from customer
where name in (select name
            from reservation
            where reserveDate = '2020-05-02'
            );





-- 고객테이블에서 실제 예약한 고객중 30살 이상인 고객 id, 이름, 나이, 주소, 예약일, 예약한 방 정보 출력
select c.id, c.name, c.age, c.address, r.reserveDate, r.roomNum
from customer as c
inner join reservation as r
on c.name = r.name
where c.age >= 30;





-- 나이가 30보다 어린 사람의 예약 정보를 확인하는 쿼리
 select *
 from reservation
 where name in (select name from customer where age < 30);
 
-- 5/2 이후에 예약한 예약자 정보 확인
select *
from (select * from reservation where reserveDate > '2020-05-02 00:00:00') as reservationInfo;






select * from reservation;
-- 나이가 30대인 사람들의 예약 정보 출력

select *
from  reservation
where name in (select name
			from customer
			where 30 <= age and age < 40);





-- where절에 사용하는 서브 쿼리를 사용해서 나이가 21살 이상의 고객들만 출력
select id, name, reserveDate, roomNum
from reservation
where name in(select name
       from customer
       where age > 20);





-- 나이가 30살 미만인 예약자의 예약정보 출력하기
select *
from reservation 
where name in(select name 
            from customer
            where age < 30
);


-- 지역이 인천과 서울인 예약고객 뽑아내기
select * from reservation
where name in(select name from customer where address ='서울' or '인천');




/*
	쿼리 실행 순서
    1. reservation 테이블에서 roomNum > 1001 보다 큰 레코드를 먼저 찾은 후 roomNum 필드 값 1씩 증가
    해당 쿼리에 결과 집합 reservationInfo 임시 테이블로 만들어준다.(내부 쿼리, 서브 쿼리)
    외부 쿼리에서는 이렇게 만들어진 임시 테이블에서 name, reservedRoom 필드만을 선택해서 결과 집합을 보여주게 된다
*/


-- 서브 쿼리 사용해서 문제 생성 

























