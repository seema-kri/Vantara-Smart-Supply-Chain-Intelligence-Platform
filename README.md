# Vantara — Smart Supply Chain Intelligence Platform

**End-to-end Business Analytics project** analyzing 180,519 supply chain order-line records to uncover revenue, delivery, and customer risks — built with `Python`, `PostgreSQL`, `SQL`, `Excel`, and `Power BI`.

> 📉 Found a Q4 2017 revenue collapse (-56% MoM) hiding behind rising order volume — full 3-year trend otherwise stable.
> 🚚 Found the "fastest" shipping option was actually the least reliable.
> 🔁 Verified true customer loyalty independently across three tools.

Built to demonstrate SQL, Python, and Power BI skills, business analysis judgment, and an AI-assisted workflow for an international analyst role.

![Overview](Screenshots/Overview.png)

---

## Table of Contents

- [Business Problem & Dataset](#business-problem--dataset)
- [Objectives](#objectives)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Methodology](#methodology)
- [Key Insights & Visuals](#key-insights--visuals)
- [Recommendations](#recommendations)
- [How I Used AI](#how-i-used-ai)
- [How to Run](#how-to-run)
- [Future Work](#future-work)
- [Contact](#contact)

---

## Business Problem & Dataset

Vantara's order volume kept growing year over year, but leadership couldn't tell if that growth was actually turning into profit, reliable delivery, or loyal customers. As Business Analyst, I was asked to dig into the order data and answer:

> **"Where is the business losing money and customers — and what should be done about it?"**

**Dataset:** [DataCo Smart Supply Chain for Big Data Analysis](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) (Kaggle)
**Size:** 180,519 order-line records, 53 columns
**Coverage:** Orders, customers, products, shipping, payments, and delivery details from 2015–2018

> Note: "order-line records" (180,519) count each product line on an order separately, while "total orders" (63,629, see dashboard KPIs) counts unique orders — one order can contain several line items.

---

## Objectives

This project was designed to answer five business questions:

1. Where did revenue change unexpectedly over time?
2. Which shipping modes caused the most delivery delays?
3. Which customer segments and regions drove the most value?
4. Which products contributed most to profit?
5. What actions should leadership take to improve performance?

---

## Tools & Technologies

| Category | Tools |
|---|---|
| Data Cleaning | Python (Pandas), Jupyter Notebook |
| Database | PostgreSQL (star schema: 1 fact + 4 dimension tables) |
| Analysis | SQL (joins, CTEs, aggregations) |
| Modeling | Excel (Pivot Tables, Power Pivot, scenario modeling) |
| Visualization | Power BI (DAX measures, custom brand theme) |
| Documentation | BRD, Decisions Log, Findings & Recommendations Report |

---

## Project Structure

```
Vantara-Smart-Supply-Chain-Intelligence-Platform/
│
├── Dashboard/
│   ├── Vantara_Supply_Chain_Dashboard.pbix
│   ├── Vantara_Supply_Chain_Dashboard.pdf
│   └── Screenshots/
│
├── Data/
│   ├── Raw/                              → Original source CSV
│   ├── clean/                            → Cleaned fact + dimension tables
│   └── Vantara_Analysis_Model.xlsx       → Excel pivot model & scenario analysis
│
├── Database/
│   ├── schema.sql
│   └── load_scripts/
│
├── Documentation/
│   ├── BRD.pdf
│   ├── Vantara_Decisions_Log.docx
│   ├── Vantara_Findings_and_Recommendations.docx
│   └── Presentation.pdf
│
├── Notebook/
│   └── Data_Preparation.ipynb
│
├── SQL_Analysis/
│   └── Vantara_Analysis_Queries.sql
│
├── Screenshots/
│   ├── Overview.png
│   ├── Delivery_Performance.png
│   └── Customer_Insights.png
│
└── LICENSE
```

---

## Methodology

**1. Data Preparation**
Loaded the raw supply chain dataset into Python. Cleaned missing values, duplicate records, and inconsistent fields. Standardized column names and transformed the dataset into analysis-ready tables.

**2. Database Modeling**
Designed a star schema in PostgreSQL — one fact table and four dimension tables — and loaded the cleaned tables for scalable SQL analysis.

**3. SQL Analysis**
Wrote SQL queries to calculate KPIs, revenue trends, delivery delays, and customer behavior, using joins, CTEs, groupings, and date logic.

**4. Excel Modeling**
Built pivot-based summary views for cross-checking metrics. Validated repeat customer rate and segment-level lifetime value.

**5. Power BI Dashboarding**
Built a multi-page dashboard with DAX measures and branded visuals, focused on executive KPIs, delivery performance, and customer insights.

---

## Key Insights & Visuals

### 📉 Q4 2017 revenue collapse: $1.03M → $453K in three months (-56%)
Revenue held a steady $900K–$1M/month rhythm for most of the three-year period, then fell sharply from October to December 2017 — despite order volume actually *increasing* in that window. This points to a pricing, discounting, or data quality issue, not falling demand.

### 🚚 55% of all orders arrive late — and the premium option is worst
First Class shipping (the option customers pay more for) has a **95%** late-delivery rate, far above Standard Class. This points to a systemic fulfilment capacity problem, not one weak carrier.

| Delivery Performance | Customer Insights |
|---|---|
| ![Delivery](Screenshots/Delivery_Performance.png) | ![Customers](Screenshots/Customer_Insights.png) |

### 🔁 63.51% repeat customer rate — verified, not assumed
An initial reference estimate of 76% was recalculated independently in SQL, DAX, and Excel — all three agreed on the real number: 63.51%. Customer lifetime value is nearly equal across segments, meaning the Consumer segment leads revenue mainly through volume, not higher spend per customer.

### 💰 Two categories drive nearly a third of all profit
Fishing and Cleats together contribute about 32% of total profit, while several categories contribute very little — a clear signal for where to focus inventory, promotions, and category strategy.

### 📊 Dashboard KPIs at a glance
| Metric | Value |
|---|---|
| Total Revenue | $32.76M |
| Total Orders | 63,629 |
| Repeat Customer Rate | 63.51% |
| Average Fulfilment Time | 3.47 days |
| Profit Margin | 12% |

📄 Full findings: [`Documentation/Vantara_Findings_and_Recommendations.docx`](Documentation/)
📄 Every data decision explained: [`Documentation/Vantara_Decisions_Log.docx`](Documentation/)

---

## Recommendations

1. **Investigate the Q4 2017 revenue collapse** — audit pricing, promotions, and data capture for that period; check whether the drop came from discounting, product mix shifts, or missing records.
2. **Fix premium shipping performance** — review the First Class fulfillment process; rework SLAs, capacity planning, or pricing so premium shipping reflects actual service levels.
3. **Protect high-profit categories** — prioritize inventory and marketing for Fishing and Cleats; review low-margin categories for pricing, sourcing, or discontinuation.
4. **Use repeat customer rate as an executive KPI** — track the verified 63.51% repeat rate monthly, broken down by region and customer segment to spot churn risk early.
5. **Build a late-order risk flag** — identify combinations of shipping mode, region, and product type most likely to be late, and trigger proactive customer communication before delays happen.

---

## How I Used AI

I used an AI coding assistant to speed up repetitive and technical parts of the project:
- Generated starter SQL queries for KPI analysis and customer segmentation.
- Drafted initial Python cleaning and EDA code in Jupyter Notebook.
- Suggested DAX measures and dashboard layout ideas for Power BI.

I then reviewed, corrected, and simplified all outputs manually:
- Adjusted logic to match the actual dataset schema.
- Added business-focused metrics such as late-delivery rate, profit margin, and repeat customer rate.
- Rechecked important calculations across SQL, DAX, and Excel to validate results.

AI accelerated the workflow, but all final insights, logic, and business recommendations were independently verified by me.

---

## How to Run

1. **Clone the repo**
   ```bash
   git clone https://github.com/seema-kri/Vantara-Smart-Supply-Chain-Intelligence-Platform.git
   ```
2. **Data cleaning** — open `Notebook/Data_Preparation.ipynb` in Jupyter and run all cells (source CSV linked above) to regenerate the cleaned tables in `Data/clean`.
3. **Database** — run the schema script in `Database/` against a PostgreSQL instance, then load the cleaned CSVs from `Data/clean` in this order: customers → products → location → date → fact_orders.
4. **SQL analysis** — run the queries in `SQL_Analysis/Vantara_Analysis_Queries.sql` against the database.
5. **Excel model** — open `Data/Vantara_Analysis_Model.xlsx` (Data → Refresh All if reconnected to a live source).
6. **Dashboard** — open `Dashboard/Vantara_Supply_Chain_Dashboard.pbix` in Power BI Desktop; apply the custom theme if needed.

---

## Future Work

- Add marketing spend / CAC data to extend ROI analysis.
- Automate the Python → PostgreSQL pipeline with a scheduled script.
- Publish the dashboard to Power BI Service for live web access.
- Extend the analysis with a second project covering SaaS churn and revenue operations.

---

## Contact

**Seema Kumari**
📧 kriseema87@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/seema-kumari-375763308/) · 💻 [GitHub](https://github.com/seema-kri)

⭐ If this project was useful or interesting, consider starring the repo!
