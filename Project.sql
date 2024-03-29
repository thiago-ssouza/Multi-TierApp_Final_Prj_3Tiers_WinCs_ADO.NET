IF db_id('College1en') IS NULL CREATE DATABASE College1en;
GO

-- CREATE DATABASE College1en
 
-- GO

USE College1en;
GO

CREATE TABLE Programs(
	ProgId VARCHAR(5) NOT NULL,
	ProgName VARCHAR(50) NOT NULL UNIQUE, -- Put as UNIQUE, Ask to Ramiro if it is ok
 CONSTRAINT PK_Programs PRIMARY KEY (ProgId) )
GO

CREATE TABLE Courses(
	CId VARCHAR(7) NOT NULL,
	CName VARCHAR(50) NOT NULL,
	ProgId VARCHAR(5) NOT NULL,
 CONSTRAINT PK_Courses PRIMARY KEY (CId),
 CONSTRAINT FK_Courses_Programs 
   FOREIGN KEY(ProgId) REFERENCES Programs (ProgId)
   ON DELETE CASCADE
   ON UPDATE CASCADE)
GO

CREATE TABLE Students(
	StId VARCHAR(10) NOT NULL,
	StName varchar(50) NOT NULL,
	ProgId VARCHAR(5) NOT NULL,
 CONSTRAINT PK_Students PRIMARY KEY (StId),
 CONSTRAINT FK_Students_Programs 
   FOREIGN KEY(ProgId) REFERENCES Programs (ProgId)
   ON DELETE NO ACTION
   ON UPDATE CASCADE)
GO

CREATE TABLE Enrollments(
	StId VARCHAR(10) NOT NULL,
	CId VARCHAR(7) NOT NULL,
	FinalGrade INT,
 CONSTRAINT PK_Enrollments PRIMARY KEY (StId, CId), 
 CONSTRAINT FK_Enrollments_Students 
   FOREIGN KEY(StId) REFERENCES Students (StId)
   ON DELETE CASCADE
   ON UPDATE CASCADE,
 CONSTRAINT FK_Enrollments_Courses 
   FOREIGN KEY(CId) REFERENCES Courses (CId)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
   --ON UPDATE CASCADE) -- Leaving like the way that I have undestood it generate a error so 
					  -- I have applied the option alternativaly not let update update
					  -- 8. Updating the CId in the courses table must propagate to the 
					  -- enrollments table (if necessary, you may alternatively assume that 
					  -- the CId of a course cannot be updated if there are enrollments to 
					  -- that course).

   /*
	Msg 1785, Level 16, State 0, Line 39
	Introducing FOREIGN KEY constraint 'FK_Enrollments_Courses' on table 'Enrollments' may 
	cause cycles or multiple cascade paths. Specify ON DELETE NO ACTION or ON UPDATE NO ACTION, 
	or modify other FOREIGN KEY constraints.
	Msg 1750, Level 16, State 1, Line 39
	Could not create constraint or index. See previous errors.
   */
GO

/***********************************************************************/
INSERT Programs (ProgId, ProgName) VALUES ('P0001', 'AEC - Programming');
INSERT Programs (ProgId, ProgName) VALUES ('P0002', 'AEC - Gaming');
INSERT Programs (ProgId, ProgName) VALUES ('P0003', 'AEC - Design');
INSERT Programs (ProgId, ProgName) VALUES ('P0004', 'AEC - Accounting and Management');
GO
/***********************************************************************/
INSERT Courses (CId, CName, ProgId) VALUES ('C000001', 'Databases', 'P0001');
INSERT Courses (CId, CName, ProgId) VALUES ('C000002', 'C#', 'P0001');
INSERT Courses (CId, CName, ProgId) VALUES ('C000003', 'Java', 'P0001');
INSERT Courses (CId, CName, ProgId) VALUES ('C000004', 'C++', 'P0001');
INSERT Courses (CId, CName, ProgId) VALUES ('C000005', 'Animation', 'P0002');
INSERT Courses (CId, CName, ProgId) VALUES ('C000006', 'Game Design', 'P0002');
INSERT Courses (CId, CName, ProgId) VALUES ('C000007', 'Design 3D', 'P0003');
INSERT Courses (CId, CName, ProgId) VALUES ('C000008', 'Photoshop', 'P0003');
INSERT Courses (CId, CName, ProgId) VALUES ('C000009', 'Accounting I', 'P0004');
INSERT Courses (CId, CName, ProgId) VALUES ('C000010', 'Marketing', 'P0004');

GO
/***********************************************************************/
INSERT Students (StId, StName, ProgId) VALUES ('S000000001', 'John', 'P0001');
INSERT Students (StId, StName, ProgId) VALUES ('S000000002', 'Mary', 'P0001');
INSERT Students (StId, StName, ProgId) VALUES ('S000000003', 'Paul', 'P0002');
INSERT Students (StId, StName, ProgId) VALUES ('S000000004', 'Bob', 'P0002');
INSERT Students (StId, StName, ProgId) VALUES ('S000000005', 'Thiago', 'P0003');
INSERT Students (StId, StName, ProgId) VALUES ('S000000006', 'James', 'P0003');
INSERT Students (StId, StName, ProgId) VALUES ('S000000007', 'Monica', 'P0004');
INSERT Students (StId, StName, ProgId) VALUES ('S000000008', 'Victor', 'P0004');
GO
/***********************************************************************/
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000001', 'C000001', 100);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000001', 'C000002', 80);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000002', 'C000003', 65);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000002', 'C000004', 76);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000003', 'C000005', 93);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000003', 'C000006', 84);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000004', 'C000005', 78);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000004', 'C000006', 85);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000005', 'C000007', 94);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000005', 'C000008', 99);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000006', 'C000007', 77);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000006', 'C000008', 89);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000007', 'C000009', 90);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000007', 'C000010', 98);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000008', 'C000009', 97);
INSERT Enrollments (StId, CId, FinalGrade) VALUES ('S000000008', 'C000010', null);

GO