use databaseA

drop table if exists Kunde
drop table if exists Bestilling
drop view if exists AlleKunder

create table Kunde (
kundeid int primary key,
navn varchar(25),
postnr char(4)
)

create table Bestilling (
kundeid int,
varenavn varchar(25),
antalVarer int
)

insert into Kunde (kundeid, navn, postnr) values 
(1, 'Anders', 8000),
(2, 'Rasmus', 8600),
(3, 'Peter', 8200)


insert into Bestilling (kundeid, varenavn, antalVarer) values 
(1, 'Computer', 2),
(1, 'Mus', 1),
(2, 'Tastatur', 3),
(4, 'Skærm', 1),
(5, 'USB Kabel', 2)


select * from Kunde join Bestilling on Kunde.kundeid = Bestilling.kundeid


-- Begge kundetabeller samlet:
go
create view AlleKunder as 
select kundeid, navn, postnr from Kunde 
union
select kundeid, navn, postnr from databaseB.dbo.Kunde
go

select * from AlleKunder


-- Trigger på view der indsætter i begge tabeller:
go
create trigger trigger_insertAlleKunder 
on AlleKunder
instead of insert
as
begin
	insert into databaseA.dbo.Kunde (kundeid, navn, postnr)
	select kundeid, navn, postnr
	from inserted
	where kundeid % 2 = 0

	insert into databaseB.dbo.Kunde (kundeid, navn, postnr)
	select kundeid, navn, postnr
	from inserted
	where kundeid % 2 = 1
end
go

select * from AlleKunder

-- Test insert (ulige id = tabel B)
insert into Allekunder (kundeid, navn, postnr) values
(7, 'Jens', 8210)


-- Query der samler posteringer:
select ak.kundeid, ak.navn, ak.postnr, sum(p.beloeb) from AlleKunder ak
join databaseB.dbo.Postering p on ak.kundeid = p.kundeid
group by
ak.kundeid,
ak.navn,
ak.postnr



select * from AlleKunder ak
join databaseB.dbo.Postering p on ak.kundeid = p.kundeid