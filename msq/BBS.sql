
create database bbs;

use bbs;
drop table article;
create table article 
(
id int primary key auto_increment,
pid int,
rootid int,
title varchar(255),
cont text,
pdate datetime,
isleaf int 
);

insert into article values (null, 0, 1, '1','i love you', now(), 1);
insert into article values (null, 1, 1, '2','love you',now(), 1);
insert into article values (null, 2, 1, '3','mouse', now(), 0);
insert into article values (null, 2, 1, '4','rain', now(), 1);
insert into article values (null, 4, 1, '5','i still', now(), 0);
insert into article values (null, 1, 1, '6','hi there', now(), 1);
insert into article values (null, 6, 1, '7','back up', now(), 0);
insert into article values (null, 6, 1, '8','are you troll me', now(), 0);
insert into article values (null, 2, 1, '9','what kind people you are', now(), 1);
insert into article values (null, 9, 1, '10','juesus', now(), 0);

