-- 조인
select emp_name,department_id from employees;

select * from departments;

--
select * from board2;

select * from stuscore;
-- 학년,학반,전화번호,주소,보호자,담당교사,학교이름,성명,키,몸무게,특기
-- 학기,국어,영어,수학,합계,평균,등수

-- 조인의 필요성
-- 1. 중복된 데이터를 방지
-- 2. null값을 피하기 위해

-- 107*27
-- cross join : 테이블 연결
select * from employees,departments;

-- equi join : 공통적으로 존재하는 컬럼을 일치시켜서 연결
select department_id from employees;
select department_id from departments;

select * from employees,departments
where employees.department_id = departments.department_id;
-- equi join : 동일한 컬럼
select emp_name,employees.department_id,departments.department_name
, salary
from employees,departments
where employees.department_id = departments.department_id;

select * from departments;
select emp_name,department_id,salary from employees;
select count(*) from employees;
select count(*) from departments;


select emp_name,a.department_id,department_name
from employees a, departments b
where a.department_id = b.department_id
;

select job_id from employees;

select * from jobs;

-- equi join / employees, jobs
-- emp_name,salary,job_id,job_title,min_salary,max_salary,department_id
-- hire_date

select emp_name,salary,job_id,department_id,hire_date
from employees;

select job_id,job_title,min_salary,max_salary
from jobs;

select emp_name,salary,a.job_id,
job_title,min_salary,max_salary,department_id,hire_date
from employees a, jobs b
where a.job_id = b.job_id;

select * from member;

select * from stuscore;

drop table board;
drop table member;
drop table students;
drop table stuscore;
drop table students2;

create table board (
bno number(4) primary key,
id varchar2(100),
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4) default 0,
bindent number(4) default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

create table member (
id varchar2(100) primary key,
pw varchar2(100),
name varchar2(100),
nickname varchar2(100),
tel char(13),
gender varchar2(100),
hobby varchar2(200),
mdate date default sysdate
);

create table students(
no number(4),
name varchar2(100) primary key,
major varchar2(100),
grade number(2),
age number(3),
gender varchar2(100),
hobby varchar2(200),
sdate date default sysdate
);

create table stuscore(
no number(4),
name VARCHAR2(100),
school VARCHAR2(100),
grade VARCHAR2(2),
height number(4),
kor number(3),
eng number(3),
math number(3),
sw VARCHAR2(100)
);

-- 외래키 등록
-- member primary key, board foreign key
select * from member;
select * from board;

alter table board add constraint board_member_fk_id foreign key(id)
references member(id) on delete set null;


select * from students;
select * from stuscore;

alter table stuscore add constraint stuscore_students_fk_name
foreign key(name)
references students(name) on delete cascade;

-- equi join name
select * from students;
select * from stuscore;

-- 성적을 출력하는데, 성별,나이를 같이 출력하고 싶음.
select a.no,a.name,gender,age,kor,eng,math from  stuscore a,students b
where a.name = b.name
;

-- 
select * from board;
select * from member;

select nickname from member;

select bno,a.id,nickname,btitle,bcontent
from board a,member b
where a.id = b.id;


select * from students;
update students set grade=4 where name = 'Romonda';
commit;
select * from stuscore;

alter table stuscore drop column grade;

select * from stuscore;

select a.name,grade,kor,eng,math
from students a,stuscore b
where a.name = b.name and kor>=90 and eng>=80;

select a.name,grade,kor,eng,math
from students a,stuscore b
where a.name = b.name and lower(a.name) like '%a%';

-- employees,departments
-- 사원명,부서번호,부서명,입사일
-- 부서번호가 50번 이상만 출력하시오.
select * from employees;
select * from departments;

select emp_name,a.department_id,department_name,hire_date
from employees a,departments b
where a.department_id = b.department_id
and a.department_id>=50
order by a.department_id;

select * from employees;
select * from jobs;

-- job_id가 MAN 인 사원의 job_id,job_title,salary,min_salary,hire_date
-- job_id가 MAN 인 사원의,입사일이 02~03,05월 사원을 출력하시오.
select a.job_id,job_title,salary,min_salary,hire_date
from employees a,jobs b
where a.job_id = b.job_id and a.job_id like '%MAN%'
and
substr(hire_date,4,2) in ('02','03','05')
;

select to_char(hire_date,'yyyy-mm-dd hh24:mi:ss') from employees;
select to_char(hire_date,'mm') from employees
where to_char(hire_date,'mm')>='02' and to_char(hire_date,'mm')<='05'
;

select substr(hire_date,4,2)  from employees
where substr(hire_date,4,2) in ('02','03','05')
;

-- 3개의 테이블을 가지고 equi-join
select a.department_id,department_name,a.job_id,job_title
from employees a, departments b, jobs c
where a.department_id = b.department_id and
a.job_id = c.job_id;

-- equi join : 두테이블 간, 같은컬럼을 가지고 검색
-- non-equi join : 두테이블 간, 같은 컬럼이 없이 검색
create table sturank (
srank VARCHAR2(10),
low_score number(3),
high_score number(3)
);

drop table sturank;
-- VVIP,VIP,GOLD,SILVER,BRONZE
insert into sturank values('VVIP',91,100);
insert into sturank values('VIP',81,90);
insert into sturank values('GOLD',71,80);
insert into sturank values('SILVER',61,700);
insert into sturank values('BRONZE',0,60);
commit;

select * from sturank;
select * from stuscore;

-- non-equi join : 같은 컬럼이 없지만 2개의 테이블을 가지고 검색
select no,name,school,round((kor+eng+math)/3,2),srank
from stuscore,sturank
where (kor+eng+math)/3 between low_score and high_score
order by no;

select * from stuscore;
alter table stuscore add rank varchar2(20);

update stuscore a set rank = ( 
select srank
from 
);



--
select salary from employees
order by salary desc;

select salary from employees;

drop table emprank;

create table emprank(
erank VARCHAR2(20),
low_salary number(8),
high_score number(8)
);
insert into emprank values('A',12000,30000);
insert into emprank values('B',10000,11999);
insert into emprank values('C',7000,9999);
insert into emprank values('D',4000,6999);
insert into emprank values('E',0,3999);
commit;
-- 0-3999        E등급
-- 4000-6999     D등급
-- 7000-9999     C등급
-- 10000-11999   B등급
-- 12000-30000   A등급

-- non-equi조인

-- case when-then


--SELECT student_id,
--       CASE
--         WHEN student_id BETWEEN 1 AND 10 THEN '1반'
--         WHEN student_id BETWEEN 11 AND 20 THEN '2반'
--         WHEN student_id BETWEEN 21 AND 30 THEN '3반'
--         ELSE '기타'
--       END AS class_name
--FROM students;

















