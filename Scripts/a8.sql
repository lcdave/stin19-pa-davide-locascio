use vbzdat;

# Aufgabe a
SELECT DISTINCT fsi.linie, fsi.richtung, fsi.fw_no, fsi.fw_lang 
FROM fahrzeiten_soll_ist fsi where fsi.linie = 5;

# Aufgabe b
CREATE OR REPLACE VIEW query_line 
AS SELECT DISTINCT fsi.linie, fsi.richtung, fsi.fw_no, fsi.fw_lang 
FROM fahrzeiten_soll_ist fsi where fsi.linie = 5;

# Aufgabe c
CREATE TABLE linie (PRIMARY KEY (fahrweg_id))
SELECT DISTINCT fsi.fahrweg_id, fsi.linie, fsi.richtung, fsi.fw_no, fsi.fw_lang 
FROM fahrzeiten_soll_ist fsi where fsi.linie = 5;