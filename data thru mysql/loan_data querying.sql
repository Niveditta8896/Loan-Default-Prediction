USE loan_project;
SELECT * FROM loan_info LIMIT 5;
SELECT * FROM applicant_info WHERE gender="male";
SELECT Loan_ID, Gender, Married
FROM applicant_info
WHERE education="Graduate";
SELECT * FROM applicant_info;
SELECT DISTINCT Self_Employed FROM  applicant_info; -- to select unique values ina column from a table we use distinct which is equivalent to unique () in python
SELECT DISTINCT education FROM applicant_info;
SELECT Self_Employed,count(Self_Employed)  AS total_applicants
FROM applicant_info
GROUP BY Self_Employed
HAVING Self_Employed="yes";
SELECT education,AVG(ApplicantIncome) AS avg_income
FROM applicant_info
GROUP BY education;

SELECT * FROM loan_info;
SELECT Loan_ID,LoanAmount
FROM loan_info
WHERE LoanAmount > (SELECT AVG(LoanAmount) FROM loan_info);
SELECT Credit_History,COUNT(Credit_History) AS total
FROM loan_info
GROUP BY Credit_History
ORDER BY total DESC
LIMIT 1;

SELECT Property_Area, Loan_Status, LoanAmount
FROM loan_info
WHERE LoanAmount=(SELECT Loan_Status,SUM(LoanAmount) FROM loan_info HAVING Loan_Status="y");

