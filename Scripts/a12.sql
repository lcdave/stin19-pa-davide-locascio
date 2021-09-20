use vbzdat;

SELECT a.fahrt_id as Fahrt, h2.halt_lang as Haltestelle, TIME_FORMAT(TIME(a.datumzeit_soll_ab),'%H:%i:%s') as Abfahrtzeit
FROM ankunftszeiten a
LEFT JOIN linie l on l.fahrweg_id = a.fahrweg_id
LEFT JOIN haltepunkt h ON h.halt_punkt_id = a.haltepunkt_id
LEFT JOIN Haltestelle h2 ON h2.halt_id = h.halt_id
WHERE l.linie = 5 and DATE(datumzeit_soll_ab) = '2021-01-1' AND a.fahrt_id = 713
ORDER BY a.fahrt_id, a.datumzeit_soll_ab ASC;