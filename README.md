# HR Data Analysis Project (SQL + Power BI)

## 📌 Project Overview
This project focuses on analyzing Human Resources (HR) employee data using SQL to extract meaningful insights about workforce demographics, employee distribution, attrition trends, and departmental performance.  
The cleaned and analyzed dataset is visualized using Power BI to create an interactive HR dashboard.

This project helps organizations understand employee structure and make data-driven HR decisions.

---

## 🎯 Objectives
- To clean and preprocess raw HR employee data
- To analyze employee demographics (gender, race, age groups)
- To study employee distribution across departments, job roles, and locations
- To calculate turnover rate and termination trends
- To analyze employee growth over time
- To calculate tenure distribution across departments
- To create interactive dashboards using Power BI

---

## 🛠 Tools & Technologies Used
- **MySQL** (Data Cleaning and Query Execution)
- **Power BI** (Dashboard Creation)
- **CSV Export** (Query results stored as CSV files)
- **GitHub** (Version control and documentation)

---

## 📂 Dataset Description
The dataset includes:
- Employee ID
- Gender
- Race / Ethnicity
- Birthdate
- Hire Date
- Termination Date
- Department
- Job Title
- Location (Headquarters / Remote)
- State

---

## 🧹 Data Cleaning Process (SQL)
The following cleaning steps were performed:
- Renamed incorrect column (`ï»¿id`) to `emp_id`
- Standardized date formats for `birthdate`, `hire_date`, and `termdate`
- Converted date columns into proper DATE datatype
- Added a new column `age`
- Calculated employee age using birthdate
- Checked invalid values such as negative age and future birthdates

---

## ⚠️ Key Filter Condition Used
Most analysis queries use:

```sql
WHERE age >= 18 AND termdate = '0000-00-00'
