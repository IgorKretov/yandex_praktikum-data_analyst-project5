SELECT
    COUNT (flights.flight_id) AS flights_amount,
    CASE
        WHEN model  LIKE 'Boeing%' THEN 'Boeing'
        WHEN model  LIKE 'Airbus%' THEN 'Airbus'
        ELSE 'other'
    END AS type_aircraft
FROM
    aircrafts
INNER JOIN flights ON flights.aircraft_code = aircrafts.aircraft_code
WHERE
    CAST (flights.departure_time AS date) >= '2018-09-01' AND
    CAST (flights.departure_time AS date) <= '2018-09-30'
GROUP BY
    type_aircraft