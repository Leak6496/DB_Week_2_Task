DROP TABLE IF EXISTS TEAMREGISTRATION;
DROP TABLE IF EXISTS TEAMENTRY;
DROP TABLE IF EXISTS PLAYER;
DROP TABLE IF EXISTS CLUB;
DROP TABLE IF EXISTS SEASON;



CREATE TABLE PLAYER (PlayerID numeric
, Fname nvarchar(100) Not Null
,Lname nvarchar(100) Not Null
, Phone nvarchar(50)
,Primary Key (PlayerID));

CREATE TABLE CLUB (ClubName nvarchar(100)
, ContactName nvarchar(100)
, Primary Key(ClubName));

CREATE TABLE SEASON (Year numeric
, SeasonName nvarchar(6)
, Primary Key(Year,SeasonName)
, CHECK (SeasonName in ('Winter','Summer'))
,
);

CREATE TABLE TEAMENTRY (
ClubName NVARCHAR(100)
, Year NUMERIC
, SeasonName NVARCHAR(6)
, AgeGroup   NVARCHAR(3)
, TeamNumber   NUMERIC
, PRIMARY KEY(ClubName,Year,SeasonName,AgeGroup,TeamNumber)
, FOREIGN KEY(ClubName) REFERENCES CLUB
, FOREIGN KEY(Year,SeasonName) REFERENCES SEASON

);

CREATE TABLE PlayerRegistration(
PlayerID numeric
, ClubName  nvarchar(100)
, Year  NUMERIC
, SeasonName NVARCHAR(6)
, AgeGroup  NVARCHAR(3)
,TeamNumber numeric
,DateRegistered DATE
,PRIMARY KEY (PlayerID, ClubName,Year,SeasonName, AgeGroup,TeamNumber)
, FOREIGN KEY(PlayerID) REFERENCES PLAYER
, FOREIGN KEY(ClubName,Year,SeasonName,AgeGroup,TeamNumber) REFERENCES TEAMENTRY

);

INSERT INTO CLUB(ClubName,ContactName) VALUES('Mt Martha Basketball Club','Bob Jane');
INSERT INTO SEASON(Year,SeasonName) VALUES (2018,'Winter');
INSERT INTO SEASON(Year,SeasonName) VALUES (2018, 'Summer');
INSERT INTO TEAMENTRY(ClubName,Year,SeasonName,AgeGroup,TeamNumber) VALUES('Mt Martha Basketball Club',2018,'Summer','U14',1);
INSERT INTO TEAMENTRY(ClubName,Year,SeasonName,AgeGroup,TeamNumber) VALUES('Mt Martha Basketball Club',2018,'Summer','U14',2);
INSERT INTO PlAYER(PlayerID,Fname,Lname,Phone) VALUES(10002,'John','Howard','5552345');
INSERT INTO PLAYER(PlayerID,Fname,Lname,Phone) VALUES(10003,'Julia','Gillard','5553456');

SELECT table_name
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE='BASE TABLE'