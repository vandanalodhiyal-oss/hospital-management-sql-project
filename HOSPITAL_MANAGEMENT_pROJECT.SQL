CREATE DATABASE hospital_management;
USE hospital_management;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(30)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    experience INT
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    fees INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

SHOW TABLES;

INSERT INTO patients VALUES
(101,'Aarav',25,'Male','Delhi'),
(102,'Priya',30,'Female','Mumbai'),
(103,'Rohan',22,'Male','Lucknow'),
(104,'Sneha',27,'Female','Pune'),
(105,'Rahul',35,'Male','Jaipur'),
(106,'Anjali',24,'Female','Bhopal'),
(107,'Karan',29,'Male','Chandigarh'),
(108,'Pooja',31,'Female','Indore'),
(109,'Vikas',40,'Male','Noida'),
(110,'Neha',26,'Female','Dehradun'),
(111,'Mohit',28,'Male','Agra'),
(112,'Simran',23,'Female','Patna'),
(113,'Ritika',34,'Female','Kanpur'),
(114,'Amit',32,'Male','Surat'),
(115,'Sakshi',21,'Female','Varanasi');

INSERT INTO doctors VALUES
(1,'Dr. Sharma','Cardiologist',15),
(2,'Dr. Verma','Orthopedic',10),
(3,'Dr. Khan','Dermatologist',8),
(4,'Dr. Gupta','Neurologist',18),
(5,'Dr. Singh','Pediatrician',12),
(6,'Dr. Mehta','ENT',9),
(7,'Dr. Joshi','General Physician',7),
(8,'Dr. Patel','Dentist',11);

INSERT INTO appointments VALUES
(1001,101,1,'2026-07-01',1500),
(1002,102,2,'2026-07-02',1200),
(1003,103,3,'2026-07-03',800),
(1004,104,4,'2026-07-04',2000),
(1005,105,5,'2026-07-05',1000),
(1006,106,6,'2026-07-06',900),
(1007,107,7,'2026-07-07',700),
(1008,108,8,'2026-07-08',1100),
(1009,109,1,'2026-07-09',1500),
(1010,110,2,'2026-07-10',1200),
(1011,111,3,'2026-07-11',800),
(1012,112,4,'2026-07-12',2000),
(1013,113,5,'2026-07-13',1000),
(1014,114,6,'2026-07-14',900),
(1015,115,7,'2026-07-15',700);

SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;

SELECT * 
FROM patients
WHERE gender = 'Female';

SELECT *
FROM patients
WHERE age > 30;

SELECT *
FROM doctors
WHERE experience > 10;

SELECT *
FROM appointments
WHERE fees > 1000;

SELECT *
FROM doctors
ORDER BY experience DESC;

SELECT *
FROM patients
ORDER BY age ASC;

-- Total Patients
SELECT COUNT(*) AS Total_Patients
FROM patients;

-- Total Doctors
SELECT COUNT(*) AS Total_Doctors
FROM doctors;

-- Total Appointments
SELECT COUNT(*) AS Total_Appointments
FROM appointments;

-- Total Revenue
SELECT SUM(fees) AS Total_Revenue
FROM appointments;

-- Average Fees
SELECT AVG(fees) AS Average_Fees
FROM appointments;

-- Highest Fees
SELECT MAX(fees) AS Highest_Fees
FROM appointments;

-- Lowest Fees
SELECT MIN(fees) AS Lowest_Fees
FROM appointments;

-- Number of patients by gender
SELECT gender,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY gender;

-- Revenue by doctor
SELECT doctor_id,
SUM(fees) AS Revenue
FROM appointments
GROUP BY doctor_id;

SELECT patient_name,
age,
CASE
WHEN age < 18 THEN 'Child'
WHEN age BETWEEN 18 AND 30 THEN 'Young'
WHEN age BETWEEN 31 AND 50 THEN 'Adult'
ELSE 'Senior'
END AS Age_Group
FROM patients;

SELECT
p.patient_name,
d.doctor_name,
d.specialization,
a.appointment_date,
a.fees
FROM appointments a
INNER JOIN patients p
ON a.patient_id = p.patient_id
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id;


