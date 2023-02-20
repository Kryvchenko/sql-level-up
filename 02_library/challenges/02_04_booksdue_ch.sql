-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

SELECT Patrons.FirstName, Patrons.Email, Patrons.PatronID + Loans.PatronID AS PersonID, Loans.ReturnedDate, Loans.DueDate, Loans.BookID + Books.BookID AS ID
FROM Patrons
INNER JOIN Loans ON Loans.PatronID = Patrons.PatronID
INNER JOIN Books ON Books.BookID = Loans.BookID
WHERE Loans.DueDate = '2022-07-13'
AND Loans.ReturnedDate IS NULL;

-- Another Solution

SELECT Loans.DueDate, Books.Title, Patrons.FirstName, Patrons.Email
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
JOIN Patrons ON Loans.PatronID = Patrons.PatronID
WHERE Loans.DueDate = '2022-07-13' 
AND Loans.ReturnedDate IS NULL;

