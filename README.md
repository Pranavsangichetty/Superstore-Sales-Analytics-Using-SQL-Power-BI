## 📈 Superstore Sales Analysis: End-to-End Project

### Project Overview
This project provides an end-to-end solution for sales performance analysis using the Superstore Dataset. It demonstrates expertise in **data preparation and transformation** using MySQL and comprehensive **business intelligence dashboarding** using Power BI. The goal is to deliver data-driven insights on sales trends, profitability, and customer segmentation to support strategic decision-making.

---

### 📂 Repository Contents
This repository contains the following key files:

| File Name | Type | Description |
| :--- | :--- | :--- |
| `superstore_sql_project.sql` | SQL Script | Contains all the necessary code for database setup, data cleaning, analysis, and creation of optimized database views. |
| `Superstore_Sales_Dashboard.pbix` | Power BI File | The fully interactive dashboard for visualizing KPIs, trends, and geographical performance. |
| `Superstore_Data.csv` | Data Source | The raw Superstore dataset used for the entire analysis (assumed). |

---

### ⚙️ Tech Stack
This project utilizes a robust modern data stack:

| Component | Tool / Language | Purpose |
| :--- | :--- | :--- |
| **Data Backend** | **MySQL** & **SQL** | Used for data storage, cleaning, transformation, and creation of optimized analysis views. |
| **Business Intelligence** | **Microsoft Power BI Desktop** | Primary tool for designing interactive reports and visualizations. |
| **Modeling & Logic** | **DAX** (Data Analysis Expressions) | Used in Power BI for creating complex measures (e.g., Year-over-Year Sales) and custom calculations. |
| **Data Munging** | Power Query (M Language) | Used for initial data connection, import, and minor transformations within Power BI. |

---

### 💾 MySQL Data Preparation & Analysis
The `superstore_sql_project.sql` script is divided into core stages to ensure data quality and analytical readiness:

* **Data Cleaning:**
    * Removal of **duplicate records** using `RowID`.
    * Conversion of text fields (`Order Date`, `Ship Date`) to the proper **DATE** data type.
    * **Trimming** of white spaces from categorical columns (e.g., `City`, `Region`, `Category`).
* **KPI Calculation:** Direct SQL queries calculate fundamental business metrics:
    * Total Sales, Total Profit, Total Orders, and Profit Margin %.
* **Optimized Views:** **Four reusable views** are created to serve the Power BI dashboard, ensuring fast report rendering:
    * `vw_category_sales`, `vw_monthly_sales`, `vw_segment_sales`, and `vw_region_profit`.

---

### 📊 Power BI Dashboard Insights & Features
The `Superstore_Sales_Dashboard.pbix` file offers interactive visualizations across multiple pages:

| Dashboard Page | Key Insights | Visuals Used |
| :--- | :--- | :--- |
| **🏠 Executive Summary** | High-level business health check of all critical **KPIs**. | Card Visuals (KPIs), Gauges. |
| **📊 Sales Performance** | Analysis of **monthly trends** and sales breakdown by product category. | Line Chart, Clustered Bar Chart. |
| **📈 Profitability** | Breakdown of profit by **Segment** and top/bottom product performance. | Stacked Column Chart, Table (Top 10). |
| **🌍 Regional Analysis** | Geographical distribution of sales across different **States and Regions**. | Filled Map Visual. |

---

### 🚀 Setup and How to Run
#### **1. Database Setup (MySQL)**

1.  Open **MySQL Workbench** or your preferred MySQL client.
2.  Execute the `superstore_sql_project.sql` script (Steps 1-3).
3.  Manually import the Superstore CSV data into the `orders` table.
4.  Execute the remaining script sections (Data Cleaning, Analysis, and Views).

#### **2. Dashboard Setup (Power BI)**

1.  Ensure **Power BI Desktop** is installed.
2.  Open the `Superstore_Sales_Dashboard.pbix` file.
3.  *(Optional but Recommended)* To use the cleaned data, update the data source settings in Power BI to connect to the created **MySQL Views**.

---

### 🎯 Future Work
* **Advanced Analytics:** Integrate Python visuals into Power BI to run **sales forecasting** models.
* **Data Pipeline:** Implement **Power Automate** or an equivalent ETL tool to schedule automatic data ingestion and refresh from a live source.
* **Cloud Deployment:** Publish the final report to the **Power BI Service** and enable **Row-Level Security (RLS)** for controlled sharing.
