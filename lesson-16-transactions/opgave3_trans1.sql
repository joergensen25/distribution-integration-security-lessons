use transactions

--set transaction isolation level repeatable read --insert'en venter ikke
set transaction isolation level serializable -- insert'en venter på at transaktionen er lukket

begin tran

	select count(*)
	from person

	select count(*)
	from person

commit tran