-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

SELECT * FROM Books WHERE Barcode IN (2855934983, 4043822646); 
--11, 93
SELECT * FROM Loans WHERE BookID IN (11, 93);

SELECT * FROM Patrons WHERE Email = 'jvaan@wisdompets.com';
--50

INSERT INTO Loans
(BookID, PatronID, LoanDate, DueDate)
VALUES(11, 50, '2022-08-25','2022-09-8'), (93, 50, '2022-08-25','2022-09-8');

SELECT Patrons.FirstName, Patrons.LastName, Patrons.PatronID, Loans.PatronID 
FROM Patrons
JOIN Loans ON Patrons.PatronID = Loans.PatronID
WHERE Patrons.PatronID = 50;


-- Another Solution

INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES (
  (SELECT BookID 
    FROM Books 
    WHERE Barcode = '2855934983'), 
  (SELECT PatronID 
    FROM Patrons 
    WHERE Email = 'jvaan@wisdompets.com'),
  '2022-08-25',
  '2022-09-08');

INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES (
  (SELECT BookID 
    FROM Books 
    WHERE Barcode = '4043822646'), 
  (SELECT PatronID 
    FROM Patrons 
    WHERE Email = 'jvaan@wisdompets.com'), 
  '2022-08-25', 
  '2022-09-08');

SELECT * 
FROM Loans 
JOIN Books ON Loans.BookID = Books.BookID 
WHERE PatronID = (
  SELECT PatronID 
  FROM Patrons 
  WHERE Email = 'jvaan@wisdompets.com');

