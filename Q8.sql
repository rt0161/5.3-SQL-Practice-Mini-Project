SELECT CONCAT(m.firstname, ' ', m.surname) AS "name of member",
       f.name AS "name of facility",
	   (f.membercost * b.slots) AS cost
	FROM Facilities f
		JOIN Bookings b
			ON f.facid = b.facid
		JOIN Members m
			ON b.memid = m.memid
	WHERE (f.membercost*b.slots) >  30
	AND  m.memid >0
	AND  b.starttime LIKE '2012-09-14%'
UNION
SELECT m.firstname AS "name of member",
     f.name AS "name of facility",
	(f.guestcost * b.slots) AS cost
	FROM Facilities f
		JOIN Bookings b
			ON f.facid = b.facid
		JOIN Members m
			ON b.memid = m.memid
	WHERE (f.guestcost*b.slots) >  30
	AND  m.memid = 0
	AND  b.starttime LIKE '2012-09-14%'
	ORDER BY cost DESC
