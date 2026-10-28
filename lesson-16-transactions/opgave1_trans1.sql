use transactions

begin tran
	update Person
	set alder = 46
	where navn = 'Benny Hansen'

rollback tran

select navn, alder
from Person
where navn = 'Benny Hansen'