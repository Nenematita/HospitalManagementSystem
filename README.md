## Hospital Management System

## Overview
This is a **Hospital Management System** implemented using **SQL Server (T-SQL)**.  
It is a mock project designed for academic purposes (finals submission) and demonstrates the use of **database creation, table relationships, CRUD operations, and reporting queries**.

The system manages:

- **Departments**: Hospital departments such as Cardiology, Pediatrics, etc.  
- **Doctors**: Doctor information and department association  
- **Patients**: Patient details and medical records  
- **Staff**: Hospital staff (nurses, receptionists, etc.)  
- **Appointments**: Tracks patient appointments with doctors  

---

## Database Structure

### Tables

| Table         | Description |
|---------------|-------------|
| Departments   | Stores hospital departments (DepartmentID, Name, Floor) |
| Doctors       | Stores doctors (DoctorID, Name, DepartmentID, Email, Phone) |
| Patients      | Stores patient information (PatientID, Name, Email, Phone, DateOfBirth) |
| Staff         | Stores hospital staff (StaffID, Name, Position, Email) |
| Appointments  | Tracks appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Diagnosis, Status) |

---

## Files

- `create_tables.sql` – Contains all `CREATE DATABASE` and `CREATE TABLE` statements  
- `insert_data.sql` – Contains sample `INSERT` statements to populate tables  
- `queries.sql` – Contains CRUD operations and advanced reporting queries (e.g., upcoming appointments, doctor workloads)  

---

## Features / Queries

- View all appointments with patient, doctor, and department details  
- Add, update, and delete records  
- Track upcoming and completed appointments  
- Generate reports such as number of appointments per doctor  

---

## How to Use

1. Open **SQL Server Management Studio (SSMS)**.  
2. Create a new query and paste the SQL scripts in the following order:
   1. `create_tables.sql`  
   2. `insert_data.sql`  
   3. `queries.sql`  
3. Execute the scripts.  
4. The database `HospitalDB` with all tables, sample data, and queries will be ready.  

---

## Notes

- This project uses **T-SQL (SQL Server syntax)**. Some syntax (like `IDENTITY` for auto-increment and `GETDATE()` for current date) may need adjustment for other SQL systems.  
- The project is intended for learning and demonstration purposes only.  

---

## Author

- Nene Matitaishvili
- Academic Project / Finals Submission
