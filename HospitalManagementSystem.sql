-- 1. CREATE DATABASE
CREATE DATABASE HospitalDB;
GO
USE HospitalDB;
GO

-- 2. CREATE TABLES

-- Departments
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Floor INT
);

-- Doctors
CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Email NVARCHAR(100),
    Phone NVARCHAR(15)
);

-- Patients
CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    DateOfBirth DATE
);

-- Staff
CREATE TABLE Staff (
    StaffID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(50),
    Email NVARCHAR(100)
);

-- Appointments
CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    AppointmentDate DATE DEFAULT GETDATE(),
    Diagnosis NVARCHAR(200),
    Status NVARCHAR(50) DEFAULT 'Scheduled'
);

-- =====================
-- 3. INSERT SAMPLE DATA
-- =====================

-- Departments
INSERT INTO Departments (Name, Floor) VALUES
('Cardiology', 2),
('Pediatrics', 3),
('Neurology', 4);

-- Doctors
INSERT INTO Doctors (Name, DepartmentID, Email, Phone) VALUES
('Dr. John Smith', 1, 'john.smith@hospital.com', '1234567890'),
('Dr. Alice Brown', 2, 'alice.brown@hospital.com', '2345678901'),
('Dr. Bob Lee', 3, 'bob.lee@hospital.com', '3456789012');

-- Patients
INSERT INTO Patients (Name, Email, Phone, DateOfBirth) VALUES
('Michael Johnson', 'michael@example.com', '4567890123', '1985-05-12'),
('Sara Davis', 'sara@example.com', '5678901234', '1992-08-22');

-- Staff
INSERT INTO Staff (Name, Position, Email) VALUES
('Nurse Mary', 'Head Nurse', 'mary@hospital.com'),
('Admin Tom', 'Receptionist', 'tom@hospital.com');

-- Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Diagnosis, Status) VALUES
(1, 1, '2026-02-10', 'High blood pressure', 'Completed'),
(2, 2, '2026-02-12', NULL, 'Scheduled');

-- =====================
-- 4. CRUD & REPORT QUERIES
-- =====================

-- View all appointments with patient and doctor info
SELECT a.AppointmentID, p.Name AS Patient, d.Name AS Doctor, dep.Name AS Department, a.AppointmentDate, a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Departments dep ON d.DepartmentID = dep.DepartmentID;

-- Add a new appointment
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate) VALUES (2, 3, '2026-02-15');

-- Update appointment status
UPDATE Appointments
SET Status = 'Completed', Diagnosis = 'Migraine'
WHERE AppointmentID = 2;

-- Delete a staff member
DELETE FROM Staff
WHERE StaffID = 2;

-- Patients with upcoming appointments
SELECT p.Name AS Patient, d.Name AS Doctor, a.AppointmentDate
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE a.Status = 'Scheduled';

-- Doctors with number of appointments
SELECT d.Name AS Doctor, COUNT(*) AS NumAppointments
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
GROUP BY d.Name
ORDER BY NumAppointments DESC;
