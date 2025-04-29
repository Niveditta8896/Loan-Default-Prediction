CREATE DATABASE loan_project;
USE loan_project;
CREATE table applicant_info(
loan_id VARCHAR(20) UNIQUE PRIMARY KEY,
Gender VARCHAR(10),
Married VARCHAR(10),
dependents VARCHAR(10),
education VARCHAR(20),
Self_Employed VARCHAR(10),
ApplicantIncome FLOAT,
CoapplicantIncome FLOAT
);
CREATE TABLE loan_info(
Loan_ID VARCHAR(20),
LoanAmount INT,
Loan_Amount_Term INT,
Credit_History FLOAT,
Property_Area VARCHAR(20),
Loan_Status VARCHAR(5),
FOREIGN KEY(loan_id) REFERENCES applicant_info(loan_id));
# then we r going to load the data to these tables
USE loan_project;


SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/applicant_info.csv'
INTO TABLE applicant_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DESC applicant_info;


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/loan_info.csv"
INTO TABLE loan_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;