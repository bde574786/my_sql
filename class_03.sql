-- userTBL, buyTBL 만들기


use shopdb;

-- 고객 테이블 생성
create table userTBL(
	userName char(3) not null,
    birthYear int not null,
    addr char(2) not null,
    mobile char(12),
    primary key(userName)
);

-- 필드 수정, 컬럼 수정
alter table userTBL modify mobile char(13);
desc userTBL;

-- 구매 테이블 생성 (fk)
create table buyTBL(
	userName char(3) not null,
    prodName char(3) not null,
    price int not null,
    amount int not null,
    foreign key(userName) references userTBL(userName)
);

desc buyTBL;

-- userTBL 데이터 입력하기
insert into userTBL values("이승기", 1987, "서울", "010-1234-1234");
insert into userTBL values("홍길동", 1911, "부산", "010-2222-2222");
insert into userTBL values("이순신", 1999, "대구", "010-3333-3333");

select * from userTBL;
select * from buyTBL;

-- 구매 테이블 데이터 입력
-- 이승기2라는 이름이 없어서 안들어감
-- insert into buyTBL values ('이승기2', '운동화', 50, 1);


insert into buyTBL values ('이승기', '운동화', 50, 1);
insert into buyTBL values ('이승기', '노트북', 150, 1);
insert into buyTBL values ('홍길동', '책', 10, 5);
insert into buyTBL values ('홍길동', '모니터', 200, 2);
insert into buyTBL values ('이순신', '청바지', 40, 1);
insert into buyTBL values ('이순신', '책', 10, 3);


