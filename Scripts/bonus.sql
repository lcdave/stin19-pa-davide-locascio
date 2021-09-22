SELECT h4.halt_lang FROM (
	SELECT fsi.halt_id_nach 
	FROM fahrzeiten_soll_ist fsi
	WHERE fsi.halt_id_von IN (
		SELECT h.halt_id 
		FROM ankunftszeiten a
		LEFT JOIN haltepunkt h ON h.halt_punkt_id = a.haltepunkt_id
		LEFT JOIN Haltestelle h2 ON h2.halt_id = h.halt_id
		WHERE h.GPS_Latitude = '47.396093' AND h.GPS_Longitude = '8.545106'
		GROUP BY h.halt_id
	)
	AND fsi.richtung = 1
	GROUP BY fsi.halt_id_nach
) as s1
LEFT JOIN haltepunkt h3 ON h3.halt_id = s1.halt_id_nach
LEFT JOIN Haltestelle h4 on h4.halt_id = h3.halt_id
WHERE h4.halt_lang NOT LIKE '%DEPOT%'
GROUP BY h4.halt_lang;
