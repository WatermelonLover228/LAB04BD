CREATE VIEW data.country_cities AS
SELECT
 SELECT co.description AS country,
    count(ci.identifier) AS cities
   FROM data.countries co
     LEFT JOIN data.cities ci ON co.identifier = ci.country
  GROUP BY co.description;
