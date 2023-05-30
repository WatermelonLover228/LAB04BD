CREATE VIEW data.sample_stat AS
SELECT
	c.identifier,
	c.description,
	MIN(m.mark) AS min_date,
	MAX(m.mark) AS max_date,
	MIN((m.temperature - 32) * 5/9) AS min_temperature_celsius,
	MAX((m.temperature - 32) * 5/9) AS max_temperature_celsius,
	AVG((m.temperature - 32) * 5/9) AS avg_temperature_celsius,
	COUNT(*) AS measurement_count
FROM
	data.cities c
JOIN
	data.measurement m ON c.identifier = m.city
WHERE
	m.temperature > -99 * 5/9 -- Фаренгейт в Цельсии
GROUP BY
	c.identifier, c.description;
