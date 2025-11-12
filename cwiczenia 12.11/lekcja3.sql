

use infs_dunajskim

-- zad 1
-- 1 C
CREATE TABLE infs_dunajskim.kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE infs_dunajskim.zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE infs_dunajskim.ekwipunek SELECT * FROM wikingowie.ekwipunek;
-- 2
SELECT * FROM zasob;
-- 3
SELECT * from zasob WHERE rodzaj='jedzenie';
-- 4
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);

-- ZAD 2
-- 1
SELECT * FROM kreatura WHERE rodzaj NOT LIKE 'wiedzma' AND udzwig>=50;
-- 2
SELECT * from zasob WHERE waga BETWEEN 2 AND 5;
-- 3
SELECT * FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig BETWEEN 30 AND
70;

-- ZAD 3
-- 1
SELECT * FROM zasob WHERE MONTH(dataPozyskania) IN (07,08);
-- 2
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
-- 3
SELECT * FROM kreatura WHERE dataUr IS NOT NULL ORDER BY dataUr ASC LIMIT 5;

-- ZAD 4
-- 1
SELECT DISTINCT nazwa FROM zasob;
-- 2
SELECT CONCAT(nazwa, ' - ', rodzaj) FROM kreatura WHERE rodzaj LIKE 'wi%';
-- 3
SELECT (ilosc*waga) AS calkowita_waga_zasobu FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;

-- ZAD 5
-- 1
SELECT nazwa, (waga*ilosc-(waga*ilosc)*0.3) AS masa_netto, ((waga*ilosc)*0.3) AS masa_odpadkow FROM zasob WHERE rodzaj = 'jedzenie';
-- 2
SELECT * FROM zasob WHERE rodzaj IS NULL;
-- 3
SELECT DISTINCT nazwa FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa like '%os' ORDER BY nazwa asc;

