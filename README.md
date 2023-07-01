# Sales-RFM-Analysis

## Introduction
This repository contains a SQL code script for performing data analysis on sales data. The code focuses on exploring and analyzing the sales data to derive insights about product performance, sales trends, customer segmentation, and associations between products. The analysis is performed on the "sales_data_sample" table.

The goal of this project is to gain insights into the sales data and understand various aspects such as product performance, sales trends, customer behavior, and associations between products. By performing the analysis outlined in the code, we aim to extract valuable information that can aid in decision-making, marketing strategies, and improving overall sales performance.

Link to dataset: https://www.kaggle.com/datasets/kumarraviranjan/sales-data

## Overview of Sections
The code is divided into several sections, each serving a specific purpose. Here's a brief overview of each section:

1. <h4>Inspecting data:</h4>This section displays the contents of the "sales_data_sample" table to get an overview of the data.

2. <h4>Checking distinct values:</h4> This section retrieves the distinct values in various columns of the "sales_data_sample" table to understand the unique values present.

3. <h4>Grouping sales by productline:</h4> This section calculates the total revenue for each product line by grouping the sales data based on the product line column.

4. <h4>Grouping sales by year:</h4> This section calculates the total revenue for each year by grouping the sales data based on the year column.

5. <h4>Checking 2005 months in operation:</h4> This section retrieves the distinct month values for the year 2005 to understand the months in which sales operations were active.

6. <h4>Grouping sales by deal size:</h4> This section calculates the total revenue for each deal size by grouping the sales data based on the deal size column.

7. <h4>Identifying the best month for sales and revenue:</h4> This section identifies the best month for sales and revenue by calculating the total sales and order frequency for each month in the year 2003.

8. <h4>Checking the hypothesis:</h4> This section further investigates the hypothesis by analyzing the sales data for the month of November in 2003, specifically focusing on the product line with the highest sales revenue.

9. <h4>RFM Analysis:</h4> This section performs RFM (Recency, Frequency, Monetary Value) analysis on the sales data to identify the best customer. It calculates metrics such as monetary value, frequency, and recency, and assigns RFM scores to each customer.

10. <h4>Segmentations:</h4> This section assigns segmentation labels to customers based on their RFM scores, categorizing them into different segments.

11. <h4>Products that are often sold together:</h4> This section identifies products that are frequently sold together by analyzing the order data and finding orders with two items.

## Tableau Dashboard
For a visual representation of the insights gained from this analysis, Tableau dashboards have been created. You can access them at the following link:https://public.tableau.com/app/profile/matthew.browning

## Requirements
To run the SQL code and perform the sales data analysis, the following requirements should be met:

- Access to a SQL database system (e.g., MySQL, PostgreSQL, SQL Server) to execute the SQL queries.
- The sales data should be available in a table named "sales_data_sample" within the database.
- Link to the dataset: https://www.kaggle.com/datasets/kumarraviranjan/sales-data
- A SQL client or an integrated development environment (IDE) with SQL support to execute the code.
- Please ensure that the database connection details and table structure are correctly configured before running the code.
