SELECT sub.name AS "name of facility", 
       SUM(sub.earn) AS revenue
	   FROM (
			SELECT f.name AS name,
				   CASE WHEN b.memid > 0 THEN f.membercost * b.slots
						WHEN b.memid = 0 THEN f.guestcost * b.slots END AS earn,
				   f.facid AS facilityID		 
			FROM Bookings b
				JOIN Facilities f
			      ON b.facid = f.facid
				JOIN Members m
				  ON b.memid = m.memid
		     )sub
	GROUP BY 1 HAVING SUM(sub.earn) < 1000
	ORDER BY 2 DESC


	