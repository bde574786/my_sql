use shopdb;

select * from usertbl;
select * from buytbl;

-- inner join
 select *
 from usertbl
 inner join buytbl
 on usertbl.userName = buytbl.userName;
 
 -- inner join 2 교집합
 select a.username, a.addr, a.mobile, b.prodname, b.price, b.amount
 from usertbl as a
 inner join buytbl as b
 on a.username = b.username;
 
 -- inner join 3 (연습)
 -- inner join 4 (연습)
 
 
 
 -- LEFT JOIN 1 순수 usertbl
 select *
 from usertbl as u
 left join buytbl as b
 on u.username = b.username;
 
 -- usertbl 고객 등록
 select * from usertbl;
 insert into usertbl values('야스오', 2000, '여수', '010-1234-1234');
 
 -- LEFT JOIN 2
 select *
 from usertbl as u
 left join buytbl as b
 on u.username = b.username
 where b.username is not null;
 
  -- LEFT JOIN  3 한 번 더 복습
 
 
 
 -- 구매 테이블 생성할 때 외래키에 대한 제약을 생성했기 때문이다.
 insert into buytbl values('티모', '컴퓨터', 100, 1);
 
 -- 하지만 구매 테이블을 생성할 때 외래키(FK) 제약하지 않았다면 insert는 가능하다.
 
 select * from buytbl;
 
 
 -- left join 3
 
 select * from buytbl;
 select * from usertbl;
 
 select *
 from buytbl as b
 left join usertbl as u
 on u.username = b.username;
 
 -- left join 4
 select *
 from buytbl as b
 left join usertbl as u
 on u.username = b.username
 where u.username is not null;
 
 -- RIGHT JOIN 1
 select u.username, b.prodname, b.price, b.amount
 from usertbl as u
 right join buytbl as b
 on u.username = b.username;
 
 
 -- 곱 집합 CROSS JOIN 1
 select *
 from usertbl as u
 cross join buytbl as b
 on u.username = b.username;
 
  -- 곱 집합 CROSS JOIN 2
  select *
  from usertbl
  cross join buytbl
  on usertbl.username = buytbl.username
  where usertbl.username is null
  or buytbl.username is null
  
  
  