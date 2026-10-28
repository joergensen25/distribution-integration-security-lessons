use databaseB
drop table if exists Kunde
drop table if exists Postering

create table Kunde (
kundeid int primary key,
navn varchar(25),
postnr char(4)
)

create table Postering (
kundeid int,
beloeb int
)


insert into Kunde (kundeid, navn, postnr) values
(4, 'Yone', 5000),
(5, 'Sylas', 6000),
(6, 'Emma', 7000)

insert into Postering (kundeid, beloeb) values
(1, 1000),
(2, 500),
(4, 2000),
(4, 300),
(5, 750),
(6, 150)


select * from Kunde join Postering on Kunde.kundeid = Postering.kundeid