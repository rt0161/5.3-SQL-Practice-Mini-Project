SELECT facid, name, membercost, monthlymaintenance  
	FROM Facilities
	WHERE membercost > 0.0 AND (membercost/monthlymaintenance)<0.2