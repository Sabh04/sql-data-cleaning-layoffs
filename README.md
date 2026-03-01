# sql-data-cleaning-layoffs
SQL data cleaning project using a real-world layoffs dataset

📌 SQL Data Cleaning Project – Tech Layoffs Dataset


📖 Overview
In this project, I cleaned and prepared a real-world tech layoffs dataset using SQL.
The raw data contained duplicate records, inconsistent formatting, missing values, and incorrect data types. The goal was to transform the dataset into a clean, reliable format suitable for analysis and dashboarding.

________________________________________

🧰 Tools Used
•	SQL (MySQL)
•	Window Functions
•	Common Table Expressions (CTEs)

________________________________________

📂 Dataset Description
The dataset includes information related to company layoffs, including:
•	Company name and location
•	Industry
•	Total and percentage of employees laid off
•	Date of layoffs
•	Company stage and funds raised

________________________________________

🧹 Data Cleaning Process
1. Created Staging Tables
Created staging tables to preserve the original dataset and safely perform data cleaning operations without modifying the raw data.
2. Removed Duplicate Records
Used ROW_NUMBER() with partitioning across relevant fields to identify and remove duplicate entries while retaining a single accurate record per layoff event.
3. Standardized and Cleaned Text Fields
•	Trimmed extra whitespace from company names
•	Standardized industry labels (e.g., consolidating variations of “Crypto”)
•	Cleaned country names by removing trailing characters
4. Converted Data Types
Converted date values stored as text into proper DATE format using STR_TO_DATE() and updated column data types to support accurate time-based analysis.
5. Handled Missing and Null Values
•	Identified missing or blank industry values
•	Used self-joins to populate missing industry data based on matching company records
•	Removed records with no meaningful layoff data (both total and percentage values missing)
6. Removed Temporary Columns
Dropped helper columns used during the duplicate detection process to finalize the cleaned dataset.

________________________________________

📊 Outcome
The final dataset is:
•	Free of duplicate records
•	Consistently formatted across all fields
•	Structured with correct data types
•	Ready for analysis, reporting, or visualization in Excel, Tableau, or Power BI

________________________________________

💼 Skills Demonstrated
•	Data cleaning and standardization using SQL
•	Duplicate detection and removal using window functions
•	Handling missing values and improving data completeness
•	Data type conversion and validation
•	Preparing datasets for downstream analysis and dashboarding

________________________________________

📁 Project Files
•	Portfolio Project 1 - Data Cleaning SP – SQL script used for data cleaning
•	layoffs.csv – Original dataset

