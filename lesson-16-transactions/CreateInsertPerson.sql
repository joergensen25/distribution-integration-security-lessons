use transactions

drop table if exists person

create table Person(
cpr char(11),
navn varchar(20),
adresse varchar(30),
alder int
)


insert into Person values
('060653-1254', 'Benny Hansen', 'Oppevej 44', 67),
('101286-7584', 'Ulla Jensen', 'Nedevej 12', 18),
('111245-3698', 'Pia Keldsen', 'Hennevej 45', 12),
('140365-1453', 'Tom Tomsen', 'Parkgade 106', 56),
('230123-7854', 'Henrik Poulsen', 'Pandavej 78', 20),
('311084-3971', 'Kim Skov', 'Supergade 45', 23),
('101045-1397', 'Bodil Finsen', 'Godevej 78', 50),
('150686-5741', 'Steen Åkjær', 'Ingenvej 41', 61),
('260589-7856', 'Anne Toft', 'Kladevej 63', 87),
('080808-2684', 'Lene Olesen', 'Mellemvej 4', 13),
('060666-6666', 'Ellen Eriksen', 'Cykelgade 9', 26)
