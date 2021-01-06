1 Wyświetlenie  Firm

SELECT nazwa_firmy AS nazwa, regon, imie, nazwisko, telefon 
FROM klient where numer_klienta=0;

2 Zlecenia w styczeniu 

SELECT nazwa_uslugi AS nazwa, typ, wada, data_przyjecia, data_zakonczenia 
FROM zamowienie WHERE MONTH(data_przyjecia)=01;

3 Do jakich zlecenia są przypisani pracownicy

SELECT zamowienie.id_zamowienie AS 'numer zlecenia' , pracownik.imie,nazwisko 
FROM pracownik INNER JOIN zamowienie 
ON zamowienie.id_pracownika=pracownik.id_pracownik ORDER BY id_zamowienie;

4 koszt podzespolow

SELECT marka, nazwa  AS Produkt, CONCAT(cena,' zl') AS cena FROM podzespoly;

5 koszt zamowienia

SELECT zamowienie.id_zamowienie,nazwa_uslugi AS usluga,typ, concat(koszt.cena,' zl') AS cena
FROM zamowienie INNER JOIN koszt 
ON zamowienie.id_kosztu=koszt.id_koszt order by id_zamowienie;

6 Adres klienta

SELECT klient.imie,nazwisko, telefon, adres_klienta.miejscowosc,kod_pocztowy, ulica,concat(nr_domu,'/',nr_mieszkania)AS dom
FROM adres_klienta INNER JOIN klient 
ON adres_klienta.id_klienta=klient.id_klient order by miejscowosc;

7 jaki utarg wygenerował każdy z pracownikow

SELECT concat(pracownik.imie,' ', nazwisko)AS pracownik , concat(SUM(koszt.cena),' zl') AS utarg
 FROM pracownik JOIN(zamowienie JOIN koszt ON zamowienie.id_kosztu=koszt.id_koszt)
 ON zamowienie.id_pracownika=pracownik.id_pracownik GROUP BY pracownik.id_pracownik;

8 podzespoły, których cena jest większa od średniej wszystkich podzespołów

SELECT id_podzespolu, nazwa, marka, concat(cena,' zl') AS cena FROM podzespoly WHERE cena>(SELECT AVG(cena) FROM podzespoly);

9 Numer telefonu do zamowienia

SELECT zamowienie.id_zamowienie AS numerek,data_przyjecia,data_zakonczenia, klient.telefon AS 'Numer Klienta'
FROM zamowienie INNER JOIN klient
ON zamowienie.id_klienta=klient.id_klient;

10 loginy dla pracownikow

SELECT concat(imie,' ',nazwisko) AS 'imie i nazwisko',login,haslo FROM pracownik;

11

SELECT concat(SUM(cena),' zl') AS 'cały dochód' FROM koszt;

12

SELECT imie,nazwisko, data_zatrudnienia FROM pracownik WHERE data_zatrudnienia = (SELECT MIN(data_zatrudnienia) FROM pracownik);