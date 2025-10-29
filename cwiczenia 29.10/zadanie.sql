#1.
ALTER TABLE zadanie DROP FOREIGN KEY fk_zadanie_pracownik;
ALTER TABLE projekt DROP FOREIGN KEY fk_projekt_menadzer;

ALTER TABLE pracownik DROP PRIMARY KEY;
ALTER TABLE pracownik ADD PRIMARY KEY (id_pracownika);

ALTER TABLE zadanie
ADD CONSTRAINT fk_zadanie_pracownik
FOREIGN KEY (pracownik) REFERENCES pracownik(id_pracownika)
ON DELETE SET NULL;

ALTER TABLE projekt
ADD CONSTRAINT fk_projekt_menadzer
FOREIGN KEY (menadzer_projektu) REFERENCES pracownik(id_pracownika);

#2.

ALTER TABLE zadanie ADD COLUMN godziny_szacowane INT NOT NULL DEFAULT 8;

UPDATE zadanie
SET godziny_szacowane = CASE id_zadania
  WHEN 1 THEN 4
  WHEN 2 THEN 12
  WHEN 3 THEN 16
  ELSE godziny_szacowane
END;

ALTER TABLE zadanie ALTER COLUMN godziny_szacowane SET DEFAULT 6;

INSERT INTO zadanie (nazwa_zadania) VALUES ('zadanie testowe domyslne godziny');
SET @new_id := LAST_INSERT_ID();

SELECT id_zadania, nazwa_zadania, godziny_szacowane
FROM zadanie
WHERE id_zadania = @new_id;

DELETE FROM zadanie WHERE id_zadania = @new_id;

#3.

ALTER TABLE projekt ADD COLUMN opis_kratki VARCHAR(50) NULL;

ALTER TABLE projekt MODIFY COLUMN opis_kratki VARCHAR(200) NULL;

UPDATE projekt SET opis_kratki = 'MVP' WHERE id_projektu = 1;

ALTER TABLE projekt DROP COLUMN opis_kratki;


#4.
SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY';

ALTER TABLE zadanie DROP FOREIGN KEY fk_zadanie_projekt;

ALTER TABLE zadanie
ADD CONSTRAINT fk_zadanie_projekt
FOREIGN KEY (projekt) REFERENCES projekt(id_projektu)
ON DELETE SET NULL;

select * from projekt;
INSERT INTO projekt(id_projektu,nazwa_projektu,data_rozpoczecia,data_zakonczenia,menadzer_projektu) values(2,'Strona internetowa','2025-10-31','2026-06-30',1);
DELETE FROM projekt WHERE id_projektu=1;

SELECT id_zadania, nazwa_zadania, projekt
FROM zadanie
ORDER BY id_zadania;


