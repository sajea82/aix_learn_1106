select * from member;

select sysdate from dual;

select mdate from member;
select sysdate-mdate from member;

select mdate,add_months(mdate,10),add_months(mdate,-10) from member;

-- 현재 가입날짜가 10개월 이상된 회원들을 출력하시오.
select mdate,add_months(sysdate,-10) from member;

select mdate,add_months(sysdate,-10) from member
where mdate >= add_months(sysdate,-10);

-- mdate컬럼을 확인
select mdate from member;

-- mdate 그달의 첫째일, 마지막일을 출력하시오.
-- 26/01/01, 26/01/31
-- trunc
select mdate,add_months(mdate,1),trunc(add_months(mdate,1),'mm'),last_day(mdate) from member;

select round(months_between(sysdate,mdate),2) from member;

-- 가입한지 8개월째 되는 회원을 출력하시오.
-- 8.1,8.2........8.9 8개월째 되는 회원
select mdate,add_months(sysdate,-8) from member;
select name,mdate,trunc(months_between(sysdate,mdate)) from member
where trunc(months_between(sysdate,mdate))=8;
select name,mdate,round(months_between(sysdate,mdate),1),trunc(months_between(sysdate,mdate)) from member
where round(months_between(sysdate,mdate))=9;

-- 다다음주 목요일 출력하시오.
select next_day(next_day(sysdate,'목'),'목') from dual;

-- 년도-월-일 시:분:초 로 ㅣ출력하시오.
select sysdate from dual;

select to_char(mdate,'yyyy-mm-dd hh24:mi:ss day') from member;

select * from employees;

-- 190번대(190~199) 까지 salary(월급),년봉,원화년봉을 출력하는데
-- 천단위 표시, 원화년봉은 원화표시를 출력하시오.
select salary from employees;
select to_char(salary*12, '999,999,999') from employees; 

select trunc(employee_id,-1) from employees
where trunc(employee_id,-1)=190;

select employee_id from employees
where employee_id>=190 and employee_id<=199;

select employee_id,
to_char(salary,'999,999,999')as 월급,
to_char(salary*12,'999,999,999')as 년봉,
to_char(salary*12*1420,'L999,999,999')
from employees
where employee_id between 190 and 199;

select * from gallerylist;

-- galmodifiedtime
-- 날짜포맷으로 변경하시오.
desc gallerylist;

-- 1) DATE 타입 임시 컬럼 추가
alter table gallerylist
add (galmodifiedtime2 date);

-- 2) 문자열을 날짜로 변환해 값 넣기
update gallerylist
set galmodifiedtime2 = to_date(galmodifiedtime, 'yyyymmddhh24miss');

commit;

-- 3) 기존 VARCHAR2 컬럼 삭제
alter table gallerylist
drop column galmodifiedtime; 

-- 4) 새 컬럼명을 원래 이름으로 변경
alter table gallerylist
rename column galmodifiedtime2 to galmodifiedtime;

-- 5) 확인
desc gallerylist;
select galmodifiedtime, to_char(galmodifiedtime, 'yyyy-mm-dd hh24:mi:ss') from gallerylist;

-- 1) GALCREATEDTIME 뒤에 있던 컬럼들을 invisible로 숨기기
alter table gallerylist modify GALPHOTOGRAPHYLOCATION invisible;
alter table gallerylist modify GALPHOTOGRAPHYMONTH invisible;
alter table gallerylist modify GALPHOTOGRAPHER invisible;
alter table gallerylist modify GALSEARCHKEYWORD invisible;

-- 2) 원래 순서대로 다시 visible로 표시하기 (뒤쪽으로 재배치됨)
alter table gallerylist modify GALPHOTOGRAPHYLOCATION visible;
alter table gallerylist modify GALPHOTOGRAPHYMONTH visible;
alter table gallerylist modify GALPHOTOGRAPHER visible;
alter table gallerylist modify GALSEARCHKEYWORD visible;

-- 3) 순서 확인
desc gallerylist;

-- galmodifiedtime
-- 날짜포맷으로 변경하시오.
select * from gallerylist;

select galmodifiedtime,
to_date(galmodifiedtime,'yyyy-mm-dd hh24:mi:ss') from gallerylist;

-- 문자타입을 날짜타입으로 변경
select substr(galmodifiedtime,0,8) from gallerylist;
select to_date(substr(galmodifiedtime,0,8),'yyyy-mm-dd') from gallerylist;

-- 컬럼추가
alter table gallerylist add(galmodifiedtime2 date);

--날짜타입에 날짜데이터추가
update gallerylist
set galmodifiedtime2 = to_date(galmodifiedtime, 'yyyymmddhh24miss');
commit;

-- 기존컬럼삭제
alter table gallerylist drop column galmodifiedtime; 

-- 컬럼이름변경
alter table gallerylist rename column galmodifiedtime2 to galmodifiedtime;

-- 컬럼순서변경
alter table gallerylist modify GALPHOTOGRAPHYLOCATION invisible;
alter table gallerylist modify GALPHOTOGRAPHYMONTH invisible;
alter table gallerylist modify GALPHOTOGRAPHER invisible;
alter table gallerylist modify GALSEARCHKEYWORD invisible;

alter table gallerylist modify GALPHOTOGRAPHYLOCATION visible;
alter table gallerylist modify GALPHOTOGRAPHYMONTH visible;
alter table gallerylist modify GALPHOTOGRAPHER visible;
alter table gallerylist modify GALSEARCHKEYWORD visible;

-- 문자열 20,000 / 문자열 11,900   = 8,100 으로 출력하시오.
-- ( 숫자로 변경후, 빼기를 한후 결과값을 출력 )

select to_number('20,000','99,999'),
to_number('11,900','99,999'),
to_number('20,000','99,999')-to_number('11,900','99,999'),
to_char(to_number('20,000','99,999')-to_number('11,900','99,999'),'999,999')
from dual;

-- is null, nvl(commission_pct,0)
select emp_name,commission_pct from employees
where commission_pct is null;

select salary+salary*nvl(commission_pct,0),
salary,nvl(commission_pct,0) from employees;

-- ceo
-- manager_id : number
select manager_id,nvl(to_char(manager_id),'ceo') from employees;

-- null
-- commission_pct null 사람이 몇명인지 출력하시오.

-- 그룹함수 - count,sum,avg,max,min
select count(*) from employees
where commission_pct is null;

select * from stuscore;

select avg(kor) from stuscore;
select avg(eng) from stuscore;
select sum(math) from stuscore;
select max(kor) from stuscore;

select max(salary),min(salary) from employees;

-- 년봉이 가장높은 사람의 이름을 출력하시오.
-- 단일함수와 그룹함수를 같이 사용할수는 없다.
-- select emp_name,max(salary) from employees;
select * from employees
where salary=(select max(salary) from employees);

select * from employees
where salary=24000;

-- 평균월급보다 작게 받는 사원수을 출력하시오.
select avg(salary) from employees;
select count(*) from employees
where salary<(select avg(salary) from employees);

select count(employee_id),count(manager_id) from employees;

-- stuscore, kor-최대값,최소값,평균,합계를 출력하시오.
select max(kor),min(kor),avg(kor),sum(kor) from stuscore;
-- 국어점수 가장적게 받은 학생을 출력하시오.
select min(kor) from stuscore
where kor = (select min(kor) from stuscore); 

select min(kor) from stuscore;
select * from stuscore
where kor = (select min(kor) from stuscore); 

select name||school from stuscore;
select concat(name,school) from stuscore;

-- stuscore m이 들어간 학생을 모두 출력하시오.
select count(*) from stuscore
where name like '%m%' or name like '%M%';

select count(*) from stuscore
where lower(name) like '%m%';

select name from stuscore;

-- 3번째 m이 들어간 학생을 출력하시오.
select * from stuscore
where name like '__m%';

-- lower() : 소문자, upper() : 대문자, initcap() : 첫글자대문자

select email,lower(email),initcap(email) from employees;

-- lpad,rpad
select kor,lpad(kor,3,'0') from stuscore;
select kor,rpad(kor,5,'*') from stuscore;

select galcontentid,length(galcontentid) from gallerylist;
select galcontentid,rpad(substr(galcontentid,0,5),7,'*') from gallerylist;

--
select * from gallerylist;

select * from employees;

-- email 뒤에 2자리를 *로 출력하시오.
select galcontentid,length(galcontentid) from gallerylist;
select email from employees;

select email,length(email)-2 from employees;
select email,rpad(substr(email,0,length(email)-2),length(email),'*') from employees;

select email,substr(email,1,2) from employees;

select * from member;

-- 220-***-9788
select tel from member;
select tel,substr(tel,1,4) || '****' || substr(tel,8,length(tel)) as marktel from member;

-- ltrim,rtrim : trim

select '     aaa111',ltrim('     aaa111') from dual;

select '20261101',ltrim('20261101','2026') from dual;
select '0001101',ltrim('000110100','0'),rtrim('000110100','0') from dual;

-- 000110100
select replace('000110100','0','') from dual;

-- length() : 문자열의 길이 출력
select emp_name,length(emp_name) from employees;

-- member
create table member2 as select * from member;

select * from member2;

create table member3 as select * from member where 1=2;

select * from member3;

drop table member5;

-- 구조가 member 테이블과 같을때, insert명령어를 통해 입력가능
insert into member3 select * from member;
commit;

desc member;

create table member4(
mid varchar2(50) not null,
mname varchar2(30) not null,
mgender char(6)
);

insert into member4 (mid,mname,mgender) select id,name,gender from member;

-- 테이블구조복사, 데이터내용복사
-- 테이블 일부 구조복사, 데이터 복사
-- 테이블구조복사
-- 테이블을 생성후, 데이터복사
-- 컬럼이 다르지만, 타입이 같은 테이블에 일부 컬럼을 복사

create table member5 as select id,pw,name from member;

select * from member5;

select * from employees;

drop table bookproduct;

---------------------------
CREATE TABLE BOOK (
    BNO NUMBER PRIMARY KEY,  -- 도서번호
    BTITLE VARCHAR2(200) NOT NULL, --도서명
    BAUTHOR VARCHAR2(100), --저자
    BPUBLISHER VARCHAR2(100), -- 출판사
    BPRICE NUMBER(10) NOT NULL, --판매가격
    BDISCOUNT NUMBER(5,2) DEFAULT 0, --할인율
    BSTOCK NUMBER(5) DEFAULT 0,  --재고수량
    BCATEGORY VARCHAR2(50), -- 도서분류
    BDATE DATE, --출판일
    BREGDATE DATE DEFAULT SYSDATE, -- 상품등록일
    updateDATE DATE DEFAULT SYSDATE, -- 상품수정일
    thimage varchar2(500),   -- 썸네일이미지
    mainimage varchar2(500), -- 메인이미지
    fileimage varchar2(500), -- 파일첨부이미지
    search varchar2(1000)  -- 검색어
);

ALTER TABLE BOOK MODIFY (BDISCOUNT NUMBER(6, 4));

-- 현재 월과 같은 월에 등록된 회원을 출력하시오.
select * from member;

select to_char(sysdate,'mm') from dual;

select mdate from member
where to_char(sysdate,'mm') = to_char(mdate,'mm');


-- 컬럼추가,수정,삭제,타입변경
select * from stuscore;
--컬럼추가
alter table stuscore add sturank number(3);

desc stuscore;

-- 컬럼수정
alter table stuscore modify(total varchar2(30));
alter table stuscore modify(total number(4,1));
desc stuscore;
-- 컬럼안에 데이터가 변경이 가능한 형태여야 가능
-- alter table stuscore modify(specialty number(5));
-- alter table stuscore modify(height varchar2(50));

desc board3;
select * from board3;
alter table board3 modify(bstep varchar2(4));
update board3 set bstep=null;
commit;

select * from stuscore;
-- 컬럼삭제
alter table stuscore drop column sturank;
desc stuscore;
-- rank컬럼 추가
alter table stuscore add rank number(4);

-- 컬럼 이름 변경
alter table stuscore rename column rank to srank;

-- 컬럼삭제
alter table stuscore drop column sturank;

create table mem(
id varchar2(50) primary key,
pw varchar2(100) not null,
name varchar2(20) unique,
gender varchar2(6) check(gender in('남자','여자')),
mdate date default sysdate,
mfile varchar2(10)
);

alter table mem add age number(5,2) check(age between 0 and 200);

desc mem;

insert into mem values(
'ggg','1111','','여자',sysdate,'',200
);

select * from mem;

select * from screen;

alter table screen add primary key(sno);
alter table screen drop constraint SYS_C008429;

alter table screen add constraint screen_pk_sno primary key (sno);

select * from screen;

select * from mem;
alter table mem drop constraint SYS_C008426;
alter table mem add constraint mem_pk_id primary key (id);

-- foreign key 등록하려면, 
-- 우선 다른테이블에서 primary key 등록이 되어 있어야 가능
select * from board;

select * from mem;

select bno from board2
order by bno;

-- 1-20 : id-aaa
-- 21-40 : bbb, 41-60:ccc, 61-80 : ddd, 81-100:eee
-- 변경하시오.
update board set id='aaa'
where bno between 1 and 20;

update board set id='eee'
where bno between 81 and 100;

select * from board order by bno;

-- foreign key 변경설정
alter table board 
add constraint board_fk_id foreign key(id)
references mem(id);

select * from board;

insert into board values(
101,'ddd','게시글 제목','게시글내용',101,0,0,0,sysdate,''
);

create table member2 as select * from member;

drop table member2;
drop table mem;



