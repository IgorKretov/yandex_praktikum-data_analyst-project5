SELECT
    SUBQ1.week_number, 
    SUBQ1.ticket_amount, 
    SUBQ1.festival_week, 
    SUBQ1.festival_name  
FROM (
    (
        SELECT
            EXTRACT(week from flights.departure_time) AS week_number,
            COUNT(ticket_flights.ticket_no) AS ticket_amount
        FROM
            flights
                INNER JOIN airports ON airports.airport_code = flights.arrival_airport
                INNER JOIN ticket_flights ON ticket_flights.flight_id = flights.flight_id
        WHERE
            (flights.departure_time :: date) BETWEEN '2018-07-23' AND '2018-09-30' AND 
            airports.city = 'Москва'
        GROUP BY
            week_number
    ) AS SUBQ2 LEFT JOIN
    (
        SELECT
            festivals.festival_name AS festival_name,
            EXTRACT (WEEK from (festivals.festival_date :: date)) AS festival_week
        FROM
            festivals
        WHERE
            (festivals.festival_date :: date) BETWEEN '2018-07-23' AND '2018-09-30'
            AND festival_city  = 'Москва'
    ) AS SUBQ3 ON SUBQ2.week_number = SUBQ3.festival_week 
) AS SUBQ1;
