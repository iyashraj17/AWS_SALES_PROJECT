# AWS_SALES_PROJECT

# 📊 SaaS Sales Performance Analytics Dashboard

This is a full end-to-end **Data Analytics Project** built using **MySQL** for data preprocessing and **Power BI** for data visualization. The dashboard delivers actionable insights on **Sales, Profitability, Customer Segments, and Regional Trends** in a SaaS company setup.

---

## 🧠 Problem Statement

> "How can a SaaS company analyze customer and product performance across segments, industries, and regions to drive data-backed decisions?"

---

## 📂 Project Overview

| Stage                  | Tools Used        | Description |
|------------------------|------------------|-------------|
| 🔹 Data Cleaning       | MySQL             | Cleaned raw CSV with missing & malformed fields, created custom fields |
| 🔹 Data Modeling       | Power BI (1 Table) | Defined DAX measures, formatted data types, structured data model |
| 🔹 Dashboard Creation  | Power BI          | Built an interactive dark-themed dashboard with slicers & KPIs |
| 🔹 Deployment (Optional) | Power BI Service | Published to Power BI Cloud with optional public link |

---

## 🧮 Key Metrics & Insights

- 💰 **Total Sales**, 📈 **Total Profit**, 🧾 **Order Volume**, 🎯 **Average Discount**
- 🔍 **Sales Trend over Time**
- 🌍 **Sales by Region**
- 📦 **Sales by Product vs Region**
- 👥 **Top 10 Customers by Sales**
- 🧩 **Segment Performance across Industries**
- 🧭 **Interactive Filters**: Region, Segment, Industry, Product, Date

---

## 📌 DAX Measures Used

```DAX
Total Sales = SUM(cleaned[Sales])
Total Profit = SUM(cleaned[Profit])
Avg Discount = AVERAGE(cleaned[Discount])
Total Orders = COUNT(cleaned[Order ID])
Min Date = MIN(cleaned[order_date_clean])
Max Date = MAX(cleaned[order_date_clean])



 What I Learned
  1.Writing complex SQL queries for cleaning real-world datasets

  2.Building DAX measures to compute custom KPIs

  3.Designing professional, theme-based dashboards

  4.Enhancing user interactivity with slicers, tooltips, and filters

  5.Deploying reports via Power BI Service


