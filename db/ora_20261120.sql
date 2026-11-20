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


























