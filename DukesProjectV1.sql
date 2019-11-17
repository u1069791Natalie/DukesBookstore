FLUSH PRIVILEGES;
CREATE USER `duke` @`localhost`
   IDENTIFIED BY 'Password1234'
   REQUIRE NONE
   WITH MAX_QUERIES_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT GRANT OPTION ON *.* TO `duke` @`localhost`;
GRANT SELECT ON *.* TO `duke` @`localhost`;
GRANT INSERT ON *.* TO `duke` @`localhost`;
GRANT UPDATE ON *.* TO `duke` @`localhost`;
GRANT DELETE ON *.* TO `duke` @`localhost`;
GRANT EXECUTE ON *.* TO `duke` @`localhost`;
GRANT CREATE ON *.* TO `duke` @`localhost`;
GRANT CREATE ROUTINE ON *.* TO `duke` @`localhost`;
GRANT CREATE TABLESPACE ON *.* TO `duke` @`localhost`;
GRANT CREATE TEMPORARY TABLES ON *.* TO `duke` @`localhost`;
GRANT CREATE USER ON *.* TO `duke` @`localhost`;
GRANT CREATE VIEW ON *.* TO `duke` @`localhost`;
GRANT EVENT ON *.* TO `duke` @`localhost`;
GRANT INDEX ON *.* TO `duke` @`localhost`;
GRANT TRIGGER ON *.* TO `duke` @`localhost`;
GRANT DROP ON *.* TO `duke` @`localhost`;
GRANT ALTER ON *.* TO `duke` @`localhost`;
GRANT ALTER ROUTINE ON *.* TO `duke` @`localhost`;
GRANT REFERENCES ON *.* TO `duke` @`localhost`;
GRANT LOCK TABLES ON *.* TO `duke` @`localhost`;
GRANT PROCESS ON *.* TO `duke` @`localhost`;
GRANT SHOW VIEW ON *.* TO `duke` @`localhost`;
GRANT SHOW DATABASES ON *.* TO `duke` @`localhost`;
GRANT FILE ON *.* TO `duke` @`localhost`;
GRANT RELOAD ON *.* TO `duke` @`localhost`;
GRANT SHUTDOWN ON *.* TO `duke` @`localhost`;
GRANT SUPER ON *.* TO `duke` @`localhost`;
GRANT REPLICATION CLIENT ON *.* TO `duke` @`localhost`;
GRANT REPLICATION SLAVE ON *.* TO `duke` @`localhost`;
GRANT ALL PRIVILEGES ON *.* TO `duke` @`localhost`;
GRANT USAGE ON *.* TO `duke` @`localhost`;
FLUSH PRIVILEGES;


create database dukes_books;

use dukes_books;

create table Category (
CategoryId INT AUTO_INCREMENT PRIMARY KEY,/*mariaDb saves names of PKs as 'PRIMARY' so no need to add in constraints statement*/
Description VARCHAR(100)
);

create table SubCategory (
SubCategoryId INT AUTO_INCREMENT PRIMARY KEY,
CategoryId INT,
Description VARCHAR(100),
CONSTRAINT FK_SubCategory_CategoryId FOREIGN KEY (CategoryId) REFERENCES Category (CategoryId)
);

create table Book (
BookId INT AUTO_INCREMENT PRIMARY KEY,
Isbn VARCHAR(100),
Surname VARCHAR(100), 
Firstname VARCHAR(100), 
Title VARCHAR(100) NOT NULL,
Price DOUBLE(10,2), 
Onsale BIT, 
CalendarYear INT,
Description VARCHAR(100), 
Inventory INT,
SubCategoryId INT, 
CONSTRAINT FK_SubCategory_SubCategoryId FOREIGN KEY (SubCategoryId) REFERENCES SubCategory (SubCategoryId)
);

create table users (
UserId INT AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR(100) UNIQUE,
Password VARCHAR(100),
FisrtName VARCHAR(100),
LastName VARCHAR(100),
Street VARCHAR(100),
Suburb VARCHAR(100),
City VARCHAR(100),
Country VARCHAR(100),
PostCode VARCHAR(100),
Phone VARCHAR(100),
PhoneMobile VARCHAR(100),
IsAdmin BIT
);


create table user_groups (
email VARCHAR(100) PRIMARY KEY,
groupname VARCHAR(100)
);

create table Orders (
OrderId INT AUTO_INCREMENT PRIMARY KEY,
UserId INT NOT NULL,
OrderDate DATETIME NOT NULL,
SalePrice DOUBLE(10,2),
SaleShipping DOUBLE(10,2),
SaleGST DOUBLE(10,2),
SaleTotal DOUBLE(10,2),
NumOfItems INT,
SaleType VARCHAR(3),
CONSTRAINT FK_Orders_UserId FOREIGN KEY (UserId) REFERENCES users (UserId)
);

create table SaleItems (
SaleItemId INT AUTO_INCREMENT PRIMARY KEY,
OrderId INT NOT NULL,
ItemId INT NOT NULL,
Quantity INT,
Price DOUBLE(10,2),
ItemType VARCHAR(10), 
CONSTRAINT FK_Orders_OrderId FOREIGN KEY (OrderId) REFERENCES Orders (OrderId)
);


create table Fees (
FeeId INT AUTO_INCREMENT PRIMARY KEY,
Descrption VARCHAR(100),
Percent INT,
FlatFee INT
);

create table UserSaleItems (
UserSaleItemId INT AUTO_INCREMENT PRIMARY KEY,
UserId INT NOT NULL,
Title VARCHAR(100), 
Author VARCHAR(100), 
Description VARCHAR(1000),
ItemCondition VARCHAR(1000),
Quantity INT,
Price DOUBLE(10,2),
SaleType VARCHAR(1),
ItemType VARCHAR(1),
Sold tinyint(4) DEFAULT 0,
Deleted BIT DEFAULT 0
);

create table TradeItems (
TradeNo INT AUTO_INCREMENT PRIMARY KEY,
TradeId INT NOT NULL,
OwnerId INT NOT NULL,
TradedStatus VARCHAR(1),
OfferTimeKey DATETIME,
TraderId INT,
ItemId INT,
Deleted BIT
);
commit;

INSERT INTO dukes_books.Book
(BookId, Isbn, Surname, Firstname, Title, Price, Onsale, CalendarYear, Description, Inventory, SubCategoryId)
VALUES(201, NULL, 'Duke', '', 'My Early Years: Growing Up on *7', 30.75, 0, 2005, 'What a cool book.', 20, NULL);
INSERT INTO dukes_books.Book
(BookId, Isbn, Surname, Firstname, Title, Price, Onsale, CalendarYear, Description, Inventory, SubCategoryId)
VALUES(202, NULL, 'Jeeves', '', 'Web Servers for Fun and Profit', 40.75, 1, 2010, 'What a cool book.', 9, NULL);
INSERT INTO dukes_books.Book
(BookId, Isbn, Surname, Firstname, Title, Price, Onsale, CalendarYear, Description, Inventory, SubCategoryId)
VALUES(203, NULL, 'Masterson', 'Webster', 'Web Components for Web Developers', 27.75, 0, 2010, 'What a cool book.', 19, NULL);
INSERT INTO dukes_books.Book
(BookId, Isbn, Surname, Firstname, Title, Price, Onsale, CalendarYear, Description, Inventory, SubCategoryId)
VALUES(205, NULL, 'Novation', 'Kevin', 'From Oak to Java: The Revolution of a Language', 10.75, 1, 2008, 'What a cool book.', 18, NULL);
INSERT INTO dukes_books.Book
(BookId, Isbn, Surname, Firstname, Title, Price, Onsale, CalendarYear, Description, Inventory, SubCategoryId)
VALUES(206, NULL, 'Thrilled', 'Ben', 'The Green Project: Programming for Consumer Devices', 30, 1, 2008, 'What a cool book.', 17, NULL);
INSERT INTO dukes_books.Book
(BookId, Isbn, Surname, Firstname, Title, Price, Onsale, CalendarYear, Description, Inventory, SubCategoryId)
VALUES(207, NULL, 'Coding', 'Happy', 'Java Intermediate Bytecodes', 30.95, 1, 2010, 'What a cool book.', 14, NULL);
commit;