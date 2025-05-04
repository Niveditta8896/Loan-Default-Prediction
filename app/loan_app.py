import streamlit as st
import pandas as pd
import joblib
import numpy as np

# Load trained pipeline
pipeline = joblib.load('loan_default_pipeline.pkl')

# Label mapping
label_map = {1: 'Yes', 0: 'No'}

# All required columns from training
all_columns = ['Gender', 'Married', 'Dependents', 'Education', 'Self_Employed',
               'ApplicantIncome', 'CoapplicantIncome', 'LoanAmount', 'Loan_Amount_Term',
               'Credit_History', 'Property_Area', 'Applicant_log', 'CoapplicantIncome_log',
               'LoanAmount_log', 'new_income', 'loan', 'EMI']

# Default values
defaults = {
    'Gender': 'Male',
    'Married': 'Yes',
    'Dependents': 0,
    'Education': 'Graduate',
    'Self_Employed': 'No',
    'ApplicantIncome': 4000,
    'CoapplicantIncome': 1000,
    'LoanAmount': 100,
    'Loan_Amount_Term': 360.0,
    'Credit_History': 1.0,
    'Property_Area': 'Urban',
    'Applicant_log': 8.5,
    'CoapplicantIncome_log': 6.9,
    'LoanAmount_log': 4.5,
    'new_income': 'medium',
    'loan': 'low',
    'EMI': 1500
}

# Streamlit UI
st.title("Loan Default Prediction")

# Collect top 6 inputs
married = st.selectbox("Married", ['Yes', 'No'])
education = st.selectbox("Education", ['Graduate', 'Not Graduate'])
area = st.selectbox("Property Area", ['Urban', 'Semiurban', 'Rural'])

loan_amt = st.number_input("Loan Amount", min_value=0)
loan_term = st.number_input("Loan Term (in months)", value=360)
app_income = st.number_input("Applicant Income", min_value=0)
coapp_income = st.number_input("Coapplicant Income", min_value=0)

if st.button("Predict"):
    # Compute derived features
    app_log = round(np.log1p(app_income), 2)
    coapp_log = round(np.log1p(coapp_income), 2)
    emi = round(loan_amt / 12, 2)

    # Prepare input
    user_input = defaults.copy()
    user_input.update({
        'Married': married,
        'Education': education,
        'Property_Area': area,
        'ApplicantIncome': app_income,
        'CoapplicantIncome': coapp_income,
        'LoanAmount': loan_amt,
        'Loan_Amount_Term': loan_term,
        'Applicant_log': app_log,
        'CoapplicantIncome_log': coapp_log,
        'EMI': emi
    })

    new_data = pd.DataFrame([user_input])
    pred = pipeline.predict(new_data)
    st.success(f"Loan Default Prediction: **{label_map[pred[0]]}**")
