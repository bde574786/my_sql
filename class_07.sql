
-- MYSQL Date Function


--
select curdate();
select current_date();
-- 현재 날짜를 출력하는 함수 (년, 월, 일)


select curtime();
select current_time();
-- 현재 시간을 출력하는 함수


select day("2017-06-15");
select day(curdate());
select curdate();
-- 일자를 반환하는 함수


select week("2017-06-15");
select week(curdate());


select weekday("2017-06-15");
select weekday(curdate());
-- 1주일 안에 월 0, 화 1, 수 2


select now();
select sysdate();

select timestamp("2019-06-15", "13:10:11");
-- 문자열, 시간 date
-- 인수에 따라서 datetime 값을 반환한다.


select timediff("13:10:11", "13:10:10");
select timediff("2022-05-03 13:10:11","2022-01-03 13:10:10"); -- 최대 범위 확인
select timediff(now(), "2022-01-03 13:10:10");


select subdate(now(), interval 10 day);
-- 날짜 빼기 

select date_add(sysdate(), interval 10 day);
-- 날짜 더하기

--
select system_user(); 

select session_user();

select current_user();
select version();

select nullif("X", null); 



-- 오늘 부트캠프 몇 주차인가
select week(curdate()) - week('2022-03-21') + 1 as 부트캠프주;





-- 학원에 있었던 시간 구하기
select timediff(curtime(), "09:00:00");






-- 부트캠프 종강일의 요일 조회 (종강일 8월 8일)
select weekday('2022-08-08');




-- 수업이 끝나는 시간까지 남은 시간 계산
select timediff('18:00:00', curtime());





-- 현재부터 어린이날까지 남은 시간 구하기
select timediff(curdate(), '2022-05-05');






-- 오늘날짜로부터 어린이날까지 남은 시간
select curdate() as 오늘날짜, timediff(now(), '2022-05-05 00:00:00') as 남은시간;




-- 지금시간부터 어린이날까지 남은시간
select now() as 지금시간 , timestamp('2022-05-05') as 어린이날, timediff(now(), '2022-05-05 00:00:00') as 남은시간;




-- 공휴일로부터 남은 날짜 계산하기
select concat('어린이날', 'D-',day("2022-05-05") - day(now()));





-- 기념일 언제인지 출력해보기 ( 100일, 200일, 1000일 등)
select date_add("2022-05-03", interval 100 day);


-- timestamp로 주문날짜 정하고 date_add로 5일 추가해서 도착날짜 정하기
select b.userName, b.prodName, b.price, b.amount,timestamp("2022-05-01" , now()) as 주문날짜, 
        (select date_add(주문날짜 , interval 5 day)) as 도착날짜 
from buytbl as b
where b.userName = '이순신';




