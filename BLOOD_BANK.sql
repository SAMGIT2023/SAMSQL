
--BLOOD BANK MANAGEMENT DATABASE DESIGN
CREATE TABLE BB_Manager(M_id int NOT NULL,M_name varchar NOT NULL,M_phno bigint)
INSERT INTO BB_Manager VALUES('200', 'John','025665455'),('201', 'Jame','125465355'),('202', 'Jayn','024668459'),('203', 'vinn','028005454');
INSERT INTO BB_Manager VALUES('100', 'John','025665455'),('101', 'Jasone','125444455'),('102', 'Monikan','027895555'),('103', 'vinn','028005454');
----Dint set the size our manager name column size
ALTER TABLE BB_Manager ALTER COLUMN M_name varchar(100);

SELECT*FROM BB_Manager;
----Create blood donor table

CREATE TABLE Blood_Donor(bd_id int NOT NULL, 
bd_name varchar(100),
bd_age int,bd_sex varchar(6),
bd_Bgroup varchar(10),
bd_reg_date date,
record_id int NOT NULL,Location_id int NOT NULL);
--Data insertion into blood donor table
INSERT into Blood_Donor
VALUES(150221,'Mark',25,'M','B+','2015-12-17',101212,1100),
(191011,'Abdul',35,'F','A+','2016-11-22',101212,1100),
(160101,'Smith',22,'M','O+','2016-01-04',101312,1200),
(150011,'Pat',29,'M','O+','2015-07-19',101412,1300),
(150021,'Shyam',42,'F','A-','2015-12-24',101412,1300),
(150121,'Dan',44,'M','AB+','2015-08-28',101212,1200),
(160031,'Mike',33,'F','AB-','2016-02-06',101212,1400),
(160301,'Elisa',31,'F','AB+','2016-09-10',101312,1200),
(160091,'Carrol',24,'M','B-','2016-10-15',101312,1500),
(160401,'Mark',29,'M','O-','2016-12-17',101212,1200);
--check the data
SELECT*FROM Blood_Donor;
--Create blood specimen to hold the attributes of the blood specimen
CREATE TABLE BloodSpecimen (Specimen_no int NOT NULL, b_group varchar(10) NOT NULL, Status int, Dfind_ID int NOT NULL,M_id int NOT NULL
CONSTRAINT specimen_number_pk PRIMARY KEY(specimen_no));
--Data insertion
INSERT into BloodSpecimen
VALUES(1001, 'B+', 1,11,101),
(1002, 'O+', 1,12,102),
(1003, 'AB+', 1,11,102),
(1004, 'O-', 1,13,103),
(1005, 'A+', 0,14,101),
(1006, 'A-', 1,13,104),
(1007, 'AB-', 1,15,104),
(1008, 'AB-', 0,11,105),
(1009, 'B+', 1,13,105),
(1010, 'O+', 0,12,105),
(1011, 'O+', 1,13,103),
(1012, 'O-', 1,14,102),
(1013, 'B-', 1,14,102),
(1014, 'AB+', 0,15,101);
--Data check
SELECT*FROM BloodSpecimen;
--Creation of location table
CREATE TABLE Location (Loc_id int NOT NULL,Loc_name varchar(100) CONSTRAINT Loc_id_pk PRIMARY KEY(Loc_id));
--Data insertion
INSERT into Location
VALUES(1200,'Austin'),
(1300,'Irving'),
(1400,'Houston'),
(1500,'Richardson');--Data insertionINSERT into Location
VALUES(1600,'Plano'),
(1700,'Frisco'),
(1800,'Arlington'),
(1900,'San Antonio'),
(2000,'Tyler');--Data checkSELECT*FROM Location;--Create Disease finder table to hold info on who did blood screeningCREATE TABLE DiseaseFinder(
Dfind_ID int NOT NULL, 
Dfind_name varchar(100) NOT NULL,
Dfind_PhNo bigint CONSTRAINT Dfind_ID_PK PRIMARY KEY (Dfind_ID));
--Data insertion
INSERT into DiseaseFinder
VALUES(11,'Peter',4693804223),
(12,'Park',4693804223),
(13,'Jerry',4693804223),
(14,'Mark',4693804223),
(15,'Monika',4693804223);
--Creation of the hospital info table
CREATE TABLE Hospital_Info
( Hosp_ID int NOT NULL,
 Hosp_name varchar(200) NOT NULL,
 Loc_ID int NOT NULL,
 M_id int NOT NULL
 primary key(Hosp_ID)
);--Data insertionINSERT into Hospital_Info
VALUES(1,'Othaya KNH',1100,201),
(2,'Othaya level IV',1200,203),
(3,'Kiriaini Mission',1300,203);--Data checkSELECT*FROM Hospital_Info;--Create the recipient tableCREATE TABLE Recipient
( reci_ID int NOT NULL,
 reci_name varchar(100) NOT NULL,
 reci_age varchar(3),
 reci_Brgp varchar(10),
 reci_Bqnty float,
 reco_ID int NOT NULL,
 City_ID int NOT NULL,
 M_id int NOT NULL,
 reci_sex varchar(6),
 reci_reg_date date
);--Data insertionINSERT into Recipient
VALUES(10001,'Mark',25,'B+',1.5,101212,1100,101,'M','2015-12-17'),
(10002,'Dan',60,'A+',1,101312,1100,102,'M','2015-12-16'),
(10003,'Steve',35,'AB+',0.5,101312,1200,102,'M','2015-10-17'),
(10004,'Parker',66,'B+',1,101212,1300,104,'M','2016-11-17'),
(10005,'Jason',53,'B-',1,101412,1400,105,'M','2015-04-17'),
(10006,'Preetham',45,'O+',1.5,101512,1500,105,'M','2015-12-17'),
(10007,'Swetha',22,'AB-',1,101212,1500,101,'F','2015-05-17');--Data insertionSELECT*FROM Recipient;---recording staff table to record who took the patients detailsCREATE TABLE Recording_Staff
( reco_ID int NOT NULL,
 reco_Name varchar(100) NOT NULL,
 reco_phNo bigint
CONSTRAINT recoID_pk PRIMARY KEY (reco_ID)
);--Data insertionINSERT into Recording_Staff
VALUES(101212,'Walcot',4045806553),
(101312,'Henry',4045806553),
(101412,'Silva',4045806553),
(101512,'Adrian',4045806553),
(101612,'Mark',4045806553);--Data checkSELECT*FROM Recording_Staff;

