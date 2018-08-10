SELECT DISTINCT (sub.n_member) AS "name of member",
	   sub.name AS "name of facility",
	   sub.cost AS cost
	FROM (
		  SELECT f.name AS name,
			 b.starttime AS starttime,
	                 CONCAT(m.firstname, ' ', m.surname) AS n_member,
	                 CASE WHEN m.memid > 0 THEN (f.membercost * b.slots)
			      WHEN m.memid =0 THEN (f.guestcost*b.slots) END AS cost
			FROM Facilities f
				JOIN Bookings b
					ON f.facid = b.facid
				JOIN Members m
					ON b.memid = m.memid
		   )sub
	WHERE sub.cost >30 
	AND sub.starttime LIKE '2012-09-14%'
	ORDER By sub.cost DESC
