use transactions

drop table if exists Konto

CREATE TABLE Konto (
regNr char(4),
ktoNr char(7),
tekst CHAR(20),
saldo decimal(10,2),
renteIndlån decimal(4,2),
renteUdlån decimal(4,2),
PRIMARY KEY (regNr, ktoNr))

insert into Konto (regNr, ktoNr, tekst, saldo, renteIndlån, renteUdlån) values 
( 1234, 1234567, 'Lønkonto', 10000.00, 1.2, 5.2),
( 1234, 1231236, 'Lønkonto', 5000.00, 1.2, 5.2),
( 1234, 1357967, 'Lønkonto', 12000.00, 1.2, 5.2),
( 1216, 1256788, 'Lønkonto', 15000.00, 1.2, 5.2),
( 1216, 2234567, 'Boliglån', 2550000.00, 1.2, 5.2),
( 1234, 2231236, 'Boliglån', 3175000.00, 1.2, 5.2)

select *
from Konto