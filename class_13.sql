-- 서브 쿼리 2
use employees;

select * from employees;
select * from dept_emp; -- employees vs dept_emp (1 : N)
select * from departments order by dept_no; -- departments vs dept_emp ( 1 : N )
select * from dept_manager;
select * from titles;


desc dept_emp;
desc departments;


select *, dept_no as '뽑아야 되는 값'
from departments as A
where a.dept_name = 'development';


-- 문제 1 (중첩 서브 쿼리)
-- dept_emp 테이블에서 development인 emp_no 와 dept_no를 출력하세요


select *
from dept_emp as d
where d.dept_no = (select dept_no from departments where dept_name = 'development');

select * from dept_emp;
select * from departments;
select * from employees;
select * from dept_manager;
select * from titles;

-- 문제 2 (중첩 서브 쿼리)
-- employees 테이블에서 현재 development 매니저인 직원만 출력하시오
select *
from employees as A
where a.emp_no = (select emp_no
					from dept_manager
                    where to_date = '9999-01-01'
                    and dept_no = 'd005');

select *
from employees as A
where a.emp_no = (select emp_no
					from dept_manager
                    where to_date = '9999-01-01'
                    and dept_no = 'd005');


-- employees 테이블에서 title이 Staff이고 사원번호가 1002인 직원 출력



select * from titles;




-- 단일 행 결과 집합 나와서 외부 쿼리인 emp_no 조건식으로 처리가 된다.
select *
from employees as A
where a.emp_no = (select emp_no
					from dept_manager
                    where to_date = '9999-01-01'
                    and dept_no = (select dept_no
						from departments
						where dept_name = 'development'));

-- d005 --> develoment (값으로 변경해서 쿼리문을 완성해주세요)

-- 중첩
select *
from employees as e
where e.emp_no = (select emp_no
					from titles
                    where title = 'staff'
                    and emp_no = 10002);


/*
	다중 행 서브 쿼리
    결과 값이 2건 이상 출력되는 것을 말한다. 다중 행 서브 쿼리는 쿼리의 결과가 여러 건 출력되기 때문에 
    단일행 연산자를 사용할 수 없다.
    별도의 연산자를 사용해야 한다. in
*/

select * from employees;
select * from titles;

-- join
 select a.emp_no, a.first_name, b.title
 from employees as a
 inner join titles as b
 on a.emp_no = b.emp_no;

-- 인라인 뷰로 결과를 출력해주세요(from 서브 쿼리)
select a.emp_no, a.first_name, b.title
from employees as a, (select * from titles) as b
where a.emp_no = b.emp_no;


select a.emp_no, a.first_name, b.title
from employees as a, (select * from titles) as b
where a.emp_no = b.emp_no;


select * from dept_emp;
select * from departments;
select * from employees;
select * from dept_manager;

-- 문제 1
-- 직원 테이블에서 부서 팀장만 출력하시오(join 사용, 단 현재 근무중인 사람만 출력)
select *
from employees as a
inner join dept_manager as b
on a.emp_no = b.emp_no
where b.to_date = '9999-01-01';


-- 문제 2
-- 인라인 뷰로 출력하시오
select *
from employees as a, (select *
						from dept_manager
                        where to_date = '9999_01_01') as b
where a.emp_no = b.emp_no;

select * from dept_emp;
select * from departments;
select * from employees;
select * from dept_manager;

-- 직원 테이블에서 퇴사한 직원 출력
select *
from employees as a, (select *
						from dept_emp
                        where to_date <> '9999-01-01') as b
where a.emp_no = b.emp_no;


-- 스칼라 서브쿼리(select 절에 사용하는 서브쿼리)
-- select 절에 서브쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적
-- join의 대체 표현식으로 자주 사용하지만 성능면에서 좋은 편이 아니다.

select *, (select dept_name
				from departments as b 
                where a.dept_no = b.dept_no) as '부서명'
from dept_manager as a
where to_date = '9999-01-01';





-- 스칼라 서브 쿼리를 사용해서 결과를 뽑아주세요
-- 문제 employees 테이블 emp_no, first_name(타이틀명)

-- 단일 행으로 변경해야 한다.(title)

-- employees 테이블에서 퇴사한 직원들의 퇴사일을 출력 
select e.emp_no, (select t.to_date
				from titles as t 
                where t.emp_no = e.emp_no
				and t.to_date <> '9999-01-01'
                group by emp_no
                ) as '퇴사일'
from employees as e;

select title from titles;

select * from dept_emp;
select * from departments;
select * from employees;
select * from dept_manager;
select * from titles;


select e.emp_no, (select d.dept_no
				from dept_emp as d 
                where d.emp_no = e.emp_no
                and d.to_date <> '9999-01-01'
                group by emp_no) as '부서번호' 
from employees as e;



select title from titles;






-- 중첩 
-- 직급이 Senior Engineer 인 직원의 정보만 출력하기
select *
from employees
where emp_no in (select emp_no
                    from titles
                    where title = 'Senior Engineer');


-- 인라인뷰
-- 연봉이 80_000이상인 사람의 정보만 출력하시오 ( employees 테이블 사용하기 )
select e.emp_no, e.last_name, e.gender, s.salary
from employees as e, (select *
                        from salaries
                        where salary >= 80000
                        group by emp_no) as s
where e.emp_no = s.emp_no;

select * from salaries;


-- 추가 문제 
-- 위 쿼리를 JOIN 문으로 변경해서 출력해보세요 (query cost 값 비교 해보기 !!! )



-- 스칼라 
-- 직원의 사번과 last_name, 연봉을 출력하라 
select e.emp_no, e.last_name, (select s.salary
                                from salaries as s
                                where e.emp_no = s.emp_no
                                and to_date = '9999-01-01'
                                group by emp_no) as '연봉'
from employees as e;











-- 중첩 서브쿼리
-- 개발팀 manager 중 2000년 1월 1일 이전 퇴사자
select *
from employees as e
where e.emp_no = (select emp_no
                    from dept_manager
                    where to_date < '2000-01-01' and dept_no = (select dept_no
                                                                from departments
                                                                where dept_name = 'development'));

-- 인라인 뷰
-- 직원 테이블에서 2000년 1월 1일 이전 퇴사한 부서 팀장만 출력
select *
from employees as e, (select *
                        from dept_manager
                        where to_date < '2000-01-01') as b
where e.emp_no = b.emp_no;

-- 스칼라 서브쿼리
-- 직원 테이블에서 emp_no, first_name 출력하고 알맞은 부서번호 dept_emp 테이블에서 출력
select e.emp_no, e.first_name, (select d.dept_no
                                from dept_emp as d
                                where e.emp_no = d.emp_no
                                group by emp_no) as 부서번호
from employees as e; 











-- 중첩 서브쿼리
-- 직함이 Senior Enginner인 직원 정보 출력
select *
from employees as a
where emp_no in (select emp_no
                from titles as b
                where title = 'Senior Engineer');

-- 인라인 뷰
-- d001 부서의 역대 매니저 출력
select a.emp_no, a.first_name, b.dept_no
from employees as a, (select *
                        from dept_manager
                        where dept_no = 'd001') as b
where a.emp_no = b.emp_no;

-- 스칼라 서브 쿼리
-- 각 직원들의 최고 연봉을 출력
select a.emp_no, a.first_name, (select b.salary
                                from salaries as b
                                where a.emp_no = b.emp_no
                                group by emp_no
                                having max(salary)) as '최고 연봉'
from employees as a;



-- 중첩
-- employees 테이블에서 title이 Staff이고 사원번호가 1002인 직원 출력
select *
from employees as e
where e.emp_no = (select emp_no
                    from titles
                    where title = 'staff'
                    and emp_no = 10002);


-- 인라인 뷰
-- 직원 테이블에서 퇴사한 직원 출력
select *
from employees as a, (select *
                        from dept_emp
                        where to_date <> '9999-01-01') as b
where a.emp_no = b.emp_no;


-- 스칼라 서브 쿼리
-- employees 테이블에서 퇴사한 직원들의 퇴사일을 출력 
select e.emp_no, (select t.to_date
                from titles as t 
                where t.emp_no = e.emp_no
                and t.to_date <> '9999-01-01'
                group by emp_no
                ) as '퇴사일'
from employees as e;








-- 스칼라 ( 현재 근무중인 사람만 emp_no , first_name , gender 출력
select e.emp_no, e.first_name, e.gender,(select d.to_date
                                        from dept_emp as d
                                        where e.emp_no = d.emp_no 
                                        and d.to_date = '9999-01-01'
                                        group by d.emp_no) as 현재근무중인사람
from employees as e;


-- 인라인 dept_emp 테이블에서 현재 근무중인 사람의 last_name과 gerder 출력
select d.emp_no, d.dept_no,d.from_date,d.to_date , e.last_name, e.gender
from dept_emp as d, (select *
                     from employees) as e
where d.emp_no = e.emp_no
and d.to_date = '9999-01-01';

-- 중접 emp_no 11111번의 타이틀 정보 출력
select *
from titles as t
where t.emp_no = (select emp_no
                 from employees as e
                 where emp_no = 11111);









-- 문제 1 중첩 where
--  최고연봉을 받는 사람의 정보를 출력해주세요
-- employees , departments

select * 
from employees as e
where e.emp_no in (
                    select emp_no
                    from salaries as s
                    where salary = (select max(salary) from salaries)

);

-- 문제 2 인라인뷰 from
-- 위의 문제를 인라인뷰로 만들기
select *
from employees as e,(select *
                        from salaries 
                            where salary = (select max(salary) from salaries)) as s
where e.emp_no = s.emp_no;

-- 문제 3 스칼라 select
-- 각 사원의 정보에 초봉정보까지 포함
select *,(select s.salary
                from salaries as s
                    where e.emp_no = s.emp_no
                     group by emp_no) as 연봉
from employees as e;



-- 1. 중첩 서브쿼리(nested, where절에)
-- senior Engineer 뽑기


select *
from employees as a
where a.emp_no in (select emp_no from titles where title = 'Senior Engineer');




-- 2. 인라인 뷰(inline, from절에)
-- emp_no, first_name, title뽑기
select e.emp_no, e.first_name, t.title
from employees as e, (select title, emp_no from titles) as t
where e.emp_no = t.emp_no;




-- 3. 스칼라 서브쿼리(scalar, select절에)
-- emp_no, first_name, title, 부서번호 뽑기
select e.emp_no, e.first_name, t.title, (select d.dept_no from dept_emp as d where e.emp_no=d.emp_no group by emp_no) as 부서번호
from employees as e, (select title, emp_no from titles) as t
where e.emp_no = t.emp_no;





-- emp_no, first_name, title, 부서번호 , 부서명 뽑기
select e.emp_no, e.first_name, t.title, (select d.dept_no from dept_emp as d where e.emp_no=d.emp_no group by emp_no) as 부서번호, (select dn.dept_name from departments as dn where dn.dept_no = d.dept_no group by dept_no) as 부서명
from employees as e, (select title, emp_no from titles) as t, (select dept_no, emp_no from dept_emp) as d
where e.emp_no = t.emp_no and e.emp_no = d.emp_no;







-- 문제 1 (중첩쿼리 사용)
-- 현재 Human Resources부서에서 근무중인 직원 조회
select *
from employees 
where emp_no in (select emp_no
                from dept_emp
                where dept_no = 'd003'
                and to_date = '9999-01-01');



-- 부서 매니저의 생년월일 조회
select d.dept_no, d.emp_no, (select e.birth_date
                                from employees as e
                                where d.emp_no = e.emp_no) as '생년월일'
from dept_manager as d;





