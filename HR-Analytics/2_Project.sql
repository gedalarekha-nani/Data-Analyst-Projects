CREATE DATABASE healthcare_db;
USE healthcare_db;

CREATE TABLE patient (
    PatientID INT,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Age INT,
    PhoneNumber VARCHAR(20),
    Address TEXT,
    BloodType VARCHAR(5),
    EmergencyContact VARCHAR(100),
    InsuranceProvider VARCHAR(100),
    State VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    PolicyNumber VARCHAR(50),
    MedicalHistory TEXT
);


select * from patient;

SELECT COUNT(*) AS total_patients
FROM Patient;

SELECT COUNT(*) AS total_visits
FROM Visit;

SELECT SUM(cost) AS total_revenue
FROM Treatment;

ALTER TABLE Visit
CHANGE `ï»¿Visit ID` visit_id INT;

ALTER TABLE doctor
CHANGE `ï»¿Doctor ID` doctor_id INT;

ALTER TABLE Visit
CHANGE `Doctor ID` doctor_id INT;

SELECT d.`Doctor Name`, COUNT(v.visit_id) AS total_visits
FROM Visit v
JOIN Doctor d ON v.doctor_id = d.doctor_id
GROUP BY d.`Doctor Name`;

select * from doctor;
select * from visit;
SELECT city, COUNT(*) AS patient_count
FROM Patient
GROUP BY city;

SELECT Diagnosis, COUNT(*) AS Frequency
FROM Visit
GROUP BY Diagnosis
ORDER BY Frequency DESC
LIMIT 5;

SELECT AVG(Cost) AS Avg_Treatment_Cost
FROM Treatment;

select * from visit;
select * from doctor;


