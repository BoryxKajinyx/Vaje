/*
  Vaje za jadralci
*/
-- 1.
SELECT ime
FROM coln c
WHERE NOT EXISTS 
  (SELECT j.jid
  FROM jadralec j
  EXCEPT
  SELECT r.jid
  FROM rezervacija r
  WHERE r.cid = c.cid);
-- 2.
SELECT ime
FROM coln
WHERE dolzina>35 AND
	barva=ALL(
    SELECT barva
    FROM coln
    WHERE dolzina>35);
-- 3.
SELECT ime
FROM coln
WHERE dolzina>35 AND
	barva = (SELECT GROUP_CONCAT(distinct barva)
			FROM coln
            WHERE dolzina>35);
-- 4,
SELECT cid, ime, count(*)
FROM coln NATURAL JOIN rezervacija
GROUP BY cid, ime;
-- 5.
SELECT ime, jadralec.jid jid,  count(cid) rezervacije
FROM jadralec left join rezervacija on jadralec.jid=rezervacija.jid
group by ime,jid
order by rezervacije desc, ime asc;
