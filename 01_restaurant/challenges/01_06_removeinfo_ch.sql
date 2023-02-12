-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.
SELECT *
FROM Customers
WHERE FirstName="Norby"

DELETE
FROM Reservations
WHERE ReservationID=2000

SELECT *
FROM Reservations
WHERE CustomerID=64

--or
UPDATE Reservations
SET Date = NULL 
WHERE ReservationID = 2000;