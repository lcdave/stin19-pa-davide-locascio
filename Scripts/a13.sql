use vbzdat;

# Fuer die Ausgabe
set @userLAT=47.3977314;set @userLNG=8.5451337;

SELECT h2.halt_lang, h.GPS_Latitude as lat, h.GPS_Longitude as lng,
'#ff0000' as color,
CONCAT (TIME_FORMAT(TIME(a.datumzeit_ist_an),'%H:%i:%s'), " " , h2.halt_lang) as note,
ROUND(ST_Distance_Sphere(point(@userLNG , @userLAT), point(h.GPS_Longitude , h.GPS_Latitude)),2) as distanz
FROM ankunftszeiten a
LEFT JOIN haltepunkt h ON h.halt_punkt_id = a.haltepunkt_id
LEFT JOIN Haltestelle h2 ON h.halt_id = h2.halt_id
WHERE h.GPS_Latitude IS NOT NULL AND a.fahrt_id = 713 AND DATE(a.datumzeit_ist_an) = '2021-01-1'
ORDER BY distanz ASC
LIMIT 4;

# Fuer CSV Export
set @userLAT=47.3977314;set @userLNG=8.5451337;
CREATE TABLE next4
SELECT h2.halt_lang, h.GPS_Latitude as lat, h.GPS_Longitude as lng,
'#ff0000' as color,
CONCAT (TIME_FORMAT(TIME(a.datumzeit_ist_an),'%H:%i:%s'), " " , h2.halt_lang) as note,
ROUND(ST_Distance_Sphere(point(@userLNG , @userLAT), point(h.GPS_Longitude , h.GPS_Latitude)),2) as distanz
FROM ankunftszeiten a
LEFT JOIN haltepunkt h ON h.halt_punkt_id = a.haltepunkt_id
LEFT JOIN Haltestelle h2 ON h.halt_id = h2.halt_id
WHERE h.GPS_Latitude IS NOT NULL AND a.fahrt_id = 713 AND DATE(a.datumzeit_ist_an) = '2021-01-1'
ORDER BY distanz ASC
LIMIT 4;