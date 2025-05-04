USE loan_project;
SELECT * FROM loan_info;
SELECT Loan_ID,LoanAmount
FROM loan_info
WHERE LoanAmount>(SELECT AVG(LoanAmount) FROM loan_info);
SELECT AVG(LoanAmount) FROM loan_info;
SELECT DISTINCT Credit_History FROM  loan_info; -- gives the unique values in that field.

SELECT  Loan_ID,Credit_History
FROM loan_info
WHERE Credit_History = (SELECT Credit_History
FROM loan_info
GROUP BY Credit_History
ORDER BY COUNT(Credit_History)  DESC
LIMIT 1);

SELECT Credit_History
FROM loan_info
GROUP BY Credit_History;
SELECT LoanAmount, Property_Area
FROM loan_info
GROUP BY Property_Area;


