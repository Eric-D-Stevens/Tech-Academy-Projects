-- Databas Name: db_FinalProject
USE db_FinalProject

-- TABLE CREATION --

-- LIBRARY_BRANCH table has no constraints
CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50),
	TheAddress VARCHAR(50)
);

-- BORROWER table has no constraints
CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	The_Name VARCHAR(50),
	The_Address VARCHAR(50),
	Phone VARCHAR (50)
);

-- PUBLISHER table has no constraints
CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL
	The_Address VARCHAR(50),
	Phone VARCHAR (50)
);

-- BOOKS table has a constraint from PUBLISHER table
CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50),
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_books_publishername FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

-- BOOK_AUTHORS table has a constraint from BOOKS table
CREATE TABLE BOOK_AUTHOR (
	BookID INT NOT NULL CONSTRAINT fk_book_author_bookid FOREIGN KEY BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50)
);


-- BOOK_COPIES table has constraints from LIBRARY_BRANCH and BOOKS tables
CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_book_copies_bookid FOREIGN KEY BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_book_copies_branchid FOREIGN KEY LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

-- BOOK_LOANS table has constraints from LIBRARY_BRANCH, BOOKS, and BORROWER tables
CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_book_loans_bookid FOREIGN KEY BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_book_loans_branchid FOREIGN KEY LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_book_loans_cardno FOREIGN KEY BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL

);

