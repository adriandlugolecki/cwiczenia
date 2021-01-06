1 Funkcja(liczy czas do dobioru)

DELIMITER //
CREATE FUNCTION czas_oczekiwania(id int)
 RETURNS int
BEGIN
    DECLARE czas INT;
    SELECT datediff(data_zakonczenia, data_przyjecia) INTO czas FROM zamowienie WHERE id_zamowienie=id;
    RETURN czas;
END //

2 PROCEDURE(po 60 dniach usuwa zamowienie)

DELIMITER //
CREATE PROCEDURE po_gwarancji()
BEGIN
DELETE FROM zamowienie WHERE current_date() - data_zakonczenia > 60;
END//

3 Wyzwalacze
(nowe ceny powyżej 1000 postają 20% zniżki)

DELIMITER //
CREATE TRIGGER znizka
BEFORE INSERT ON koszt
FOR EACH ROW
BEGIN
IF NEW.cena>1000
THEN 
SET NEW.cena = NEW.cena * 0.80;
END IF;
END//

(numer klienta) jest to numer okreslający czy osoba posiada firme czy jest osoba fizyczna
wartosc 1 - nie posiada firmy 
wartosc 0 - posiada firme

DELIMITER //
CREATE TRIGGER prywatna_czy_firma
BEFORE INSERT ON klient
FOR EACH ROW
BEGIN
IF NEW.numer_klienta = 1
THEN
SET NEW.nazwa_firmy = NULL;
SET NEW.regon = NULL;
END IF;
END//

