SELECT
    city,
    AVG (average_flights) AS average_flights
FROM
    (
        SELECT
            airports.city,
            COUNT (flights.flight_id) AS average_flights,
            EXTRACT (DAY FROM flights.arrival_time) AS arrival_day
        FROM
            flights
        INNER JOIN airports ON airports.airport_code = flights.arrival_airport
        WHERE
            CAST (flights.arrival_time AS DATE) BETWEEN '2018-08-01' AND '2018-08-31'
        GROUP BY
            city,
            arrival_day
    ) AS subq
GROUP BY
    city