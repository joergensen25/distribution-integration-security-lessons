use transactions

set Transaction isolation level read committed

begin tran
	select navn, alder
	from person
	where navn = 'Benny Hansen'
commit tran