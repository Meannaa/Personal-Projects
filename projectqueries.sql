USE mydb;
-- Drop existing views if they exist
DROP VIEW IF EXISTS View_Crime_Incident;
DROP VIEW IF EXISTS View_Incident_Police_District;
DROP VIEW IF EXISTS View_Incident_Date;
DROP VIEW IF EXISTS View_Location_Incident;
DROP VIEW IF EXISTS View_Filter_Incidents_By_Date;
DROP VIEW IF EXISTS View_Filter_Crimes_By_NIBRS;
DROP VIEW IF EXISTS View_Count_Incidents_Per_Crime;
DROP VIEW IF EXISTS View_Avg_Victims_Per_Crime;
DROP VIEW IF EXISTS View_Incident_Crime_Offense;
DROP VIEW IF EXISTS View_Incidents_With_Multiple_Offenses;
DROP VIEW IF EXISTS View_Incidents_With_High_Victim_Crimes;
-- Recreate the views
-- Query 1: Join Crime and Incident tables
CREATE VIEW View_Crime_Incident AS
SELECT c.CRNumber, c.Crime_name_1, i.IncidentID, i.Start_Date_Time,
i.End_Date_Time
FROM Crime c
JOIN Incident i ON c.CRNumber = i.Crime_CRNumber;
-- Query 2: Join Incident and Police_District tables
CREATE VIEW View_Incident_Police_District AS
SELECT i.IncidentID, i.Start_Date_Time, pd.District_Name
FROM Incident i
JOIN Police_District pd ON i.Police_District_District_number =
pd.District_number;
-- Query 3: Join Incident and Date tables
CREATE VIEW View_Incident_Date AS
SELECT i.IncidentID, i.Start_Date_Time, d.Date, d.Time
FROM Incident i
JOIN Date d ON i.Date_DateID = d.DateID;
-- Query 4: Join Location and Incident tables
CREATE VIEW View_Location_Incident AS
SELECT l.Street_Address, l.Zipcode, i.IncidentID, i.Start_Date_Time
FROM Location l
JOIN Incident i ON l.Incident_IncidentID = i.IncidentID AND
l.Incident_Crime_CRNumber = i.Crime_CRNumber;
-- Query 5: Filter Incidents by Date
CREATE VIEW View_Filter_Incidents_By_Date AS
SELECT IncidentID, Start_Date_Time, End_Date_Time
FROM Incident
WHERE Start_Date_Time BETWEEN '2018-01-01' AND '2020-12-31';
-- Query 6: Filter Crimes by NIBRS Code
CREATE VIEW View_Filter_Crimes_By_NIBRS AS
SELECT CRNumber, Crime_name_1, NIBRS_Code
FROM Crime
WHERE NIBRS_Code = 23;
-- Query 7: Count Incidents per Crime Type
CREATE VIEW View_Count_Incidents_Per_Crime AS
SELECT c.Crime_name_1, COUNT(i.IncidentID) AS Incident_Count
FROM Crime c
JOIN Incident i ON c.CRNumber = i.Crime_CRNumber
GROUP BY c.Crime_name_1;
-- Query 8: Average Number of Victims per Crime
CREATE VIEW View_Avg_Victims_Per_Crime AS
SELECT c.Crime_name_1, AVG(c.Victim_Count) AS Avg_Victims
FROM Crime c
GROUP BY c.Crime_name_1;
-- Query 9: Join Incident, Crime, and Offense tables
CREATE VIEW View_Incident_Crime_Offense AS
SELECT i.IncidentID, c.Crime_name_1, o.Description
FROM Incident_has_Offense ih
JOIN Incident i ON ih.Incident_IncidentID = i.IncidentID AND
ih.Incident_Crime_CRNumber = i.Crime_CRNumber
JOIN Crime c ON i.Crime_CRNumber = c.CRNumber
JOIN Offense o ON ih.Offense_Offense_code = o.Offense_code;
-- Query 10: Incidents with more than one Offense
CREATE VIEW View_Incidents_With_Multiple_Offenses AS
SELECT i.IncidentID, COUNT(ih.Offense_Offense_code) AS Offense_Count
FROM Incident i
JOIN Incident_has_Offense ih ON i.IncidentID = ih.Incident_IncidentID AND
i.Crime_CRNumber = ih.Incident_Crime_CRNumber
GROUP BY i.IncidentID
HAVING Offense_Count > 1;
-- Query 11: Subquery to find Incidents with Crime having Victim_Count > 1
CREATE VIEW View_Incidents_With_High_Victim_Crimes AS
SELECT i.IncidentID, i.Start_Date_Time, i.End_Date_Time
FROM Incident i
WHERE i.Crime_CRNumber IN (
SELECT c.CRNumber
FROM Crime c
WHERE c.Victim_Count > 1
);