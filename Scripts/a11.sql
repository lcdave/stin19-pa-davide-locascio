use vbzdat;

# Tabelle für CSV Export
CREATE TABLE linie_713_visualisierung
SELECT 
h.GPS_Latitude as lat,
h.GPS_Longitude as lng, 
h2.halt_lang as name,
'#ff0000' as color,
CONCAT(a.delay, " Sekunden Verspätung, Haltestelle: ", h2.halt_lang) as note
FROM ankunftszeiten a
LEFT JOIN haltepunkt h ON h.halt_punkt_id = a.haltepunkt_id
LEFT JOIN Haltestelle h2 ON h2.halt_id = h.halt_id
WHERE a.fahrt_id = 713 AND DATE(a.datumzeit_ist_an) = '2021-01-01'
ORDER BY a.datumzeit_ist_an;