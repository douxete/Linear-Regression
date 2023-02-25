drop database if exists dbCognitiveRegression;

create database dbCognitiveRegression;

use dbCognitiveRegression;

create table tblSleepCognitiveData (
    hoursOfSleep int,
    cognitiveTestScore int
);

insert into tblSleepCognitiveData values
(6	,70),
(8	,90),
(7	,80),
(9	,95),
(5	,60),
(7	,75),
(8	,85),
(6	,65),
(10,	100),
(5	,55),
(9	,90),
(7	,80),
(6	,70),
(8	,85),
(7	,75),
(9	,95),
(6	,65),
(10,	100),
(5	,60),
(8	,85);