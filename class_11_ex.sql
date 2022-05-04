
-- 그룹함수, 그룹바이, havaing 절

-- GROUP BY 절
-- 그룹바이 절은 데이터들을 원하는 그룹으로 나눌 수 있다.
-- 나누고자하는 그룹의 컬럼명은 SELECT절과 GROUP BY절 뒤에 추가하면 된다.alter
-- 집계함수와 함께 사용되는 상수는 그룹바이절에 추가하지 않아도 된다(많이 실수하는  부분)

-- DISTINCT 와 GROUP BY 절
-- DISTINCT 주로 중복을 제거하기 위해서 사용한다.
-- 그룹바이는 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다.
-- 하지만 두 작업은 조금만 생각해보면 동일한 형태의 작업이라는 것을 쉽게 알 수 잇고, 일부 작업의 경우
-- DISTINCT로 동시에 처리할 수도 있다.


-- HAVING 절
-- where 절에서는 집계함수를 사용할 수 없다.
-- having 절은 집계함수를 가지고 조건을 비교할 때 사용한다.
-- having 절은 group by 절과 함께 사용된다.

use employees; 

show tables;

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;


-- 함계 함수
-- 문제 1. 전체 직원수 (전체 직원수), 제일 먼저 입사한 일자(최초 고용일자), 제일 마지막 입사 일자(가장최근 고용일자)

select count(*) as 전체직원수, 
min(hire_date) as 최초고용일자, 
max(hire_date) as 가장최근고용일자
from employees;

-- 문제 2. gender로 그룹핑
select *
from employees
group by gender;


-- 문제 3. 남성, 여성 수와, gender를 표시하세요
select count(*), gender
from employees
group by gender;



-- 문제 4. 고용일자로 그룹화
select *
from employees
group by hire_date;

-- 문제 5. hire_date가 같은 직원의 명수를 표시하시오
-- 전체, as 동기

select *, count(emp_no) as '동기'
from employees
group by hire_date; 

-- 문제 6. 위 쿼리에서 남성과 여성을 구분해서 결과값을 구하시오 !
select *, count(emp_no) as '동기'
from employees
group by hire_date, gender
order by hire_date desc;

--
select * from salaries;
desc salaries;

-- 급여 테이블에서,
-- 총 건수, 총 급여, 평균급여 (소수점 2자리 표현), 최고연봉자금액, 최소연봉자금액

-- select count(*) as '총건수', 
-- round(avg(salary), 2) as '평균급여', 
-- max(salary) as '최고연봉자금액', 
-- min(salary) as '최고연봉자금액'
-- from salaries;

-- 데이터 검증
select max(salary) from salaries;


-- having 절
-- 연봉을 10번이상 받은 직원들을 출력하시오

select *, count(emp_no) as '횟수'
from salaries
group by emp_no
having count(emp_no) >= 10
order by emp_no asc
limit 30;

-- 문제
select * from titles;

select count(*) from titles;

-- 10만명 이상 사용하고 있는 직함의 이름과 직원의 수를 출력하시오
select title, count(*)
from titles
group by title
having count(*) >= 100000;


-- 5만명 이상 근무하고 있는 부서의 부서 번호와 부서 소속 사원의 수를 출력하시오 !!!
select emp_no, count(*)
from dept_emp
group by dept_no
having count(*) >= 50000;

select * from dept_emp;

-- 현재 근무 중인 사람들만 출력하시오
select *, count(*)
from dept_emp
where to_date = '9999-01-01'; 



-- 각 부서별 과거의 매니저의 수를구하시오(퇴사자)
select * from dept_manager;

select *
from dept_manager
where to_date <> '9999-01-01';

-- 그룹함수, 그룹바이, having 절 + join


-- 사원번호가 같고 고용일이 1990-01-01이후인 직원들 출력

-- 집계함수를 쓸 때 having 절 씀
select s.emp_no, s.salary, s.to_date, e.hire_date
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
group by s.emp_no
having e.hire_date > '1990-01-01';


select * from employees;
select * from salaries;


-- 재직자 중에서 가장 연봉이 높은 10명의 직원이름과 연봉을 출력해주세요
select e.emp_no , concat(first_name,"  " ,last_name) as 'name', salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
where to_date = '9999-01-01'
order by salary desc
limit 10;


-- 부서별로 입사 날짜가 가장 빠른 직원번호 출력
select a.emp_no, b.dept_no, a.hire_date
from employees a
inner join dept_emp b
on a.emp_no = b.emp_no
group by b.dept_no
having min(a.hire_date);





-- titles 와 employees를 inner join하고 같은부서의 사람들 수 출력
select t.emp_no, t.title, e.first_name, e.last_name, e.gender,count(t.title) as '같은 부서 사람들 수'
from titles as t
inner join employees as e
on t.emp_no = e.emp_no
group by t.title
having count(t.title);





-- 사원번호가 같고 고용일이 1990-01-01이후인 직원들 출력
select s.emp_no, s.salary, s.to_date, e.hire_date
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
group by s.emp_no
having e.hire_date > '1990-01-01';





-- 연봉 130000 이상 받은 직원
select *
from dept_emp as d
right join salaries as s
on d.emp_no = s.emp_no
where s.salary >= 130000;







-- 2000년도 이전에 입사한사람들의 성별, 최저연봉과 최대 연봉을 구하시오
select e.emp_no , e.gender as 성별 , min(salary) as 최저연봉 , max(salary) as 최대연봉 , s.to_date as 입사일
from employees as e 
inner join salaries as s
on e.emp_no = s.emp_no
group by emp_no 
having to_date <= '2000-01-01'

