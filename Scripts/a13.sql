set @userLAT=47.402072;set @userLNG=8.534989;

SELECT h.halt_punkt_id, h2.halt_lang, h.GPS_Latitude as lat, h.GPS_Longitude as lng,
ROUND(ST_Distance_Sphere(point(@userLNG , @userLAT), point(h.GPS_Longitude , h.GPS_Latitude)),2) as distanz
FROM haltepunkt h
LEFT JOIN Haltestelle h2 ON h.halt_id = h2.halt_id
WHERE h.GPS_Latitude IS NOT NULL
ORDER BY distanz ASC
LIMIT 4;