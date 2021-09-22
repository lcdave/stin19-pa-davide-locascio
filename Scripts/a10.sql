use vbzdat;

# 20 grösste Verspätungen
SELECT 
a.id, 
a.haltepunkt_id, 
h2.halt_lang, 
h.GPS_Latitude, 
h.GPS_Longitude, 
a.fahrweg_id,
l.linie,
a.datumzeit_ist_an, 
a.datumzeit_soll_an, 
a.delay
FROM ankunftszeiten a
LEFT JOIN haltepunkt h ON h.halt_punkt_id = a.haltepunkt_id
LEFT JOIN Haltestelle h2 ON h2.halt_id = h.halt_id
LEFT JOIN linie l on a.fahrweg_id = l.fahrweg_id 
ORDER BY delay desc LIMIT 20;

# Tabelle für CSV Export
CREATE TABLE verspaetungen
SELECT 
h.GPS_Latitude as lat,
h.GPS_Longitude as lng, 
h2.halt_lang as name,
'#ff0000' as color,
CONCAT(a.delay, " Sekunden Verspätung, Haltestelle: ", h2.halt_lang) as note
FROM ankunftszeiten a
LEFT JOIN haltepunkt h ON h.halt_punkt_id = a.haltepunkt_id
LEFT JOIN Haltestelle h2 ON h2.halt_id = h.halt_id
LEFT JOIN linie l on a.fahrweg_id = l.fahrweg_id 
ORDER BY delay desc LIMIT 20;