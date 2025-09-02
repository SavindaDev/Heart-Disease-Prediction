❤️ Heart Disease Prediction – Logistic Regression & Statistical Analysis

This project analyzes a heart disease dataset to understand key predictors of cardiovascular disease and build predictive logistic regression models. Cardiovascular disease is the leading cause of death worldwide, making early detection and risk prediction absolutely crucial.

📊 Dataset Overview

The dataset contains clinical and demographic features commonly associated with heart disease:

- Age: Age of the individual
- Sex: (1 = male, 0 = female)
- cp: Chest pain type (typical angina, atypical angina, non-angina pain, asymptomatic)
- trestbps: Resting blood pressure (mmHg)
- chol: Serum cholesterol (mg/dl)
- fbs: Fasting blood sugar (>120 mg/dl → 1, else 0)
- restecg: Resting electrocardiogram results
- thalach: Maximum heart rate achieved
- exang: Exercise-induced angina (1 = yes, 0 = no)
- oldpeak: ST depression induced by exercise relative to rest
- slope: Slope of peak exercise ST segment
- ca: Number of major vessels (0–3) colored by fluoroscopy
- target: Presence of heart disease (1 = yes, 0 = no)

🔎 Methodology

- Data Preprocessing
  - Handled missing and outlier values.
  - Encoded categorical variables as factors.
  - Explored qualitative predictors using pie charts and quantitative ones with boxplots & descriptive stats.

- Exploratory Analysis
  - Assessed the association of categorical predictors with the target using Chi-square tests.
  - Compared quantitative distributions using t-tests / Mann–Whitney U tests depending on normality.
  - Visualized differences in predictors for patients with vs without heart disease.

- Model Development
  - Logistic Regression was employed as the primary technique.
  - Forward, backward, and stepwise selection used Akaike Information Criterion (AIC) to identify significant predictors.
  - Tested both main effects and interaction terms between predictors.

📈 Key Findings

- Strong predictors included:
  -Chest pain type (cp), ST depression (oldpeak), number of vessels (ca), sex, slope, and exercise-induced angina (exang).
- Sex (male) showed very high predictive weight, though may be affected by imbalance in the dataset.
- Cholesterol and maximum heart rate (thalach) appeared in the model but at lower significance.
- Significant interaction effects included:
  - cp × exang
  - oldpeak × exang
  - sex × thalach
- Some classical risk factors (resting blood pressure, fasting blood sugar) were not significant.

✅ Conclusions

- A logistic regression framework with forward selection (AIC) identified chest pain type, exercise-induced angina, ST depression, fluoroscopy vessels count, sex, and slope as strong predictors.
- Cholesterol and heart rate showed weaker significance in this dataset.
- Dataset limitations include class imbalance (more males than females), potential collinearity, and missing lifestyle factors such as smoking, diet, and exercise.
- Future work: expand dataset, consider additional lifestyle predictors, and compare advanced methods (e.g. Random Forest, XGBoost, Neural Networks).
