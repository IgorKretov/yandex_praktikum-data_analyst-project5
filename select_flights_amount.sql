SELECT
    aircrafts.model AS model,
    COUNT (flights.flight_id) AS flights_amount
FROM
    flights
INNER JOIN aircrafts ON flights.aircraft_code = aircrafts.aircraft_code
WHERE
    (flights.departure_time :: date) >= '2018-09-01' AND
    (flights.departure_time :: date) <= '2018-09-30'
GROUP BY
    model