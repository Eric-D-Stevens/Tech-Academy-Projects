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
BooksInBranch 


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
BooksInEachBranch 


-- 3.) Retrieve the names of all borrowers who do not have any books checked out.
CREATE PROC NoBooks
AS
SELECT
	BORROWER.The_Name, BORROWER.CardNo
	FROM BORROWER
	WHERE BORROWER.CardNo NOT IN (SELECT BOOK_LOANS.CardNo FROM BOOK_LOANS)
-- Execute
NoBooks


-- 4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
SELECT 
	bk.Title, br.The_Name, br.The_Address, lb.BranchName
	FROM BOOK_LOANS bl
	INNER JOIN LIBRARY_BRANCH lb ON lb.BranchID = bl.BranchID
	INNER JOIN BOOKS bk ON bk.BookID = bl.BookID
	INNER JOIN BORROWER br ON br.CardNo = bl.CardNo
	WHERE bl.DateDue = (select convert(date,getdate()))
	AND bl.BranchID = (SELECT lb.BranchID WHERE lb.BranchName = 'Sharptown')





