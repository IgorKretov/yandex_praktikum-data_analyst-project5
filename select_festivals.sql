SELECT
    festival_name,
    EXTRACT (WEEK FROM festival_date) AS festival_week
FROM
    festivals
WHERE
    festival_city = 'Москва' AND
    festival_date :: date BETWEEN '2018-07-23' AND '2018-10-01'