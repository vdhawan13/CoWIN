CREATE DATABASE CoWIN2;

USE CoWIN2;

CREATE TABLE Vaccines(
  Sr_No int NOT NULL PRIMARY KEY,
  Name varchar(10) NOT NULL UNIQUE,
  Company VARCHAR(40),
  type VARCHAR(45),
  min_age int
);

ALTER Table vaccines
ADD Second_dose_min_days int;

ALTER Table vaccines
ADD Second_dose_max_days int;

CREATE Table Prices(
Sr_no INT PRIMARY KEY,
Vaccine_Name Varchar(10),
Price_for_govt int(4),
Price_for_Private int(5),
Price_for_Public int(5),
FOREIGN KEY (Vaccine_Name) REFERENCES Vaccines(Name)
);

CREATE TABLE Person
(
    Ref_id BIGINT PRIMARY KEY CHECK (Ref_id>=1000000000000 AND Ref_id<=9999999999999),
    Mno BIGINT NOT NULL CHECK (Mno>=1000000000 AND Mno<=9999999999),
    Name_ VARCHAR(100) NOT NULL,
    YOB SMALLINT CHECK(YOB>=1875 AND YOB<=2019),
    Aadhaar_no BIGINT UNIQUE CHECK (Aadhaar_no>=100000000000 AND Aadhaar_no<=999999999999),
    Status VARCHAR(30) DEFAULT 'Not Vaccinated' 
);

CREATE TABLE Center_List(
CVC_ID VARCHAR(7) PRIMARY KEY,
Cname VARCHAR(30),
Pincode INT CHECK (Pincode>=100000 AND Pincode<=999999),
District VARCHAR(20),
State VARCHAR(30),
type CHAR(3) check (type='Gov' or type='Pvt')
);

CREATE TABLE SLOTS
(
    CVC_ID VARCHAR(7),
    Date DATE,
    Vaccine_Name char(10),
    Min_age int,
    Max_age int,
    Online_Dose1 int Check(Online_Dose1<=5000),
    Online_Dose2 int Check(Online_Dose2<=5000),
    Onspot_Dose1 int Check(Onspot_Dose1<=5000),
    Onspot_Dose2 int Check(Onspot_Dose2<=5000),
    Total_Capacity int,
    Price int,
    FOREIGN KEY (Vaccine_Name) REFERENCES Vaccines(Name)
);

ALTER Table slots
ADD Primary Key (CVC_ID, Date, Vaccine_Name);

ALTER Table slots
ADD CHECK(Price =0 or Price=780 Or Price=1145 or Price=875 or Price=1410);

CREATE TABLE Booking
(
    Ref_id BIGINT PRIMARY KEY,
    CVC_ID VARCHAR(7),
    Date DATE,
    Vaccine_Name VARCHAR(10),
    Dose_Type SMALLINT CHECK(Dose_Type=1 or Dose_Type=2),
    FOREIGN KEY (Ref_id) REFERENCES Person(Ref_id),
    FOREIGN KEY (CVC_ID) REFERENCES slots(CVC_ID),
    FOREIGN KEY (Vaccine_Name) REFERENCES vaccines(Name)
);

CREATE TABLE Vaccinated
(
    Ref_id BIGINT PRIMARY KEY,
    CVC_ID VARCHAR(7) DEFAULT NULL,
    Vaccine_Name VARCHAR(10) DEFAULT NULL,
    Dose1_Date DATE DEFAULT NULL,
    Dose2_Date DATE DEFAULT NULL,
    FOREIGN KEY (Ref_id) REFERENCES Person(Ref_id),
    FOREIGN KEY (CVC_ID) REFERENCES slots(CVC_ID),
    FOREIGN KEY (Vaccine_Name) REFERENCES vaccines(Name)
);


INSERT INTO VACCINES 
VALUES(1, 'Covishield', 'Serum Institute of India, Pune','Non-Replicating Viral Vector', 18, 84, 112), 
(2, 'Covaxin', 'Bharat Biotech, Hyderabad', 'Inactivated Virus', 02, 28, 42), 
(3, 'Sputnik-V', 'Sputnik', 'Non-Replicating Viral Vector', 18, 21, 90), 
(4, 'Moderna', 'US Biotech', 'm-RNA based', 18, 28, 42), 
(5,'Johnson', 'Janssen Pharmaceuticals', 'Viral-vector based', 18, NULL, NULL), 
(6, 'ZyCOV-D', 'Cadila Healthcare', 'DNA', 12, 28, 56);



INSERT INTO Prices VALUES(1, 'Covishield', 215, 600, 780), 
(2, 'Covaxin', 225, 1200, 1410), 
(3, 'Sputnik-V', NULL, 948, 1145), 
(4, 'Moderna', NULL, 3800, 4000), 
(5, 'Johnson', NULL, 1858, 2000), 
(6, 'ZyCOV-D', 358, 750, 875);




INSERT INTO Person
VALUES(5123870087267,9712326741,'Jaspreet singh',2002,553201661195,'Fully Vaccinated');
INSERT INTO Person
VALUES(6123876329267,9887226741,'Maninder singh',2001,653201490085,'Fully Vaccinated');

INSERT INTO Person
VALUES(7121234325267,9987236009,'Lovepreet singh',1998,753201006195,'Partially Vaccinated');

INSERT INTO Person
VALUES(8123871234267,9687009841,'Kiranjeet kaur',1997,853201471195,'Fully Vaccinated');

INSERT INTO Person
VALUES(9123876309167,9588936747,'Gurnoor singh',2002,959201231195,'Partially Vaccinated');

INSERT INTO Person
VALUES(1984647294367,8293647853,'Adhyaan Sharma',2006,462781927384,'Not Vaccinated');

INSERT INTO Person
VALUES(1353628942536,7492362822,'Varnika Mishra',2007,672819273917,'Partially Vaccinated');

INSERT INTO Person
VALUES(5182482629172,8787226741,'Namamish Awasthi',2002,753201471195,'Fully Vaccinated');

INSERT INTO Person
VALUES(2374937391037,8787226741,'Brahm Prakash Awasthi',1963,926374326166,'Fully Vaccinated');

INSERT INTO Person
VALUES(3749238290356,8787226741,'Ojas Awasthi',2017,578645671829,'Not Vaccinated');

INSERT INTO Person
VALUES(5123874209907,9787323842,'Harpreet singh',1996,579903761101,'Not Vaccinated');
INSERT INTO Person
VALUES(6137876390267,9817290041,'Manjot kaur',2001,653203901695,'Fully Vaccinated');

INSERT INTO Person
VALUES(7103776300267,9987349041,'Jasmine kaur',2002,753212041195,'Not Vaccinated');

INSERT INTO Person
VALUES(8123876325681,9687092743,'Balwinder singh',1990,873200171195,'Partially Vaccinated');

INSERT INTO Person
VALUES(9145870923267,9587001731,'Prabhjot singh',1989,951201409535,'Partially Vaccinated');

INSERT INTO Person
VALUES(5123237609727,9765220041,'Gurpreet singh',2001,553901471295,'Fully Vaccinated');

INSERT INTO Person
VALUES(6123230929267,9888466741,'Sukhwinder singh',1995,653299471295,'Fully Vaccinated');

INSERT INTO Person
VALUES(4637839267382,9383675839,'Taimur Ali Khan',2015,345830273829,'Partially Vaccinated');

INSERT INTO Person
VALUES(7482927392817,8775489065,'Babar Azam',2005,568946885321,'Not Vaccinated');

INSERT INTO Person
VALUES(6738192738192,8775489065,'Mohammed Arslan',2011,439846293640,'Partially Vaccinated');

INSERT INTO Person
VALUES(3894204026392,9382739179,'Ratandeep Singh',2008,398292767382,'Partially Vaccinated');

INSERT INTO Person
VALUES(3287204720172,8162936281,'Anuj Yadav',2012,897634679767,'Partially Vaccinated');

INSERT INTO Person
VALUES(7123834325267,9987234749,'Ravneet kaur',1993,753501400095,'Partially Vaccinated');

INSERT INTO Person
VALUES(8123879067367,9682326751,'Gurbaj singh',1993,853093471195,'Not Vaccinated');

INSERT INTO Person
VALUES(9123872793267,9589526741,'Ramandeep kaur',1990,953001445795,'Fully Vaccinated');



INSERT INTO Person
VALUES(5123876329067,9787239741,'Harbhajan singh',2002,558341472195,'Partially Vaccinated');
INSERT INTO Person
VALUES(6123823095267,9887209741,'Simranjeet singh',2001,653201079634,'Not Vaccinated');

INSERT INTO Person
VALUES(7123876329677,9982345741,'Ankur warikoo',1999,759821471195,'Fully Vaccinated');

INSERT INTO Person
VALUES(8134216329267,9687228900,'Vivek bajaj',1995,853201456789,'Fully Vaccinated');

INSERT INTO Person
VALUES(9123876329002,9587226871,'Saloni bhardwaj',1993,953201471329,'Not Vaccinated');

INSERT INTO Person
VALUES(7281927381920,7891728361,'Shalu Mishra',2008,839173967289,'Partially Vaccinated');

INSERT INTO Person
VALUES(6787463728308,8907656564,'Krati Singh',2016,678932793078,'Partially Vaccinated');

INSERT INTO Person
VALUES(3493946372919,7892067382,'Raman Verma',2010,157489291728,'Partially Vaccinated');

INSERT INTO Person
VALUES(7482918283648,8178928192,'Manish Verma',2007,789127192738,'Partially Vaccinated');

INSERT INTO Person
VALUES(2893102837283,9012129101,'Suyash Singh',2018,273810283910,'Not Vaccinated');

INSERT INTO Person
VALUES(1123870087267,8712326741,'Tarsem singh',1989,123201661195,'Partially Vaccinated');
INSERT INTO Person
VALUES(2123876329267,8887226741,'Jasbir singh',1995,233201490085,'Fully Vaccinated');

INSERT INTO Person
VALUES(3121234325267,8987236009,'Satnam singh',1998,343201006195,'Fully Vaccinated');

INSERT INTO Person
VALUES(4123871234267,8687009841,'Sanampreet kaur',1997,453201471195,'Partially Vaccinated');

INSERT INTO Person
VALUES(1023876309167,8588936747,'Shehbaz singh',2002,109201231195,'Not Vaccinated');

INSERT INTO Person
VALUES(4829463839273,8738290509,'Shreya Singh',2015,781627381092,'Partially Vaccinated');

INSERT INTO Person
VALUES(6748292739373,9127382018,'Aman Yadav',2007,456281678291,'Fully Vaccinated');

INSERT INTO Person
VALUES(3298721037489,9182736478,'Love Babbar',2015,347832791912,'Not Vaccinated');

INSERT INTO Person
VALUES(7583920372819,7892102899,'Indresh Patel',2004,783983910281,'Fully Vaccinated');

INSERT INTO Person
VALUES(6352748991827,8127391028,'Om Prakash Tandon',2015,379110281728,'Partially Vaccinated');

INSERT INTO Person
VALUES(1223874209907,8687323842,'Devdarshdeep singh',1996,129903761101,'Full Vaccinated');
INSERT INTO Person
VALUES(2337876390267,8917290041,'Naveen kumar',2001,213203901695,'Fully Vaccinated');

INSERT INTO Person
VALUES(3303776300267,8347349041,'Mandeep kaur',1999,313212041195,'Not Vaccinated');

INSERT INTO Person
VALUES(4723876325681,8547092743,'Mayank Gera',1989,403200171195,'Partially Vaccinated');

INSERT INTO Person
VALUES(1045870923267,8117001731,'Maurya sharma',1989,101201409535,'Fully Vaccinated');


INSERT INTO Person
VALUES(1823237609727,8665220041,'Hartik salaria',2001,243901471299,'Partially Vaccinated');
INSERT INTO Person
VALUES(2813230929067,8828466741,'Yash Gupta',1995,223299471295,'Fully Vaccinated');

INSERT INTO Person
VALUES(3123834325267,8187234749,'Sushant dhuria',1993,317501400195,'Fully Vaccinated');

INSERT INTO Person
VALUES(4509879067367,8681326751,'Srushti Deshmukh',1993,473090471195,'Not Vaccinated');

INSERT INTO Person
VALUES(1023972793267,8589526741,'Tina Dabi',1990,103001545795,'Fully Vaccinated');



INSERT INTO Person
VALUES(1023376329067,8787439741,'Tanmay Bhatt',2002,134341472195,'Partially Vaccinated');
INSERT INTO Person
VALUES(2123853095267,8807209741,'Arun Mittal',2001,223201079634,'Partially Vaccinated');

INSERT INTO Person
VALUES(3193876329677,8982345741,'Raj gupta',1999,309821471195,'Not Vaccinated');

INSERT INTO Person
VALUES(4134216329267,8607228100,'Gopal Verma',1995,456789456789,'Fully Vaccinated');

INSERT INTO Person
VALUES(1021876329002,8987226871,'Priyanshu Aggarwal',1993,103701871329,'Fully Vaccinated');



INSERT INTO center_list VALUES
('G0047', 'Amreli Site', 364522, 'Patiala', 'Punjab', 'Gov'),
('P1043', 'Columbia Asia', 110567, 'Kanpur', 'Uttar Pradesh', 'Pvt'),
('G2059', 'CHC Janakpur', 596473, 'Ambala', 'Haryana', 'Gov'),
('G3075', 'Kachi Hospital', 411002, 'Pune', 'Maharashtra', 'Gov'),
('P4077', 'Mahadurga Hospital', 110009, 'North Delhi', 'Delhi', 'Pvt');




Insert into slots 
values ('G0047','2021-12-08','Covaxin',2,null,100,100,200,200,600,0),
('G0047','2021-12-08','Covishield',18,null,100,100,300,300,800,0),
('G0047','2021-12-08','ZyCOV-D',12,17,100,50,300,150,600,0),
('P1043','2021-12-08','Covaxin',2,null,250,250,0,0,500,1410),
('P1043','2021-12-08','Covishield',18,null,500,500,0,0,1000,780),
('P1043','2021-12-08','ZyCOV-D',12,17,300,300,0,0,600,875),
('P1043','2021-12-08','Sputnik-V',18,null,400,400,0,0,800,1145),
('G2059','2021-12-08','Covaxin',2,null,100,100,200,200,600,0),
('G2059','2021-12-08','Covishield',18,null,100,100,300,300,800,0),
('G2059','2021-12-08','ZyCOV-D',12,17,100,50,300,150,600,0),
('G3075','2021-12-08','Covaxin',2,null,100,100,200,200,600,0),
('G3075','2021-12-08','Covishield',18,null,100,100,300,300,800,0),
('G3075','2021-12-08','ZyCOV-D',12,17,100,50,300,150,600,0),
('P4077','2021-12-08','Covaxin',2,null,250,250,0,0,500,1410),
('P4077','2021-12-08','Covishield',18,null,500,500,0,0,1000,780),
('P4077','2021-12-08','ZyCOV-D',12,17,300,300,0,0,600,875),
('P4077','2021-12-08','Sputnik-V',18,null,400,400,0,0,800,1145),
('G0047','2021-12-09','Covaxin',2,null,100,100,200,200,600,0),
('G0047','2021-12-09','Covishield',18,null,100,100,300,300,800,0),
('G0047','2021-12-09','ZyCOV-D',12,17,100,50,300,150,600,0),
('P1043','2021-12-09','Covaxin',2,null,250,250,0,0,500,1410),
('P1043','2021-12-09','Covishield',18,null,500,500,0,0,1000,780),
('P1043','2021-12-09','ZyCOV-D',12,17,300,300,0,0,600,875),
('P1043','2021-12-09','Sputnik-V',18,null,400,400,0,0,800,1145),
('G2059','2021-12-09','Covaxin',2,null,100,100,200,200,600,0),
('G2059','2021-12-09','Covishield',18,null,100,100,300,300,800,0),
('G2059','2021-12-09','ZyCOV-D',12,17,100,50,300,150,600,0),
('G3075','2021-12-09','Covaxin',2,null,100,100,200,200,600,0),
('G3075','2021-12-09','Covishield',18,null,100,100,300,300,800,0),
('G3075','2021-12-09','ZyCOV-D',12,17,100,50,300,150,600,0),
('P4077','2021-12-09','Covaxin',2,null,250,250,0,0,500,1410),
('P4077','2021-12-09','Covishield',18,null,500,500,0,0,1000,780),
('P4077','2021-12-09','ZyCOV-D',12,17,300,300,0,0,600,875),
('P4077','2021-12-09','Sputnik-V',18,null,400,400,0,0,800,1145),
('G0047','2021-12-10','Covaxin',2,null,100,100,200,200,600,0),
('G0047','2021-12-10','Covishield',18,null,100,100,300,300,800,0),
('G0047','2021-12-10','ZyCOV-D',12,17,100,50,300,150,600,0),
('P1043','2021-12-10','Covaxin',2,null,250,250,0,0,500,1410),
('P1043','2021-12-10','Covishield',18,null,500,500,0,0,1000,780),
('P1043','2021-12-10','ZyCOV-D',12,17,300,300,0,0,600,875),
('P1043','2021-12-10','Sputnik-V',18,null,400,400,0,0,800,1145),
('G2059','2021-12-10','Covaxin',2,null,100,100,200,200,600,0),
('G2059','2021-12-10','Covishield',18,null,100,100,300,300,800,0),
('G2059','2021-12-10','ZyCOV-D',12,17,100,50,300,150,600,0),
('G3075','2021-12-10','Covaxin',2,null,100,100,200,200,600,0),
('G3075','2021-12-10','Covishield',18,null,100,100,300,300,800,0),
('G3075','2021-12-10','ZyCOV-D',12,17,100,50,300,150,600,0),
('P4077','2021-12-10','Covaxin',2,null,250,250,0,0,500,1410),
('P4077','2021-12-10','Covishield',18,null,500,500,0,0,1000,780),
('P4077','2021-12-10','ZyCOV-D',12,17,300,300,0,0,600,875),
('P4077','2021-12-10','Sputnik-V',18,null,400,400,0,0,800,1145);




-- Filling Vaccinated and Booking Table 


-- Person 1 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(1021876329002,'P1043','Sputnik-V','2021-06-30','2021-07-25');

-- Person 2 (Partially Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(1023376329067,'G0047','Covaxin','2021-11-08',NULL);

INSERT INTO Booking
VALUES(1023376329067,'G0047','2021-12-08','Covaxin',2);
UPDATE slots
SET Online_Dose2=Online_Dose2-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G0047' AND Date='2021-12-08' AND Vaccine_Name='Covaxin' AND Online_Dose2>0;

-- Person 3 (Not Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(1023876309167,NULL,NULL,NULL,NULL);

INSERT INTO Booking
VALUES(1023876309167,'G0047','2021-12-08','Covishield',1);
UPDATE slots
SET Online_Dose1=Online_Dose1-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G0047' AND Date='2021-12-08' AND Vaccine_Name='Covishield' AND Online_Dose1>0;


-- Person 4 (Fully Vaccinated,18+)

INSERT INTO Vaccinated
VALUES(1023972793267,'G2059','Covishield','2021-05-22','2021-08-30');

-- Person 5 (Fully Vaccinated,18+)

INSERT INTO Vaccinated
VALUES(1045870923267,'G0047','Covishield','2021-06-11','2021-09-29');

-- Person 6 (Partially Vaccinated,18+)

INSERT INTO Vaccinated
VALUES(1123870087267,'G2059','Covishield','2021-09-01',NULL);

INSERT INTO Booking
VALUES(1123870087267,'G2059','2021-12-09','Covishield',2);
UPDATE slots
SET Online_Dose2=Online_Dose2-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G2059' AND Date='2021-12-09' AND Vaccine_Name='Covishield' AND Online_Dose2>0;


-- Person 7 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(1223874209907,'G3075','Covaxin','2021-08-05','2021-09-10');

-- Person 8 (Partially Vaccinated,12+)
INSERT INTO Vaccinated
VALUES(1353628942536,'G3075','ZyCOV-D','2021-11-08',NULL);

INSERT INTO Booking
VALUES(1353628942536,'G3075','2021-12-08','ZyCOV-D',2);
UPDATE slots
SET Online_Dose2=Online_Dose2-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G3075' AND Date='2021-12-08' AND Vaccine_Name='ZyCOV-D' AND Online_Dose2>0;


-- Person 9 (Partially Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(1823237609727,'G0047','Covaxin','2021-11-01',NULL);

INSERT INTO Booking
VALUES(1823237609727,'G0047','2021-12-10','Covaxin',2);
UPDATE slots
SET Online_Dose2=Online_Dose2-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G0047' AND Date='2021-12-10' AND Vaccine_Name='Covaxin' AND Online_Dose2>0;

-- Person 10 (Not Vaccinated,12+)
INSERT INTO Vaccinated
VALUES(1984647294367,NULL,NULL,NULL,NULL);

INSERT INTO Booking
VALUES(1984647294367,'P1043','2021-12-09','Covaxin',1);
UPDATE slots
SET Online_Dose1=Online_Dose1-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P1043' AND Date='2021-12-09' AND Vaccine_Name='Covaxin' AND Online_Dose1>0;

-- Person 11 (Partially Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(2123853095267,'P4077','Sputnik-V','2021-11-15',NULL);

INSERT INTO Booking
VALUES(2123853095267,'P4077','2021-12-10','Sputnik-V',2);
UPDATE slots
SET Online_Dose2=Online_Dose2-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P4077' AND Date='2021-12-10' AND Vaccine_Name='Sputnik-V' AND Online_Dose2>0;

-- Person 12 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(2123876329267,'G3075','Covishield','2021-08-11','2021-11-20');

-- Person 13 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(2337876390267,'G0047','Covishield','2021-06-20','2021-09-29');

-- Person 14 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(2374937391037,'P1043','Covishield','2021-04-05','2021-07-22');

-- Person 15 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(2813230929067,'P1043','Covishield','2021-05-15','2021-08-13');

-- Person 16 (Not Vaccinated,2+)
INSERT INTO Vaccinated
VALUES(2893102837283,NULL,NULL,NULL,NULL);

INSERT INTO Booking
VALUES(2893102837283,'P4077','2021-12-09','Covaxin',1);
UPDATE slots
SET Online_Dose1=Online_Dose1-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P4077' AND Date='2021-12-09' AND Vaccine_Name='Covaxin' AND Online_Dose1>0;

-- Person 17 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(3121234325267,'G0047','Covaxin','2021-07-21','2021-08-28');


-- Person 18 (Fully Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(3123834325267,'G0047','Covishield','2021-07-21','2021-10-29');

-- Person 19 (Not Vaccinated,18+)
INSERT INTO Vaccinated
VALUES(3193876329677,NULL,NULL,NULL,NULL);

INSERT INTO Booking
VALUES(3193876329677,'P4077','2021-12-09','Sputnik-V',1);
UPDATE slots
SET Online_Dose1=Online_Dose1-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P4077' AND Date='2021-12-09' AND Vaccine_Name='Sputnik-V' AND Online_Dose1>0;


--Person 20 (Partially Vaccinated,12+)
INSERT INTO Vaccinated
VALUES(3287204720172,'P1043','Covaxin','2021-11-09',NULL);

INSERT INTO Booking
VALUES(3287204720172,'P1043','2021-12-10','Covaxin',2);
UPDATE slots
SET Online_Dose2=Online_Dose2-1, Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P1043' AND Date='2021-12-10' AND Vaccine_Name='Covaxin' AND Online_Dose2>0;


--Person 21 (Not Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(3298721037489, NULL, NULL, NULL, NULL);

INSERT INTO booking VALUES
(3298721037489, 'G0047', '2021-12-08', 'Covaxin', 1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1, Total_Capacity=Total_Capacity-1 where CVC_ID='G0047' AND Date='2021-12-08' AND Vaccine_Name='Covaxin';

--Person 22 (Not Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(3303776300267, NULL, NULL, NULL, NULL);

INSERT INTO booking VALUES
(3303776300267, 'P1043', '2021-12-08', 'Sputnik-V', 1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1 where CVC_ID='P1043' AND Date='2021-12-08' AND Vaccine_Name='Sputnik-V';

--Person 23 (Partially Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(3493946372919, 'P4077', 'Covaxin', '2021-11-09', NULL);

INSERT INTO booking VALUES
(3493946372919, 'G2059', '2021-12-09', 'Covaxin', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G2059' AND Date='2021-12-09' AND Vaccine_Name='Covaxin';

--Person 24 (Not Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(3749238290356, NULL, NULL, NULL, NULL);

INSERT INTO booking VALUES
(3749238290356, 'G0047', '2021-12-10', 'Covaxin', 1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G0047' AND Date='2021-12-10' AND Vaccine_Name='Covaxin';

--Person 25 (Partially Vaccinated, 12-17)
INSERT INTO Vaccinated VALUES
(3894204026392, 'P4077', 'ZyCOV-D', '2021-11-09', NULL);

INSERT INTO booking VALUES
(3894204026392, 'G2059', '2021-12-09', 'ZyCOV-D', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G2059' AND Date='2021-12-09' AND Vaccine_Name='ZyCOV-D';

--Person 26 (Partially Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(4123871234267, 'P4077', 'Covishield', '2021-09-11', NULL);

INSERT INTO booking VALUES
(4123871234267, 'G3075', '2021-12-09', 'Covishield', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G3075' AND Date='2021-12-09' AND Vaccine_Name='Covishield';

--Person 27 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(4134216329267, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 28 (Not Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(4509879067367, NULL, NULL, NULL, NULL);

INSERT INTO booking VALUES
(4509879067367, 'P1043', '2021-12-08', 'Sputnik-V', 1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1 where CVC_ID='P1043' AND Date='2021-12-08' AND Vaccine_Name='Sputnik-V';

--Person 29(Partially Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(4637839267382, 'P4077', 'Covaxin', '2021-11-09', NULL);

INSERT INTO booking VALUES
(4637839267382, 'G2059', '2021-12-09', 'Covaxin', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G2059' AND Date='2021-12-09' AND Vaccine_Name='Covaxin';

--Person 30 (Partially Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(4723876325681, 'P4077', 'Covishield', '2021-09-11', NULL);

INSERT INTO booking VALUES
(4723876325681, 'G3075', '2021-12-09', 'Covishield', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G3075' AND Date='2021-12-09' AND Vaccine_Name='Covishield';

--Person 31 (Partially Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(4829463839273, 'P4077', 'Covaxin', '2021-11-09', NULL);

INSERT INTO booking VALUES
(4829463839273, 'G2059', '2021-12-09', 'Covaxin', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G2059' AND Date='2021-12-09' AND Vaccine_Name='Covaxin';

--Person 32 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(5123237609727, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 33 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(5123870087267, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 34 (Not Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(5123874209907, NULL, NULL, NULL, NULL);

INSERT INTO booking VALUES
(5123874209907, 'P1043', '2021-12-08', 'Sputnik-V', 1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1 where CVC_ID='P1043' AND Date='2021-12-08' AND Vaccine_Name='Sputnik-V';

--Person 35 (Partially Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(5123876329067, 'P4077', 'Covishield', '2021-09-11', NULL);

INSERT INTO booking VALUES
(5123876329067, 'G3075', '2021-12-09', 'Covishield', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G3075' AND Date='2021-12-09' AND Vaccine_Name='Covishield';

--Person 36 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(5182482629172, 'G0047', 'Covaxin', '2021-08-15', '2021-09-13');

--Person 37 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(6123230929267, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 38 (Not Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(6123823095267, NULL, NULL, NULL, NULL);

INSERT INTO booking VALUES
(6123823095267, 'P1043', '2021-12-08', 'Sputnik-V', 1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1 where CVC_ID='P1043' AND Date='2021-12-08' AND Vaccine_Name='Sputnik-V';

--Person 39 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(6123876329267, 'G0047', 'Covishield', '2021-05-19', '2021-08-15');

--Person 40 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(6137876390267, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 41 (Partially Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(6352748991827, 'P4077', 'Covaxin', '2021-11-09', NULL);
INSERT INTO Booking
VALUES(6352748991827,'G3075','2021-12-08','Covaxin',2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G3075' AND Date='2021-12-08' AND Vaccine_Name='Covaxin' AND Online_Dose2>0;

--Person 42 (Partially Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(6738192738192, 'P4077', 'Covaxin', '2021-11-09', NULL);

INSERT INTO Booking
VALUES(6738192738192,'G3075','2021-12-08','Covaxin',2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G3075' AND Date='2021-12-08' AND Vaccine_Name='Covaxin' AND Online_Dose2>0;

--Person 43 (Fully Vaccinated, 12-17)
INSERT INTO Vaccinated VALUES
(6748292739373, 'G0047', 'ZyCOV-D', '2021-07-19', '2021-08-17');

--Person 44 (Partially Vaccinated, 12-)
INSERT INTO Vaccinated VALUES
(6787463728308, 'P4077', 'Covaxin', '2021-11-09', NULL);
INSERT INTO Booking
VALUES(6787463728308,'G3075','2021-12-08','Covaxin',2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G3075' AND Date='2021-12-08' AND Vaccine_Name='Covaxin' AND Online_Dose2>0;

--Person 45 (Not Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(7103776300267, NULL, NULL, NULL, NULL);

INSERT INTO Booking
VALUES(7103776300267,'G3075','2021-12-08','Covishield',1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G3075' AND Date='2021-12-08' AND Vaccine_Name='Covishield' AND Online_Dose1>0;

--Person 46 (Partially Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(7121234325267, 'P4077', 'Covishield', '2021-09-11', NULL);
INSERT INTO Booking
VALUES(7121234325267,'G3075','2021-12-08','Covishield',2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G3075' AND Date='2021-12-08' AND Vaccine_Name='Covishield' AND Online_Dose2>0;

--Person 47 (Partially Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(7123834325267, 'P4077', 'Covishield', '2021-09-11', NULL);
INSERT INTO Booking
VALUES(7123834325267,'P4077','2021-12-08','Covishield',2);

UPDATE slots
SET online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P4077' AND Date='2021-12-08' AND Vaccine_Name='Covishield' AND Online_Dose2>0;

--Person 48 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(7123876329677, 'G0047', 'Covishield', '2021-07-19', '2021-10-17');

--Person 49 (Partially Vaccinated, 12-17)
INSERT INTO Vaccinated VALUES
(7281927381920, 'P4077', 'ZyCOV-D', '2021-11-09', NULL);

INSERT INTO booking VALUES
(7281927381920, 'G2059', '2021-12-09', 'ZyCOV-D', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G2059' AND Date='2021-12-09' AND Vaccine_Name='ZyCOV-D';

--Person 50 (Partially Vaccinated, 12-17)
INSERT INTO Vaccinated VALUES
(7482918283648, 'P4077', 'ZyCOV-D', '2021-11-09', NULL);

INSERT INTO booking VALUES
(7482918283648, 'G2059', '2021-12-09', 'ZyCOV-D', 2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1 where CVC_ID='G2059' AND Date='2021-12-09' AND Vaccine_Name='ZyCOV-D';

--Person 51 (Not Vaccinated, 12-17)
INSERT INTO vaccinated VALUES
(7482927392817, NULL, NULL, NULL, NULL);
INSERT INTO Booking
VALUES(7482927392817,'G2059','2021-12-10','ZyCOV-D',1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G2059' AND Date='2021-12-10' AND Vaccine_Name='ZyCOV-D' AND Online_Dose1>0;

--Person 52 (Fully Vaccinated, 12-17)
INSERT INTO Vaccinated VALUES
(7583920372819, 'G0047', 'ZyCOV-D', '2021-07-19', '2021-08-17');

--Person 53 (Fully vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(8123871234267, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 54 (Partially Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(8123876325681, 'P4077', 'Covishield', '2021-09-11', NULL);

INSERT INTO Booking
VALUES(8123876325681,'G3075','2021-12-10','Covishield',2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G3075' AND Date='2021-12-10' AND Vaccine_Name='Covishield' AND Online_Dose2>0;

--Person 55 (Not vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(8123879067367, NULL, NULL, NULL, NULL);
INSERT INTO Booking
VALUES(8123879067367,'P4077','2021-12-10','Sputnik-V',1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P4077' AND Date='2021-12-10' AND Vaccine_Name='Sputnik-V' AND Online_Dose1>0;

--Person 56 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(8134216329267, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 57 (Fully Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(9123872793267, 'G0047', 'Covishield', '2021-08-19', '2021-11-13');

--Person 58 (Partially vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(9123876309167, 'P4077', 'Covishield', '2021-09-11', NULL);
INSERT INTO Booking
VALUES(9123876309167,'G2059','2021-12-10','Covishield',2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G2059' AND Date='2021-12-10' AND Vaccine_Name='Covishield' AND Online_Dose2>0;

--Person 59 (Not Vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(9123876329002, NULL, NULL, NULL, NULL);
INSERT INTO Booking
VALUES(9123876329002,'P4077','2021-12-09','Sputnik-V',1);

UPDATE slots
SET Online_Dose1=Online_Dose1-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='P4077' AND Date='2021-12-09' AND Vaccine_Name='Sputnik-V' AND Online_Dose1>0;

--Person 60 (Partially vaccinated, 18+)
INSERT INTO Vaccinated VALUES
(9145870923267, 'P4077', 'Covishield', '2021-09-11', NULL);
INSERT INTO Booking
VALUES(9145870923267,'G2059','2021-12-10','Covishield',2);

UPDATE slots
SET Online_Dose2=Online_Dose2-1,Total_Capacity=Total_Capacity-1
WHERE CVC_ID='G2059' AND Date='2021-12-10' AND Vaccine_Name='Covishield' AND Online_Dose2>0;






-- Querying the database


SELECT
  Mno,
  Ref_id,
  Name_,
  YOB,
  Status
FROM
  Person
WHERE
  Mno IN (
    SELECT
      Mno
    FROM
      Person
    GROUP BY
      Mno
    HAVING
      COUNT(Mno) > 1
  );



SELECT
  C.CVC_ID,
  Cname,
  Pincode,
  District,
  State,
  type,
  COUNT(Dose1_Date) AS Dose1_Count
FROM
  Vaccinated AS V,
  Center_List AS C
WHERE
  Dose1_Date IS NOT NULL
  AND V.CVC_ID = C.CVC_ID
GROUP BY
  CVC_ID;

  
  
SELECT
  C.CVC_ID,
  Cname,
  Pincode,
  District,
  State,
  type,
  COUNT(Dose2_Date) AS Dose2_Count
FROM
  Vaccinated AS V,
  Center_List AS C
WHERE
  Dose2_Date IS NOT NULL
  AND V.CVC_ID = C.CVC_ID
GROUP BY
  CVC_ID;




SELECT
  P.Ref_id,
  Name_,
  (2021 - YOB) AS Age,
  Aadhaar_no,
  Status,
  VA.Name,
  VA.Type,
  VA.Company,
  Cname,
  Dose1_Date,
  Dose2_Date
FROM
  Person AS P,
  vaccinated as V,
  Center_List AS C,
  vaccines As VA
WHERE
  V.Ref_id = P.Ref_id
  AND V.CVC_ID = C.CVC_ID
  AND V.Vaccine_Name = VA.Name;




