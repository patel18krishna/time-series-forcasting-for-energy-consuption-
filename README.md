# Time Series Forecasting with XGBoost

This R script demonstrates a time series forecasting approach using the XGBoost algorithm. The goal is to predict power consumption based on various input features such as temperature, humidity, wind speed, general diffuse flows, and diffuse flows.

##Data
Ensure that your data is in CSV format and includes a column named DateTime for the timestamp, and columns for "Temperature", "Humidity", "Wind.Speed", "general.diffuse.flows", "diffuse.flows", and "Zone.1.Power.Consumption".

## Getting Started

### Prerequisites

Make sure to have the following R libraries installed:

```R
install.packages("forecast")
install.packages("xgboost")
