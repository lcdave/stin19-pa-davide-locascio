use vbzdat;

SELECT hh.halt_lang as von, h2h.halt_lang as nach, h.GPS_Latitude as vonLAT, h.GPS_Longitude as vonLNG,
h2.GPS_Latitude as nachLAT, h2.GPS_Longitude as nachLNG,
ROUND(ST_Distance_Sphere(point(h.GPS_Longitude , h.GPS_Latitude), point(h2.GPS_Longitude , h2.GPS_Latitude)),2) as distanz
FROM fahrzeiten_soll_ist fsi
LEFT JOIN haltepunkt h ON h.halt_punkt_id = fsi.halt_punkt_id_von
LEFT JOIN Haltestelle hh on h.halt_id = hh.halt_id 
LEFT JOIN haltepunkt h2 ON h2.halt_punkt_id = fsi.halt_punkt_id_nach
LEFT JOIN Haltestelle h2h on h2.halt_id = h2h.halt_id 
WHERE fsi.linie = 5 AND fsi.fahrt_id = 713 AND DATE(fsi.datumzeit_ist_an_von) = '2021-01-01'
ORDER BY distanz ASC;