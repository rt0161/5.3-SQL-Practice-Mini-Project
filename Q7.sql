SELECT DISTINCT f.name,
	   (m.firstname || ' ' || m.surname) AS member_name 
	FROM Facilities f
		JOIN Bookings b
			ON f.facid = b.facid
		JOIN Members m
			ON b.memid = m.memid
	WHERE (b.memid > 0) AND (b.facid BETWEEN 0 AND 1)
	ORDER BY m.firstname, m.surname