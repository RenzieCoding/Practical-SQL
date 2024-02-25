SELECT geo_name,
       state_us_abbreviation AS "st",
       p0010001 AS "Total Population",
       p0010003 AS "White Alone",
       p0010004 AS "Black or African American Alone",
       p0010005 AS "Am Indian/Alaska Native Alone",
       p0010006 AS "Asian Alone",
       p0010007 AS "Native Hawaiian and Other Pacific Islander Alone",
       p0010008 AS "Some Other Race Alone",
       p0010009 AS "Two or More Races"
FROM us_counties_2010;


SELECT geo_name,
		state_us_abbreviation AS "st",
		p0010003 AS "White Alone",
		p0010004 AS "Black Alone",
		p0010003 + p0010004 AS "Total White and Black"
FROM us_counties_2010;


SELECT geo_name,
	state_us_abbreviation AS "st",
	p0010001 AS "Total",
	p0010003 + p0010004 + p0010005 + p0010006 + p0010007 
	+ p0010008 + p0010009 AS "All Races",
	(p0010003 + p0010004 + p0010005 + p0010006 + p0010007
	+ p0010008 + p0010009)  - p0010001 AS "Difference" 
FROM us_counties_2010
ORDER BY "Difference" DESC;     
	
SELECT geo_name,
	 	state_us_abbreviation AS "st",
		(CAST(p0010006 AS numeric(8,1)) / p0010001) * 100 AS "pct_asian"
FROM us_counties_2010
ORDER BY "pct_asian" DESC;
	
CREATE TABLE percent_change (
	department VARCHAR (20),
	spend_2014 NUMERIC(10,2),
	spend_2017 NUMERIC(10,2)
);

INSERT INTO percent_change
VALUES
	('Buidling', 250000, 289000),
	('Assessor',178556,179500),
	('Library',87777,90001),
	('Clerk', 451980, 650000),
	('Police',250000, 223000),
	('Recreation', 199000, 195000);

SELECT department,
	   spend_2014,
	   spend_2017,
	  round((spend_2017 - spend_2014) / spend_2014 * 100, 1) AS "pct_change"
FROM percent_change;

SELECT SUM(p0010001) AS "County Sum",
		ROUND(AVG(p0010001),0) AS "County Average"
FROM US_counties_2010


SELECT * FROM us_counties_2010

DELETE FROM us_counties_2010

SELECT * FROM us_counties_2010

COPY us_counties_2010
FROM 'C:\Users\Asus\Desktop\Practical SQL\practical-sql-main\Chapter_04\us_counties_2010.csv'
WITH (FORMAT CSV, HEADER);