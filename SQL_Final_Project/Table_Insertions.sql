USE db_FinalProject

-- LIBRARY_BRANCH has no constraints
-- There is a library branch called 'Sharpstown' and one called 'Central'.
-- There are at least 4 branches in the LIBRARY_BRANCH table.
INSERT INTO LIBRARY_BRANCH(BranchName, TheAddress)
	VALUES
		('Sharptown','123 Fake St. Portland OR'),
		('Central','321 Ekaf Ln. Portland OR'),
		('Uptown','999 Broadway Portland OR'),
		('Downtown','888 4th St. Portaland OR')
;

-- BORROWER has no constraints
-- There are at least 8 borrowers in the BORROWER table
INSERT INTO BORROWER(The_Name, The_Address, Phone)
	VALUES
		('Bob Dole','412 10ths st Portland OR','111-222-3333'),
		('Elizebeth Warren','5473 15th st Portland OR','655-334-1264'),
		('Bernie Sanders','2342 OnePercent rd Portland OR','420-420-2400'),
		('Hillary Clinton','86 Server way Portland','868-686-8686'),
		('Barak Obama','123 Out st Portland OR','444-444-4444'),
		('George Bush Sr.','Quarter Drop Manner Dallas Texas','777-777-7777'),
		('Collen Powel','44 WhatDoctrine ct. Portland OR','345-345-8765'),
		('Robert Muller','999 Catchem Rd','098-765-4321')
;

-- PUBLISHER has no constraints
INSERT INTO PUBLISHER(PublisherName, The_Address, Phone)
	VALUES
		('Red','123 Red st New York NY','123-123-1234'),
		('Blue','098 Blue st Portland OR','999-999-999'),
		('Yellow','888 Yellow st Los Angelel CA','444-222-0000'),
		('Green','88 Green st Chicago IL','253-562-4231')
;


-- BOOKS table has a constraint from PUBLISHER table
-- There is a book called 'The Lost Tribe' found in the 'Sharpstown' branch
-- There are at least 20 books in the BOOK table
-- There must be at least two books written by 'Stephen King'
INSERT INTO BOOKS(Title, PublisherName)
	VALUES
		('The Lost Tribe','Red'), --1
		('Last Man Standing','Red'), --2
		('Into the Dark','Red'), --3
		('Hitch Slap','Red'), --4
		('No One Left to Lie To','Red'), --5
		('Blowing In the Wind','Blue'), --6
		('The Gene','Blue'), --7
		('Homo Deus','Blue'), -- 8
		('Principia','Blue'), -- 9
		('Origin of Species','Blue'), -- 10
		('Living With the Tigers','Yellow'), -- 11
		('The God Dilusion','Yellow'), -- 12
		('The Elegant Universe','Yellow'), -- 13
		('Sapiens','Yellow'), -- 14
		('Blink','Yellow'), -- 15
		('And Then There Were None','Green'), -- 16
		('Outliers','Green'), -- 17
		('Catch 22','Green') -- 18
		('Fabric of the Cosmos','Green'), -- 19
		('Private Parts','Green') -- 20
;

-- BOOK_AUTHORS table has a constraint from BOOKS table
-- There are at least 10 authors in the BOOK_AUTHORS table.
-- There must be at least two books written by 'Stephen King'
INSERT INTO BOOK_AUTHOR(BookID, AuthorName)
	VALUES
		(1, 'Stephen King'),
		(2, 'Stephen King'),
		(3, 'Stephen King'),
		(15, 'Malcom Gladwell'),
		(17, 'Malcom Gladwell'),
		(8, 'Noah Harari'),
		(14, 'Noah Harari'),
		(7,'Sidartha Mukergee'),
		(11, 'Claud Bawls'),
		(6, 'I.P. Freely'),
		(16, 'Agatha Christie'),
		(13, 'Brian Greene'),
		(19, 'Brian Greene'),
		(4, 'Christopher Hitchens'),
		(5, 'Christopher Hitchens'),
		(12, 'Richard Dawkins'),
		(9,'Issac Newton'),
		(10, 'Charles Darwin'),
		(18, 'Sum Dewd'),
		(20, 'Howard Stern')
;

-- BOOK_COPIES table has constraints from LIBRARY_BRANCH and BOOKS tables
-- Each library branch has at least 10 book titles, and at least two copies of each of those titles.
INSERT INTO BOOK_COPIES(BookID, BranchID, Number_Of_Copies)
	VALUES
		-- 10 coppies of each book at each branch
		-- Branch 1
		(1,1,10),
		(2,1,10),
		(3,1,10),
		(4,1,10),
		(5,1,10),
		(6,1,10),
		(7,1,10),
		(8,1,10),
		(9,1,10),
		(10,1,10),
		(11,1,10),
		(12,1,10),
		(13,1,10),
		(14,1,10),
		(15,1,10),
		(16,1,10),
		(17,1,10),
		(18,1,10),
		(19,1,10),
		(20,1,10),
		-- Branch 2
		(1,2,10),
		(2,2,10),
		(3,2,10),
		(4,2,10),
		(5,2,10),
		(6,2,10),
		(7,2,10),
		(8,2,10),
		(9,2,10),
		(10,2,10),
		(11,2,10),
		(12,2,10),
		(13,2,10),
		(14,2,10),
		(15,2,10),
		(16,2,10),
		(17,2,10),
		(18,2,10),
		(19,2,10),
		(20,2,10),
		-- Branch 3
		(1,3,10),
		(2,3,10),
		(3,3,10),
		(4,3,10),
		(5,3,10),
		(6,3,10),
		(7,3,10),
		(8,3,10),
		(9,3,10),
		(10,3,10),
		(11,3,10),
		(12,3,10),
		(13,3,10),
		(14,3,10),
		(15,3,10),
		(16,3,10),
		(17,3,10),
		(18,3,10),
		(19,3,10),
		(20,3,10),
		-- Branch 4
		(1,4,10),
		(2,4,10),
		(3,4,10),
		(4,4,10),
		(5,4,10),
		(6,4,10),
		(7,4,10),
		(8,4,10),
		(9,4,10),
		(10,4,10),
		(11,4,10),
		(12,4,10),
		(13,4,10),
		(14,4,10),
		(15,4,10),
		(16,4,10),
		(17,4,10),
		(18,4,10),
		(19,4,10),
		(20,4,10)
;

-- BOOK_LOANS table has constraints from LIBRARY_BRANCH, BOOKS, and BORROWER table
--  at least 2 of those borrowers have more than 5 books loaned to them.
-- There are at least 50 loans in the BOOK_LOANS table.
INSERT INTO BOOK_LOANS(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
		-- Borrower 1 > 5
		(1,4,1,'2018-08-17','2018-12-17'),
		(2,2,1,'2018-08-17','2018-12-17'),
		(3,3,1,'2018-08-17','2018-12-17'),
		(4,1,1,'2018-08-17','2018-12-17'),
		(5,1,1,'2018-08-17','2018-12-17'),
		(6,1,1,'2018-08-17','2018-12-17'),
		-- Borrower 2 > 5
		(6,3,2,'2018-08-17','2018-12-17'),
		(7,3,2,'2018-08-17','2018-12-17'),
		(8,2,2,'2018-08-17','2018-12-17'),
		(9,2,2,'2018-08-17','2018-12-17'),
		(5,2,2,'2018-08-17','2018-12-17'),
		(4,2,2,'2018-08-17','2018-12-17'),
		-- Borrower 4 >> 5
		(1,3,4,'2018-08-17','2018-12-17'),
		(2,3,4,'2018-08-17','2018-12-17'),
		(3,3,4,'2018-08-17','2018-12-17'),
		(4,3,4,'2018-08-17','2018-12-17'),
		(5,4,4,'2018-08-17','2018-12-17'),
		(6,4,4,'2018-08-17','2018-12-17'),
		(7,2,4,'2018-08-17','2018-12-17'),
		(8,4,4,'2018-08-17','2018-12-17'),
		(9,2,4,'2018-08-17','2018-12-17'),
		(10,2,4,'2018-08-17','2018-12-17'),
		(11,2,4,'2018-08-17','2018-12-17'),
		(12,2,4,'2018-08-17','2018-12-17'),
		(13,1,4,'2018-08-17','2018-12-17'),
		(14,1,4,'2018-08-17','2018-12-17'),
		(15,1,4,'2018-08-17','2018-12-17'),
		(16,2,4,'2018-08-17','2018-12-17'),
		(17,2,4,'2018-08-17','2018-12-17'),
		(18,2,4,'2018-08-17','2018-12-17'),
		-- Borrower 5 < 5
		(17,1,5,'2018-08-17','2018-12-17'),
		(15,4,5,'2018-08-17','2018-12-17'),
		(20,4,5,'2018-08-17','2018-12-17'),
		-- Borrower 7 < 5
		(12,3,7,'2018-08-17','2018-12-17'),
		(13,3,7,'2018-08-17','2018-12-17'),
		(14,3,7,'2018-08-17','2018-12-17'),
		-- Borrower 8 >> 5
		(1,4,8,'2018-08-17','2018-12-17'),
		(2,4,8,'2018-08-17','2018-12-17'),
		(3,4,8,'2018-08-17','2018-12-17'),
		(4,4,8,'2018-08-17','2018-12-17'),
		(5,4,8,'2018-08-17','2018-12-17'),
		(6,4,8,'2018-08-17','2018-12-17'),
		(7,3,8,'2018-08-17','2018-12-17'),
		(8,3,8,'2018-08-17','2018-12-17'),
		(9,3,8,'2018-08-17','2018-12-17'),
		(10,2,8,'2018-08-17','2018-12-17'),
		(11,3,8,'2018-08-17','2018-12-17'),
		(12,3,8,'2018-08-17','2018-12-17'),
		(13,3,8,'2018-08-17','2018-12-17'),
		(14,3,8,'2018-08-17','2018-12-17'),
		(15,3,8,'2018-08-17','2018-12-17'),
		(16,3,8,'2018-08-17','2018-12-17'),
		(17,2,8,'2018-08-17','2018-12-17'),
		(18,2,8,'2018-08-17','2018-12-17')
;
