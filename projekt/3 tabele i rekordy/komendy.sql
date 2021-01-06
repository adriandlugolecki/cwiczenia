Tworzenie tabel
CREATE TABLE zamowienie(id_zamowienie INT PRIMARY KEY, nazwa_uslugi VARCHAR(45), typ VARCHAR(45), wada VARCHAR(45), data_przyjecia DATE, data_zakonczenia DATE, id_pracownika INT, id_statusu INT, id_klienta INT, id_kosztu INT);
CREATE TABLE pracownik(id_pracownik INT PRIMARY KEY, imie VARCHAR(45), nazwisko VARCHAR(45), stanowisko VARCHAR(45), data_zatrudnienia DATE, data_zwolnienia DATE, login VARCHAR(32), haslo VARCHAR(32), id_dzialu INT);
CREATE TABLE dzial(id_dzial INT PRIMARY KEY, nazwa VARCHAR(45));
CREATE TABLE koszt(id_koszt INT PRIMARY KEY, cena FLOAT);
CREATE TABLE podzespoly(id_podzespolu INT PRIMARY KEY, nazwa VARCHAR(45), marka VARCHAR(45), cena DECIMAL(10,2), id_zamowienia INT);
CREATE TABLE status(id_status INT PRIMARY KEY, nazwa_statusu_zamowienia VARCHAR(45);
CREATE TABLE klient(id_klient INT PRIMARY KEY, imie VARCHAR(45), nazwisko VARCHAR(45), numer_klienta INT, telefon INT, nazwa_firmy VARCHAR(45), regon INT);
CREATE TABLE adres_klienta(id_adres INT PRIMARY KEY, miejscowosc VARCHAR(45), kod_pocztowy VARCHAR(6), ulica VARCHAR(45), nr_domu INT, nr_mieszkania INT, id_klienta INT, typ_adresu INT);
CREATE TABLE typ_adresu(id_typ_adresu INT PRIMARY KEY, nazwa VARCHAR(45));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Tworzenie relacji
ALTER TABLE zamowienie ADD FOREIGN KEY (id_pracownika) REFERENCES pracownik (id_pracownik);
ALTER TABLE zamowienie ADD FOREIGN KEY (id_statusu) REFERENCES status (id_status);
ALTER TABLE zamowienie ADD FOREIGN KEY (id_klienta) REFERENCES klient (id_klient);
ALTER TABLE zamowienie ADD FOREIGN KEY (id_kosztu) REFERENCES koszt (id_koszt);

ALTER TABLE pracownik ADD FOREIGN KEY (id_dzialu) REFERENCES dzial (id_dzial);

ALTER TABLE podzespoly ADD FOREIGN KEY (id_zamowienia) REFERENCES zamowienie (id_zamowienie);

ALTER TABLE adres_klienta ADD FOREIGN KEY (id_klienta) REFERENCES klient (id_klient);
ALTER TABLE adres_klienta ADD FOREIGN KEY (typ_adresu) REFERENCES typ_adresu (id_typ_adresu);
-----------------------------------------------------------------------------------------------------
Uzupelnianie tabel

INSERT INTO dzial (id_dzial, nazwa) VALUES (1,'Hardware'),(2,'Software');

INSERT INTO typ_adresu (id_typu_adresu, nazwa) VALUES (1,'Prywatny'),(2,'Firmowy');

INSERT INTO klient(id_klient, imie, nazwisko, numer_klienta, telefon, nazwa_firmy, regon) VALUES 
(1,'Robert','Kubica',1, 123 456 789,NULL,NULL),
(2,'Tomasz','Hajto',0, 123 457 891 ,'BobBudowniczy',123456784),
(3,'Sylwia','Nowak',1, 123 457 819,NULL,NULL),
(4,'Zbigniew','Zegota',1, 123 567 829,NULL,NULL),
(5,'Dominika','Majko',0, 423 678 926,'Stora',123456785),
(6,'Wladysław','Niedzwiedzki',0, 126 799 999,'Lion',123456786),
(7,'Andrzej','Dudek',1,666666666,'-','0'),
(8,'Anna','Wesołowska',0,777777777,'Sąd',123456789),
(9,'Adrian','Dudek',1,777777888,NULL,NULL),
(10,'Piotr','Nowak',1,888777111,NULL,NULL),
(11,'Paweł','Darkowski',0,333333112,'Dario',123456781);


INSERT INTO koszt(id_koszt, cena) VALUES (1,800),(2,150),(3,12000),(4,5000),(5,200),(6,8000),(7,8000);

INSERT INTO status(id_status, nazwa_statusu_zamowienia) VALUES (1,'w realizacji'),(2,'zrealizowane');

INSERT INTO adres_klienta(id_adres, miejscowosc, kod_pocztowy, ulica, nr_domu, nr_mieszkania, id_klienta, typ_adresu) VALUES
(1,'Warszawa','00-001','Kolorowa',5,5,1,1),
(2,'Ostroleka','07-410','Teczy',2,2,2,2),
(3,'Lomza','09-030','Sport',56,3,3,2),
(4,'Olsztyn','05-420','Sloneczna',13,4,4,1),
(5,'Ostrołęka','07-260','Prosta',5,5,5,2),
(6,'Lomza','23-444','Wojska',55,6,6,2),
(7,'Ostrołęka','07-410','Lipowa',56,7,7,1),
(8,'Ostrołęka','07-409','Cieplna',58,8,8,2),
(9,'Ostrołęka','07-410','Cielna',59,9,9,1),
(10,'Lomza','09-350','Cycyli',60,10,10,1),
(11,'Warszawa','00-010','Wojska',61,11,11,2);

INSERT INTO pracownik(id_pracownik, imie, nazwisko, stanowisko, data_zatrudnienia, data_zwolnienia, login, haslo, id_dzialu) VALUES 
(1,'Adrian','Zawada','specjalista','2001-01-01',NULL,'zawadr','zawadr123',2),
(2,'Artur','Szpilka','specjalista','2020-03-20',NULL,'szpart','szpart123',2),
(3,'Mateusz','Nasiadka','specjalista','2015-03-18',NULL,'nasmat','nasmat123',1),
(4,'Piotr','Tytko','praktykant','2020-09-07',NULL,'skoczek','123',1),
(5,'Piotr','Tymosz','praktykant','2020-11-09',NULL,'skoczek2','1234',1),
(6,'Paweł','Andras','specjalista','2019-11-08',NULL,'andpaw','andpaw123',2);

INSERT INTO zamowienie(id_zamowienie, nazwa_uslugi, typ, wada, data_przyjecia, data_zakonczenia, id_pracownika, id_statusu, id_klienta, id_kosztu) VALUES
(1,'wymiana płyty','hardware','uszkodzony kondensator','2021-01-02','2021-01-09',3,2,1,1),
(2,'instalacja systemu','software','uszkodzenie dysku','2021-01-07',NULL,1,1,2,2),
(3,'instalacja serwera','hardware','brak','2021-01-07',NULL,3,1,3,3),
(4,'sprzedaż komputera','hardware','brak','2020-12-09','2020-12-23',4,2,4,4),
(5,'wymiana cooler','hardware','brak','2021-01-08',NULL,3,1,5,5),
(6,'Budowa sieci','software','brak','2021-01-15',NULL,2,1,6,6),
(7,'sprzedaż komputera','hardware','brak','2020-12-09','2020-12-23',4,2,7,4),
(8,'instalacja serwera','hardware','brak','2021-01-07',NULL,3,1,8,3),
(9,'wymiana cooler','hardware','brak','2021-01-08',NULL,5,1,9,5),
(10,'wymiana procesora','hardware','brak','2021-01-09',NULL,5,1,10,7),
(11,'sprzedaż komputera','hardware','brak','2020-12-09','2020-12-20',4,2,7,4);

INSERT INTO podzespoly(id_podzespolu, nazwa , marka , cena, id_zamowienia) VALUES
(1,'płyta główna','MSI',699.99,1),
(2,'system operacyjny','Windows 10 pro',100.00,2),
(3,'serwer','Dell',10000.00,3),
(4,'komputer','Dell OptiPlex',4899.99,4),
(5,'cooler','BeQuiet',150.99,5),
(6,'szafa rack ','Netrack',1000.00,6),
(7,'komputer','Dell OptiPlex',4699.99,7),
(8,'serwer','Dell',11000.00,8),
(9,'cooler','BeQuiet',100.99,9),
(10,'procesor','intel',5000.99,10),
(11,'komputer','Dell OptiPlex',4700.99,11);


