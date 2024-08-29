CREATE DATABASE autorentAleksander;
use autorentAleksander;


CREATE TABLE auto(
autoID int not null Primary key IDENTITY(1,1),
regNumber char(6) UNIQUE,
markID int,
varv varchar(20),
v_aasta int,
kaigukastID int,
km decimal(6,2)
);
SELECT * FROM auto
 
CREATE TABLE mark(
markID int not null Primary key IDENTITY(1,1),
autoMark varchar(30) UNIQUE
);

INSERT INTO mark(autoMark)
VALUES ('Ziguli');
INSERT INTO mark(autoMark)
VALUES ('Lambordzini');
INSERT INTO mark(autoMark)
VALUES ('BMW');
SELECT * FROM mark;

CREATE TABLE kaigukast(
kaigukastID int not null Primary key IDENTITY(1,1),
kaigukast varchar(30) UNIQUE
);
INSERT INTO kaigukast(kaigukast)
VALUES ('Automaat');
INSERT INTO kaigukast(kaigukast)
VALUES ('Manual');
SELECT * FROM kaigukast;

ALTER TABLE auto
ADD FOREIGN KEY (markID) REFERENCES mark(markID);
ALTER TABLE auto
ADD FOREIGN KEY (kaigukastID) REFERENCES kaigukast(kaigukastID);

CREATE TABLE tootaja(
	tootajaID int not null PRIMARY KEY identity(1,1),
    tootajaNimi varchar(50),
    ametiID int
) 

ALTER TABLE tootaja 
ADD FOREIGN KEY (ametiID) REFERENCES mark(markID);

CREATE TABLE klient(
klientID int not null PRIMARY KEY identity(1,1),
    kliendiNimi varchar(60),
    telefon varchar(20),
    aadress varchar(50),
    soiduKogemus varchar(30)
)


CREATE TABLE rendiLeping(
	lepingID int not null PRIMARY KEY identity(1,1),
    rendiAlgus DATE,
    rendiLopp DATE,
    klientID int,
    regNumber varchar(6),
    rendiKestvus int,
    hindKokku decimal(5, 2),
    tootajaID int
)

ALTER TABLE rendiLeping
ADD FOREIGN KEY (klientID) REFERENCES klient(klientID);
ALTER TABLE rendiLeping
ADD FOREIGN KEY (regNumber) REFERENCES auto(regNumber);
ALTER TABLE rendiLeping
ADD FOREIGN KEY (tootajaID) REFERENCES tootaja(tootajaID);


CREATE TABLE autodRemondis (
    autoRemondisID int not null PRIMARY KEY identity(1,1),
    autoID int,
    aadress varchar(60),
    tootajaID int
)

INSERT INTO klient(kliendiNimi, telefon, aadress, soiduKogemus) VALUES ('Alexander Vill', '56552677', 'estonia 44', 'halb'), ('Margarita Helli', '57236622', 'endla 64', 'hasti'), ('Oleg Nechiporenko', '52774122', 'tulemus 24', 'hasti');

INSERT INTO tootaja(tootajaNimi, ametiID) VALUES ('Mark Piller', 1), ('Jane Doe', 2), ('John Doe', 3)

INSERT INTO auto(regNumber, markID, varv, v_aasta, kaigukastID, km) VALUES ('ABC001', 1, 'must', 2019, 1, 1005.53) , ('BCV776', 2, 'roheline', 2023, 2, 105.3) , ('SSV414', 3, 'must', 2008, 1, 6532.52);

INSERT INTO rendiLeping(rendiAlgus, rendiLopp, klientID, regNumber, rendiKestvus, hindKokku, tootajaID) VALUES ('2024-06-25', '2024-06-29', 1, 'ABC001', 42, 163.3, 1), ('2024-06-20', '2024-06-26', 2, 'BCV776', 52, 421.54, 2), ('2024-06-16', '2024-06-29', 3, 'SSV414', 12, 641.52, 3); 

select * from auto
INNER JOIN kaigukast ON kaigukast.kaigukastID=auto.kaigukastID;

select * from auto
INNER JOIN mark ON mark.markID=auto.markID;

SELECT * FROM rendiLeping WHERE tootajaID = 1

SELECT COUNT(regNumber) as  count , SUM(hindKokku) AS summaarneMaksmus FROM rendiLeping;

SELECT TOP 1 auto.autoID, auto.varv FROM rendiLeping INNER JOIN auto ON rendiLeping.regNumber = auto.regNumber ORDER BY rendiLeping.hindKokku DESC ;

