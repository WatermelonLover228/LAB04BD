CREATE VIEW data.region_countries AS
	  SELECT r.identifier AS iden,
    r.description AS region,
    count(c.identifier) AS countries
   FROM data.regions r
     LEFT JOIN data.countries c ON r.identifier = c.region
  GROUP BY r.description, r.identifier;
