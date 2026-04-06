# PK/PD Model of Doxorubicin

## Overview
This project extends a basic PK model by linking drug concentration to pharmacodynamic (PD) effect using an Emax model.

## Model
- PK: one-compartment model
- PD: Emax model

E = (Emax * C) / (EC50 + C)

## Parameters
- Emax: 100
- EC50: 2

## Results
- Concentration-time profile
- Effect vs concentration relationship
- Sensitivity to EC50

## Sensitivity Analysis

The effect of EC50 on the pharmacodynamic response was explored.

Lower EC50 values resulted in a stronger effect at lower concentrations, while higher EC50 values reduced drug sensitivity.

![PK Plot](results/pk_plot.png)
![PD Plot](results/pd_plot.png)

## Tools
- R
- ggplot2

## Author
Anna Kalashnikova
