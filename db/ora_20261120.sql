create table board(
bno number(4),
id varchar2(50),
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4),
bindent number(4),
bhit number(4),
bdate date,
bfile varchar2(100)
);

create table board(
bno number(4) primary key,
id varchar2(50) not null,
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4) default 0,
bindent number(4) default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

drop table board2;

select * from employees;

select * from board;

-- select board_seq.nextval from employees;
-- nextval 1씩 증가
-- currval 현재 시퀀스 번호가 몇번인지 알려줌.
select board_seq.nextval from dual;
select board_seq.currval from dual;

insert into board values(
board_seq.nextval,'aaa','게시글제목','게시글내용',
board_seq.currval,0,0,0,sysdate,'1.jpg'
);

insert into board (bno,id,btitle,bcontent,bgroup,bfile) values(
board_seq.nextval,'aaa','게시글제목2','게시글내용2',
board_seq.currval,'2.jpg'
);

-- select, insert, update, delete / commit,rollback

rollback;

select * from board;

-- 테이블구성, 테이블데이터 모두 복사
create table board2 as select * from board;

-- 테이블구성만 복사
create table board3 as select * from board where 1=2;

drop table board;
drop table board2;
drop table board3;
drop table member;
drop table stuscore;
-- board테이블 생성후 board.csv파일을 import하시오.
-- board2-데이터까지 복사해서 생성,board3-구조만 복사 생성하시오.
-- stu2.xlsx 관련된 테이블을 생성하고 파일을 import하시오.

create table board(
bno number(4) primary key,
id varchar2(50) not null,
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4) default 0,
bindent number(4) default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

select * from board;

create table board2 as select * from board;

create table board3 as select * from board where 1=2;

create table stuscore (
    no        number(4) primary key,   
    name      VARCHAR2(50) NOT NULL,  
    school    VARCHAR2(50),           
    rank      NUMBER(2),             
    height    NUMBER(5,1),            
    kor       NUMBER(3),              
    eng       NUMBER(3),              
    math      NUMBER(3),              
    specialty VARCHAR2(30)            
);

create table students (
    no        NUMBER(4) PRIMARY KEY,
    name      VARCHAR2(50) NOT NULL,
    school    VARCHAR2(50),
    rank      NUMBER(2),
    height    NUMBER(5,1),
    kor       NUMBER(3),
    eng       NUMBER(3),
    math      NUMBER(3),
    specialty VARCHAR2(30)
);

create table member (
id varchar2(50) primary key,
pw varchar2(100) not null,
name varchar2(30) not null,
nickname varchar2(30),
tel char(12),
gender char(6) default '남자',
hobby varchar2(50) default '게임',
mdate date default sysdate
);

select * from board;
select * from stuscore;
select * from students;
select * from member;

drop table galleryList;


create table gallerylist (
    gno number(12) primary key,
    galContentId varchar2(8) not null,
    galContentTypeId varchar2(10),
    galTitle varchar2(100),
    galWebImageUrl varchar2(100),
    galCreatedtime varchar2(100),
    galModifiedtime varchar2(100),
    galPhotographyMonth varchar2(10),
    galPhotographyLocation varchar2(100),
    galPhotographer varchar2(100),
    galSearchKeyword varchar2(1000)
);


SELECT * FROM galleryList;

select * from stuscore;

-- odrder by asc, desc  
select * from stuscore
order by rank, height asc, kor desc;

-- 숫자함수
-- abs 절대값
select abs(-10) from dual;

-- round():반올림, ceil():올림, floor():버림, trunc():자르기
select 100/6 from dual;
-- 소수점 자리수
select round(100/6,2) from dual;
-- floor,ceil 소수점 첫째자리에서 계산
select round(1978,-1) from dual;
select floor(100/6) from dual;
select ceil(100/3) from dual;

select * from stuscore;

select round(kor,-1) from stuscore;

select kor,trunc(kor,-1),round(kor,-1) from stuscore;

--select trunc(bdate,1) from doard;

select mod(23,2) from dual;

-- stuscore 홀수학생만 출력하시오.
select * from stuscore
where mod(rank,2)=1;

select * from stuscore
where rank=1 or rank=3;

select * from stuscore
where rank in(1,3);

-- 형변환 number,varchar2,char,clob,date
-- last_day
select sysdate-365,sysdate,last_day(sysdate+365) from dual;

select mdate as 가입일,sysdate-mdate as 현재까지기간 from member;

-- 명령어를 조합해서 사용가능
select mdate as 가입일,round(sysdate-mdate,2) from member;
-- 날짜모양 변경가능
select mdate,to_char(mdate,'yyyy-mm-dd') from member;

-- round():반올림
select mdate,round(mdate,'month') from member;
select mdate,round(mdate,'year') from member;

-- 날짜형태
select mdate,to_char(mdate,'yyyy-mm-dd hh:mi:ss') from member;

select * from board3;
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board3;
insert into board3 values(
1,'aaa','게시글제목','게시글내용',1,0,0,0,sysdate,'1.jpg'
);

-- 날짜 : 숫자함수 - round, trunc
-- 월기준 : month,mon,mm
-- 년도기준 : year,yyyy
select mdate,last_day(mdate),trunc(mdate,'month'),round(mdate,'mon') from member;
select mdate,last_day(mdate),trunc(mdate,'year'),round(mdate,'year') from member;
select mdate,trunc(mdate,'yyyy') from member;

select * from board3;
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board3;

-- 요일기준 - trunc:해당기간 일요일날짜로 변경, round:수요일기준으로 반올림
-- hh,mi,ss 기준으로 trunc,round 사용
select mdate,trunc(mdate,'day') from member;
select sysdate,trunc(sysdate,'day'),round(sysdate,'day') from dual;

-- months_between : 날짜와 날짜사이의 개월수
select mdate,sysdate,months_between(sysdate,mdate) from member;

select mdate,sysdate,trunc(months_between(sysdate,mdate)) from member
where months_between(sysdate,mdate)>=6;

-- add_months : 개월 추가
-- 1년후 첫째일, 마지막일을 출력하시오.
select mdate,add_months(mdate,12) from member;

select mdate,add_months(mdate,12),
trunc(add_months(mdate,12),'mm'),last_day(add_months(mdate,12))
from member;

-- 금요일이면 이전 일요일날짜로 이동
select trunc(sysdate,'day'),sysdate,round(sysdate,'day') from dual;

-- 다가오는 요일의 날짜를 리턴
select next_day(sysdate,'토요일') from dual;

-- 일요일마다 행사가 있어요. 다음번 일요일은 언제일까요?
-- 다다음주 일요일
select next_day(next_day(sysdate,'일요일'),'일요일') from dual;


-- 날짜와 날짜의 사이 게산
select (sysdate-(sysdate-1)) from dual;

select sysdate-mdate from member;

-- trunc(): 1일자를 알려줌.
-- round(): 15일 기준으로 이전에 1일, 이후 다음달 1일
-- last_day : 마지막 날짜를 알려줌.

-- varchar2타입
select '2026-11-20' from dual;
select to_date('2026-11-20')+1 from dual;
select to_date('20261120')+1 from dual;

select * from gallerylist;
select to_date('galcreatedtime') from gallerylist;
select galcreatedtime from gallerylist;

-- substr함수
-- 'abcdef'[0:2]
-- substr함수를 사용해서 날짜부분만 추출후, 날짜타입으로 변경
-- 그달에 1일을 출력하시오.
select to_date(substr(galcreatedtime,1,8))+1 from gallerylist;

select substr('abcdef',3,2) from dual;

select galcreatedtime from gallerylist;

select trunc(to_date(substr(galcreatedtime,1,8)),'month') from gallerylist;
select last_day(to_date(substr(galcreatedtime,1,8))) from gallerylist;

-- 2026-11-20 12:34:12
-- yyyy-mm-dd hh:mi:ss day,dy
select bdate from board3;
select to_char(bdate,'yyyy-mm-dd hh:mi:ss day') from board3;

select * from board3;

insert into board3 values(
1,'aaa','222게시글','222내용',2,0,0,0,sysdate,'2.jpg'
);

commit;

-- yyyy/mm/dd hh24:mi:ss day
select * from board3;
select to_char(bdate,'yyyy-mm-dd hh:mi:ss day') from board3;
select to_char(bdate,'yyyy-mm-dd hh24:mi:ss day') from board3;
select to_char(bdate,'mon,dd,yy hh:mi:ss day') from board3;
select to_char(bdate,'yy-mm-dd hh:mi:ss day') from board3;

select * from member;
-- 가입일이 7월인 사람만 출력하시오.
select to_char(mdate,'yyyy-mm') from member;
select to_char(mdate,'mm') from member;
select mdate from member
where to_char(mdate,'mm')='07';

-- 1900년대 입사한 사람을 출력하시오.
-- 2000년대 입사한 사람을 출력하시오.
select hire_date from employees;
select to_char(hire_date,'yyyy') from employees;
select hire_date from employees
where to_char(hire_date,'yyyy')='2000';

select emp_name,hire_date,to_char(hire_date,'yyyy') from employees
where substr(to_char(hire_date,'yyyy'),0,2)='20';

select emp_name,hire_date,to_char(hire_date,'yyyy') from employees
where substr(to_char(hire_date,'yyyy'),0,2)='19';

select trunc(sysdate,'year') from dual;

-- kor 40점대(40-49), 60점대(60-69), 80점대(80-90)에 있는 학생을 출력하시오.
select * from stuscore;
select kor,name  from stuscore
where (kor>=40 and kor<=49)
or (kor>=60 and kor<=69)
or (kor>=80 and kor<=90);

select kor,trunc(kor,-1) from stuscore
where trunc(kor,-1)=40 or trunc(kor,-1)=60 or trunc(kor,-1)=80;

select kor from stuscore
where trunc(kor,-1) in (40,60,80)
order by kor desc;

-- 시간
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss day') from board3;
select bdate,to_char(bdate,'yyyy-mm-dd pm hh') from board3;

-- 날짜타입 -> 문자타입 / 날짜형태를 변경해서 출력
-- 숫자타입 -> 문자타입
-- 자리수 : '999,999,999,999' 자리가 있으면 자리출력, 없으면 빈공백
-- '000,000,000,000' 있으면 자리출력, 없으면 0으로 채워줌.
-- L : 원화표시, 영문버전 $, 일본어 버전 엔화표시
-- .00 : 소수점 표시
select * from kor_loan_status;
select to_char(salary*1425*12*10,'999,999,999,999') as ysalary from employees;
select to_char(salary*1425*12*10,'009,999,999,999') as ysalary from employees;
select to_char(salary*1425*12*10,'L999,999,999,999') as ysalary from employees;

-- loan_jan_amt * 10000000천만단위임.
-- 천만원을 곱해서 자리수를 표시하시오.
select * from kor_loan_status;
select to_char(loan_jan_amt*10000000,'L999,999,999,999') from kor_loan_status;

-- 날짜 문자로 변환 : 형태를 변경
-- 숫자 문자로 변환 : 천단위,원화표시
-- 숫자 날짜로 변환
select to_date(20261120,'yyyymmdd') from dual;
select to_date('20261120','yyyymmdd') from dual;

select * from gallerylist;

-- galphotographymonth 날짜타입으로 변경하시오.
desc gallerylist;
select galphotographymonth from gallerylist;
select to_date(galphotographymonth,'yyyy-mm') from gallerylist;

update gallerylist set galphotographymonth2=to_date(galphotographymonth,'yyyymm');

commit;

alter table gallerylist
add (GALPHOTOGRAPHYMONTH2 date);

select * from gallerylist;

update gallerylist set galphotographymonth2 = to_date(galphotographymonth,'yyyy-mm-dd');

select galphotographymonth,galphotographymonth2 from gallerylist;

-- 컬럼삭제
alter table gallerylist
drop column galphotographymonth;

alter table gallerylist
drop column GALPHOTOGRAPHYMON;

-- 컬럼추가
alter table gallerylist
add (galphotographymonth2 date);

-- 컬럼이름 변경
alter table gallerylist
rename column galphotographymonth2 to galphotographymonth;

-- 컬럼순서 변경
alter table gallerylist modify GALPHOTOGRAPHER invisible;
alter table gallerylist modify GALSEARCHKEYWORD invisible;
alter table gallerylist modify GALPHOTOGRAPHER visible;
alter table gallerylist modify GALSEARCHKEYWORD visible;


desc gallerylist;

-- galphotographymonth : varchar타입 
-- -> 날짜타입으로 변경하려니 데이터가 변경하려는타입과 형태가 다름.

drop table gallerylist;

create table gallerylist (
    gno number(12) primary key,
    galContentId varchar2(8) not null,
    galContentTypeId varchar2(10),
    galTitle varchar2(100),
    galWebImageUrl varchar2(100),
    galCreatedtime varchar2(100),
    galModifiedtime varchar2(100),
    galPhotographyMonth varchar2(10),
    galPhotographyLocation varchar2(100),
    galPhotographer varchar2(100),
    galSearchKeyword varchar2(1000)  
);

select to_date(galPhotographyMonth,'yyyy-mm') from gallerylist;

update gallerylist set 
galPhotographyMonth = to_date(galPhotographyMonth,'yyyy-mm') ;

commit;

-- varchar2
select galPhotographyMonth from gallerylist;

alter table gallerylist
add ( galPhotographyMonth2 date );
-- galPhotographyMonth2:date타입
update gallerylist
set galPhotographyMonth2=galPhotographyMonth;

alter table gallerylist
drop column galphotographymonth;

alter table gallerylist
rename column galphotographymonth2 to galphotographymonth;

desc gallerylist;

select * from gallerylist;

-- 날짜타입으로 변경하시오.
select to_date(galcreatedtime,'yyyymmddhh24miss') from gallerylist;

alter table gallerylist
add ( galcreatedtime2 date );

update gallerylist
set galcreatedtime2 = to_date(galcreatedtime,'yyyymmddhh24miss');

commit;

alter table gallerylist
drop column galcreatedtime;

select * from gallerylist;

desc gallerylist;

alter table gallerylist modify GALMODIFIEDTIME invisible;
alter table gallerylist modify GALPHOTOGRAPHYLOCATION invisible;
alter table gallerylist modify GALPHOTOGRAPHER invisible;
alter table gallerylist modify GALSEARCHKEYWORD invisible;

alter table gallerylist modify GALMODIFIEDTIME visible;
alter table gallerylist modify GALPHOTOGRAPHYLOCATION visible;
alter table gallerylist modify GALPHOTOGRAPHER visible;
alter table gallerylist modify GALSEARCHKEYWORD visible;

desc gallerylist;

alter table gallerylist
rename column GALCREATEDTIME2 to GALCREATEDTIME;


select '20261120',sysdate-to_date('20260101') from dual;
