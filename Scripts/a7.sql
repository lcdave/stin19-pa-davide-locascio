use vbzdat;

# Generell
SELECT
fsi.linie, fsi.richtung, fsi.fahrzeug,
fsi.kurs,
fsi.seq_von, fsi.halt_id_von, fsi.halt_id_nach, fsi.halt_punkt_id_von, fsi.halt_punkt_id_nach, fsi.fahrt_id, fsi.fahrweg_id, fsi.fw_no,
fsi.fw_typ,
fsi.fw_kurz,
fsi.fw_lang, fsi.betriebs_datum, fsi.datumzeit_soll_an_von, fsi.datumzeit_ist_an_von, fsi.datumzeit_soll_ab_von, fsi.datumzeit_ist_ab_von, fsi.datum__nach,
TIMEDIFF (datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an,
TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an_seconds, 
TIMEDIFF (datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab,
TIMESTAMPDIFF (SECOND, datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab_seconds, 
TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_soll_ab_von) as halt_soll_time_seconds, 
TIMESTAMPDIFF (SECOND, datumzeit_ist_an_von, datumzeit_ist_ab_von) as halt_ist_time_seconds
FROM fahrzeiten_soll_ist fsi
LIMIT 40000;

# Fuer die Linie 5, am 27.12.20 mit der Fahrt ID 720
SELECT
fsi.linie, fsi.richtung, fsi.fahrzeug, fsi.kurs, fsi.seq_von, 
fsi.halt_id_von, fsi.halt_id_nach, fsi.halt_punkt_id_von, 
fsi.halt_punkt_id_nach, fsi.fahrt_id, fsi.fahrweg_id, fsi.fw_no, 
fsi.fw_typ, fsi.fw_kurz,fsi.fw_lang, fsi.betriebs_datum, 
fsi.datumzeit_soll_an_von, fsi.datumzeit_ist_an_von, 
fsi.datumzeit_soll_ab_von, fsi.datumzeit_ist_ab_von, fsi.datum__nach,
TIMEDIFF (datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an,
TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_ist_an_von) as timediff_an_seconds, 
TIMEDIFF (datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab,
TIMESTAMPDIFF (SECOND, datumzeit_soll_ab_von, datumzeit_ist_ab_von) as timediff_ab_seconds, 
TIMESTAMPDIFF (SECOND, datumzeit_soll_an_von, datumzeit_soll_ab_von) as halt_soll_time_seconds, 
TIMESTAMPDIFF (SECOND, datumzeit_ist_an_von, datumzeit_ist_ab_von) as halt_ist_time_seconds
FROM fahrzeiten_soll_ist fsi
WHERE fsi.linie = 5 AND datum_von = '27.12.20' AND fahrt_id = 720
LIMIT 40000;
