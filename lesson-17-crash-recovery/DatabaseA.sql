use databaseA

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


create view AlleKunder as 
select kundeid, navn, postnr from Kunde 
union
select kundeid, navn, postnr from databaseB.dbo.Kunde



select * from AlleKunder



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

select * from AlleKunder


insert into Allekunder (kundeid, navn, postnr) values
(7, 'Jens', 8210)


select * from AlleKunder


