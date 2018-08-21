USE db_FinalProject

-- 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
CREATE PROC BooksInBranch @title VARCHAR(50) = 'The Lost Tribe', @branch VARCHAR(50) = 'Sharptown'
AS
Select
	b.Title, lb.BranchName, bc.Number_of_Copies
	FROM BOOK_COPIES bc
	INNER JOIN BOOKS b ON b.BookID = bc.BookID
	INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bc.BranchID
	WHERE b.Title = @title AND lb.BranchName = @branch
-- Execute with defaults set to 'The Lost Tribe' and 'Sharptown'
EXEC BooksInBranch 


-- 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?
CREATE PROC BooksInEachBranch @title VARCHAR(50) = 'The Lost Tribe'
AS
Select
	b.Title, lb.BranchName, bc.Number_of_Copies
	FROM BOOK_COPIES bc
	INNER JOIN BOOKS b ON b.BookID = bc.BookID
	INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bc.BranchID
	WHERE b.Title = @title
-- Execute with defaults set to 'The Lost Tribe'
EXEC BooksInEachBranch 


-- 3.) Retrieve the names of all borrowers who do not have any books checked out.
CREATE PROC NoBooks
AS
SELECT
	BORROWER.The_Name, BORROWER.CardNo
	FROM BORROWER
	WHERE BORROWER.CardNo NOT IN (SELECT BOOK_LOANS.CardNo FROM BOOK_LOANS)
-- Execute
EXEC NoBooks


-- 4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
CREATE PROC DueToday @branch VARCHAR(50) = 'Sharptown'
AS
SELECT 
	bk.Title, br.The_Name, br.The_Address, lb.BranchName
	FROM BOOK_LOANS bl
	INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bl.BranchID
	INNER JOIN BOOKS bk ON bk.BookID = bl.BookID
	INNER JOIN BORROWER br ON br.CardNo = bl.CardNo
	WHERE bl.DateDue = (SELECT CONVERT(DATE,GETDATE()))
	AND bl.BranchID = (SELECT lb.BranchID WHERE lb.BranchName = @branch)
-- Execute with default 'Sharptown'
EXEC DueToday



-- 5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
CREATE PROC LoansFromBranches
AS
SELECT
	lb.BranchName, COUNT(bl.BookID) 
	FROM BOOK_LOANS bl
	INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bl.BranchID
	GROUP BY BranchName
-- Execute
EXEC LoansFromBranches


-- 6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
CREATE PROC MoreThan5BooksOut
AS
SELECT
	br.The_Name, br.The_Address, COUNT(bl.BookID) AS Book_Count
	FROM BOOK_LOANS bl
	INNER JOIN BORROWER br ON br.CardNo = bl.CardNo 
	GROUP BY The_Name, The_Address
	HAVING COUNT(bl.BookID)> 5
-- Execute
EXEC MoreThan5BooksOut

-- 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
CREATE PROC SKatCentral
AS
SELECT
	lb.BranchName, ba.AuthorName, bk.Title, bc.Number_Of_Copies
	FROM BOOK_COPIES bc
	INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bc.BranchID
	INNER JOIN BOOK_AUTHOR ba ON ba.BookID = bc.BookID
	INNER JOIN BOOKS bk ON bk.BookID = bc.BookID
	WHERE lb.BranchName = 'Central'
	AND ba.AuthorName = 'Stephen King'
-- Execute
EXEC SKatCentral
