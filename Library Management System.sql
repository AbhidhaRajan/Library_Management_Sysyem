-- Create the library database
CREATE Database Library;
-- Use the library database
use Library;


-- Create the Branch table
CREATE TABLE  Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255) NOT NULL,
    Contact_no VARCHAR(20)
);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
  (1, 101, '123 Main St', '555-1234'),
  (2, 102, '456 Oak St', '555-5678'),
  (3, 103, '789 Pine St', '555-9012'),
  (4, 104, '101 Elm St', '555-3456'),
  (5, 105, '202 Maple Ave', '555-7890'),
  (6, 106, '303 Birch Ln', '555-2345'),
  (7, 107, '404 Cedar Rd', '555-6789'),
  (8, 108, '505 Walnut Dr', '555-1234'),
  (9, 109, '606 Spruce Ct', '555-5678'),
  (10, 110, '707 Fir Blvd', '555-9012');

select * from Branch;



-- Create the Employee table
CREATE TABLE  Employee1 (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255) NOT NULL,
    Position VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2),
    Branch_no INT,
    CONSTRAINT FK_Branch_Employee FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee1 (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
  (001, 'John Doe', 'Manager', 60000, 1),
  (002, 'Jane Smith', 'Clerk', 40000, 1),
  (003, 'Bob Johnson', 'Assistant Manager', 50000, 1),
  (004, 'Alice Williams', 'Librarian', 45000, 2),
  (005, 'Charlie Brown', 'Clerk', 40000, 3),
  (006, 'Diana Davis', 'Assistant Manager', 52000, 3),
  (007, 'Edward Evans', 'Librarian', 46000, 4),
  (008, 'Frank Fisher', 'Clerk', 41000, 4),
  (009, 'Grace Green', 'Manager', 65000, 4),
  (010, 'Harry Harris', 'Clerk', 42000, 5),
  (011, 'Ivy White', 'Manager', 60000.00, 1),
  (012, 'Jack Jones', 'Assistant Manager', 52000.00, 1),
  (013, 'Karen King', 'Clerk', 40000.00, 1),
  (014, 'Larry Lee', 'Librarian', 45000.00, 2),
  (015, 'Megan Miller', 'Manager', 65000.00, 3),
  (016, 'Nathan Nelson', 'Assistant Manager', 52000.00, 4),
  (017, 'Olivia Olson', 'Clerk', 40000.00, 4),
  (018, 'Peter Parker', 'Librarian', 46000.00, 4),
  (019, 'Quincy Quinn', 'Manager', 60000.00, 5),
  (020, 'Rachel Rogers', 'Clerk', 41000.00, 5);


select * from Employee1;

-- Create the Books table
CREATE TABLE  Lib_Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255) NOT NULL,
    Category VARCHAR(255),
    Rental_Price DECIMAL(8, 2),
    Status ENUM('yes', 'no') NOT NULL,
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Lib_Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
  ('1001', 'The Catcher in the Rye', 'Fiction', 3.99, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
  ('1002', 'To Kill a Mockingbird', 'Fiction', 4.99, 'Yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
  ('1003', '1984', 'Dystopian', 5.99, 'Yes', 'George Orwell', 'Secker & Warburg'),
  ('1004', 'The Great Gatsby', 'Classic', 3.99, 'No', 'F. Scott Fitzgerald', 'Scribner'),
  ('1005', 'The Hobbit', 'Fantasy', 6.99, 'Yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
  ('1006', 'The Renaissance: Art and Culture', 'History', 14.50, 'no', 'Michael Renaissance Scholar', 'Artistic Books'),
  ('1007', 'The Da Vinci Code', 'Mystery', 7.99, 'No', 'Dan Brown', 'Doubleday'),
  ('1008', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 6.99, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
  ('1009', 'The History of Ancient Civilizations', 'History', 12.99, 'yes', 'John Historian', 'Academic Press'),
  ('1010', 'The Hunger Games', 'Science Fiction', 5.99, 'No', 'Suzanne Collins', 'Scholastic');

select * from Lib_Books;


-- Create the Customer table
CREATE TABLE  Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255) NOT NULL,
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
  (1, 'Alice Johnson', '123 Main St', '2021-01-01'),
  (2, 'Bob Smith', '456 Oak St', '2024-01-02'),
  (3, 'Charlie Brown', '789 Pine St', '2021-08-03'),
  (4, 'Diana Davis', '101 Elm St', '2024-01-04'),
  (5, 'Edward Evans', '202 Maple Ave', '2022-01-05'),
  (6, 'Frank Fisher', '303 Birch Ln', '2024-06-06'),
  (7, 'Grace Green', '404 Cedar Rd', '2021-04-07'),
  (8, 'Harry Harris', '505 Walnut Dr', '2020-03-08'),
  (9, 'Ivy White', '606 Spruce Ct', '2023-06-09'),
  (10, 'Jack Jones', '707 Fir Blvd', '2024-01-10');

select * from Customer;


-- Create the IssueStatus table
CREATE TABLE  IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255) NOT NULL,
    Issue_date DATE,
    Isbn_book INT,
    CONSTRAINT FK_Customer_Issue FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    CONSTRAINT FK_Books_Issue FOREIGN KEY (Isbn_book) REFERENCES Lib_Books(ISBN)
);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date)
VALUES
  (201, 1, 'The Catcher in the Rye', '2023-06-15'),
  (202, 2, 'To Kill a Mockingbird', '2024-01-16'),
  (203, 3, '1984', '2023-06-17'),
  (204, 4, 'The Great Gatsby', '2024-01-18'),
  (205, 5, 'The Hobbit', '2024-01-19');


select * from IssueStatus;

-- Create the ReturnStatus table
CREATE TABLE  ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255) NOT NULL,
    Return_date DATE,
    Isbn_book2 INT,
    CONSTRAINT FK_Customer_Return FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    CONSTRAINT FK_Books_Return FOREIGN KEY (Isbn_book2) REFERENCES Lib_Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
  (301, 1, 'The Catcher in the Rye', '2024-02-01', '1001'),
  (302, 2, 'To Kill a Mockingbird', '2024-02-02', '1002'),
  (303, 3, '1984', '2024-02-03', '1003'),
  (304, 4, 'The Great Gatsby', '2024-02-04', '1004'),
  (305, 5, 'The Hobbit', '2024-02-05', '1005');
  select * from ReturnStatus;
  
  -- Queries
  
  
  -- 1. Retrieve the book title, category, and rental price of all available books.
  
  select ISBN,Book_title, Category, Rental_Price from Lib_Books where Status="Yes";
  
  
  
 -- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary from  Employee1 order by Salary DESC ;
 
 
 -- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Customer_Id,Issued_book_name  AS Book_Titles, Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;


-- 4. Display the total count of books in each category.
select category,count( Category) AS Total_Count_Of_Books from Lib_Books group  by Category;


-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select Emp_name, Position,Salary from Employee1 where salary>50000;




-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_Id,Customer_name,Reg_date
FROM Customer
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

select  Branch_no, COUNT(*) AS Employees_in_each_branch from Employee1 group by Branch_no;




-- 8. Display the names of customers who have issued books in the month of June 2023.
select Customer.Customer_name from Customer join IssueStatus on Customer.Customer_Id= IssueStatus.Issued_cust
where month(IssueStatus.Issue_date)=6 and year(IssueStatus.Issue_date)=2023;


-- 9. Retrieve the book_title from the book table containing history.

select Book_title, Category from Lib_Books where Category="History";


-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

select Branch_no,count(*) as Count_of_Employees from Employee1 GROUP BY Branch_no
HAVING COUNT(*) > 5;



