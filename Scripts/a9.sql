use vbzdat;

CREATE TABLE ankunftszeiten
SELECT fsi.halt_punkt_id_von as haltepunkt_id, 
fsi.fahrweg_id, fsi.fahrt_id,
fsi.datumzeit_ist_an_von as datumzeit_ist_an,
fsi.datumzeit_soll_an_von as datumzeit_soll_an,
fsi.datumzeit_soll_ab_von as datumzeit_soll_ab,
TIMESTAMPDIFF (SECOND, fsi.datumzeit_soll_an_von, fsi.datumzeit_ist_an_von) as delay
FROM fahrzeiten_soll_ist fsi
WHERE fsi.linie = 5 AND fsi.seq_von = 1

UNION 

SELECT fsi.halt_punkt_id_nach as haltepunkt_id, 
fsi.fahrweg_id, fsi.fahrt_id,
fsi.datumzeit_ist_an_nach as datumzeit_ist_an,
fsi.datumzeit_soll_an_nach as datumzeit_soll_an,
fsi.datumzeit_soll_ab_nach as datumzeit_soll_ab,
TIMESTAMPDIFF (SECOND, fsi.datumzeit_soll_an_nach, fsi.datumzeit_ist_an_nach) as delay
FROM fahrzeiten_soll_ist fsi
WHERE fsi.linie = 5;

ALTER TABLE ankunftszeiten ADD id INT PRIMARY KEY auto_increment FIRST;
ALTER TABLE ankunftszeiten ADD CONSTRAINT fk1 FOREIGN KEY (haltepunkt_id) REFERENCES haltepunkt(halt_punkt_id);
ALTER TABLE ankunftszeiten ADD CONSTRAINT fk2 FOREIGN KEY (fahrweg_id) REFERENCES linie(fahrweg_id);