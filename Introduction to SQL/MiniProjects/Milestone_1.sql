
CREATE TABLE LODGE_Details (
    Lodge_Name VARCHAR2(30) PRIMARY KEY,
    Lodge_Manager VARCHAR2(30) NOT NULL,
    Lodge_Address VARCHAR2(30)
);


CREATE TABLE EMP_Details (
    Empno NUMBER(10) PRIMARY KEY,
    First_Name VARCHAR2(30) NOT NULL,
    Last_Name VARCHAR2(30) NOT NULL,
    Lodge_Name VARCHAR2(30),
    CONSTRAINT fk_lodge
        FOREIGN KEY (Lodge_Name)
        REFERENCES LODGE_Details(Lodge_Name)
);


CREATE TABLE SKILL_Details (
    Skill VARCHAR2(30) PRIMARY KEY,
    Skill_Desc VARCHAR2(30)
);

INSERT INTO LODGE_Details VALUES ('Jessy Lodge', 'Rajan', 'Rakesh Nagar');

INSERT INTO LODGE_Details VALUES ('Rajesh Lodge', 'Rajani', 'Anna Nagar');

INSERT INTO LODGE_Details VALUES ('Gooday Lodge', 'John', 'Sea Road');

INSERT INTO EMP_Details VALUES (101, 'James', 'Jackson', 'Rajesh Lodge');

INSERT INTO EMP_Details VALUES (102, 'Kalpash', 'Raj', 'Gooday Lodge');

INSERT INTO EMP_Details VALUES (103, 'Jasmine', 'Joy', 'Jessy Lodge');

INSERT INTO SKILL_Details VALUES ('Oracle SQL', 'Oracle Corporation');

INSERT INTO SKILL_Details VALUES ('Dot Net', 'Microsoft');

INSERT INTO SKILL_Details VALUES ('Sybase', 'SAP Corporation');

-- 3
UPDATE EMP_Details
SET Lodge_Name = 'Gooday Lodge'
WHERE Empno = 101;

-- 4
DELETE FROM EMP_Details
WHERE Empno = 103;

-- 5
CREATE TABLE EMP_SKILL (
    Empno NUMBER,
    Skill VARCHAR2(30)
);
SELECT e.First_Name
FROM EMP_Details e
JOIN EMP_SKILL s ON e.Empno = s.Empno
WHERE s.Skill = 'Oracle SQL';

-- 6
CREATE VIEW EMP_VIEW AS
SELECT e.Empno,
       e.First_Name,
       s.Skill,
       l.Lodge_Manager
FROM EMP_Details e
JOIN EMP_SKILL s ON e.Empno = s.Empno
JOIN LODGE_Details l ON e.Lodge_Name = l.Lodge_Name;

--7
CREATE SYNONYM EMPV FOR EMP_VIEW;

-- 8
CREATE INDEX idx_skill
ON EMP_SKILL(Skill);


