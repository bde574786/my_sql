-- C R U D

-- 데이터 생성 insert

desc memberTbl;

insert into memberTbl values("Dang", "탕탕이","경기도 부천시");
insert into memberTbl values("Han", "한주연", "부산시 해운대구");
insert into memberTbl(memberAddress, memberName, memberId) values("서울시 상암동", "지운이", "jee");

-- 오류 구문 (memberTbl에 memberId, memberName 필드명이 not null로 설계했기 때문이다)
insert into memberTbl(memberId) values('jee2222');
insert into memberTbl(memberId, membername) values('kee2', '홍길삼');

-- 전체 테이블에 대한 데이터 조회
select * from memberTbl;

-- 한 건의 데이터 조회를 어떻게 할까? where절
select * from memberTbl where memberId = 'jee'; 

-- 한 건에 대한 조회 + 조건절
select memberName
from memberTbl
where memberId = 'jee';

-- 한 건에 대한 데이터 삭제
delete from memberTbl where memberId = 'kee2';

-- 전체에 대한 데이터 삭제 구문 safe updates 체크 되어있으면 삭제 안 됨
delete from memberTbl;

-- 다 날리기 delete 와 같음
truncate memberTbl;

-- 한 건에 대한 데이터 수정
update memberTBL set memberName = '홍길동' where memberId = 'jee';

-- 전체 데이터에 대한 값 수정
update memberTBl set memberAddress = '';


-----------------------------------------
desc productTbl;

-- 문제 1 productTBL 데이터를 3건 입력해 주세요
select * from productTbl;

insert into productTBL values (1, "세탁기", 10, "엘지", 10);
insert into productTBL values (2, "컴퓨터", 90, "삼성", 2);
insert into productTBL values (3, "냉장고", 80, "엘지", 100);

delete from producttbl;

-- 불필요한 컬럼 삭제하는 방법
alter table productTbl drop makeDate;

-- 문제 2 검색
select * from producttbl;
select productName from producttbl where productId = 1; 

-- 문제 3 수정
update producttbl set productName = "책상" where productId = 1; 

-- 문제 4 삭제
delete from producttbl where productId = 1;