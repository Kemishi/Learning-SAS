# SAS Workflow: Energy, Depth, and n Analysis

## Overview

This repository contains SAS scripts and outputs for analyzing the relationship between compaction energy, measured depth, and the empirical coefficient (n). The workflow includes data ingestion, cleaning, descriptive statistics, correlation analysis, regression modeling, and visualization.

## Repository Structure

/code: SAS scripts for each step of the workflow.

/data: Input datasets (Excel files).

/outputs: Generated tables, figures, and statistical results (PDFs).

README.md: Documentation of workflow, results, and interpretation.

Workflow Steps

## 1. Data Ingestion & Cleaning

Import Excel dataset using PROC IMPORT.

Forward-fill missing Box IDs.

Rename variables for clarity:

depth → Measured Depth

energy_val → Compaction Energy

n_val → Empirical Coefficient

Create log-transformed variable log_n.

## 2. Descriptive Statistics

PROC MEANS generates summary statistics.

Key Results:

energy_val: Mean ≈ 17.25, Std Dev ≈ 3.18

depth: Mean ≈ 5.00, Std Dev ≈ 0.40

n_val: Mean ≈ 1.22, Std Dev ≈ 0.15

## 3. Correlation Analysis

PROC CORR with Spearman correlation.

Findings:

n_val vs energy_val: Strong negative correlation (-0.75, p < .0001)

n_val vs depth: Strong positive correlation (+0.63, p < .0001)

## 4. Regression Modeling

PROC REG with collinearity diagnostics.

Model Equation: [ n = 0.6108 - 0.0354 \cdot energy_val + 0.2438 \cdot depth ]

R² = 0.9922, Adj R² = 0.9918 → Excellent fit.

No multicollinearity detected (VIF = 1).

## 5. Visualization

Scatter plots with regression lines (PROC SGPLOT).

Box plots comparing n_val across energy scenarios.

Probability density functions (PROC UNIVARIATE) with normal and kernel fits.

Scenario Comparisons

S1 (Min Energy): Mean n ≈ 1.37

S2 (Max Energy): Mean n ≈ 1.08

S3 (H/L): Mean n ≈ 1.15

S4 (L/H): Mean n ≈ 1.28

## Interpretation

Higher compaction energy reduces n_val.

Greater depth increases n_val.

Regression confirms both predictors are highly significant.

Distribution analysis shows scenario-dependent shifts in n_val.

## How to Reproduce

Place the Excel dataset in /data.

Run the SAS script in /code.

Outputs will be generated in /outputs.
