🏦 Loan Default Prediction App

An end-to-end machine learning project to predict loan default. The pipeline includes data extraction, preprocessing, model training (with feature selection), and deployment on AWS using Streamlit.

---

## 🚀 Project Highlights

- 🔍 **Goal:** Predict loan default risk
- 📊 **Model:** RFE + Logistic Regression / XGBoost
- 🖥️ **Frontend:** Streamlit
- ☁️ **Cloud Services:** AWS S3, EC2, SageMaker
- 🛠 **Tools:** scikit-learn, pandas, joblib, boto3

---

✅ Built a full scikit-learn Pipeline combining:
   - ColumnTransformer (StandardScaler + Label/OneHotEncoder)
   - RFE-based feature selection
   - Logistic Regression / XGBoost as final model

---

## 🔄 Workflow Summary

1. ✅ Extracted data from **MySQL**
2. ✅ Performed **feature engineering & model training** on **SageMaker**
3. ✅ Uploaded processed data & model to **AWS S3** using **boto3**
4. ✅ Downloaded assets from S3 into **EC2**
5. ✅ Built and ran **Streamlit app** on EC2 using the final trained pipeline

---

## 🧠 Features Used (after RFE)

- `LoanAmount`  
- `Loan_Amount_Term`  
- `Applicant_log`  
- `CoapplicantIncome_log`  
- `EMI`  
- `Married`  
- `Education`  
- `Property_Area`  
---

## 📁 Folder Structure

├── app/ # Streamlit frontend
│ └── loan_app.py
├── data_extraction from SQL/ # SQL-based extraction scripts
├── data_preprocessing/ # Feature engineering
├── models/ # Final trained models
│ └── loan_default_pipeline.pkl
├── requirements.txt
├── .gitignore
└── README.md
