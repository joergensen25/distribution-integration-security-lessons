use transactions

--set transaction isolation level read committed -- de to select giver forskellig alder
set transaction isolation level repeatable read -- de to selects giver samme alder.

begin tran
	
	select navn, alder
	from person
	where navn = 'Ulla Jensen'

	select navn, alder
	from person
	where navn = 'Ulla Jensen'

commit tran