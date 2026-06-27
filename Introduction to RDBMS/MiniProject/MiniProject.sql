
-- Q.1(1NF)
CREATE TABLE Member_Hobbies (
    Member_Id NUMBER,
    First_Name VARCHAR2(50),
    Last_Name VARCHAR2(50),
    Hobby VARCHAR2(50),
    PRIMARY KEY (Member_Id, Hobby)
);

INSERT INTO Member_Hobbies VALUES (101, 'Jayson', 'Mark', 'Cricket');
INSERT INTO Member_Hobbies VALUES (101, 'Jayson', 'Mark', 'Swimming');
INSERT INTO Member_Hobbies VALUES (101, 'Jayson', 'Mark', 'Football');

INSERT INTO Member_Hobbies VALUES (102, 'Ram', 'Ganesh', 'Swimming');
INSERT INTO Member_Hobbies VALUES (102, 'Ram', 'Ganesh', 'Running');
INSERT INTO Member_Hobbies VALUES (102, 'Ram', 'Ganesh', 'Music');

INSERT INTO Member_Hobbies VALUES (103, 'Raj', 'Kishore', 'Dancing');
INSERT INTO Member_Hobbies VALUES (103, 'Raj', 'Kishore', 'Singing');
INSERT INTO Member_Hobbies VALUES (103, 'Raj', 'Kishore', 'Running');

-- Q.2(2NF)
CREATE TABLE Employee_Dept (
    Empno NUMBER PRIMARY KEY,
    Dept VARCHAR2(10)
);

INSERT INTO Employee_Dept VALUES (101, 'TT');
INSERT INTO Employee_Dept VALUES (102, 'TT');

CREATE TABLE Employee_Training (
    Empno NUMBER,
    Training VARCHAR2(50),
    Training_Date DATE,
    PRIMARY KEY (Empno, Training),
    FOREIGN KEY (Empno) REFERENCES Employee_Dept(Empno)
);

INSERT INTO Employee_Training VALUES (101, 'Oracle SQL', TO_DATE('2015-08-12','YYYY-MM-DD'));
INSERT INTO Employee_Training VALUES (101, 'Java', TO_DATE('2015-08-21','YYYY-MM-DD'));
INSERT INTO Employee_Training VALUES (102, 'Oracle SQL', TO_DATE('2014-09-18','YYYY-MM-DD'));
 
-- Q.3(3NF)
CREATE TABLE Sports_Fees (
    Sports VARCHAR2(50) PRIMARY KEY,
    Fees NUMBER
);

INSERT INTO Sports_Fees VALUES ('Cricket', 100);
INSERT INTO Sports_Fees VALUES ('Hockey', 80);
INSERT INTO Sports_Fees VALUES ('Foodball', 90);
CREATE TABLE Members (
    Member_Id NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50),
    Last_Name VARCHAR2(50),
    Sports VARCHAR2(50),
    FOREIGN KEY (Sports) REFERENCES Sports_Fees(Sports)
);

INSERT INTO Members VALUES (101, 'Rajesh', 'Chand', 'Cricket');
INSERT INTO Members VALUES (102, 'Jayesh', 'Raj', 'Hockey');
INSERT INTO Members VALUES (103, 'Mark', 'Dorson', 'Foodball');