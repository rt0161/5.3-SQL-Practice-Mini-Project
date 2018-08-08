SELECT name, monthlymaintenance, 
	CASE WHEN monthlymaintenance > 100 THEN 'expensive'
		       ELSE 'cheap' END AS label
	FROM Facilities
	