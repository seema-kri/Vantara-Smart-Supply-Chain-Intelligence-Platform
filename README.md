# Vantara — Smart Supply Chain Intelligence Platform

![Python](https://img.shields.io/badge/Python-Pandas-3776AB?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Star_Schema-4169E1?logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Analysis-CC2927?logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-Modeling-217346?logo=microsoftexcel&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

**A full-stack business analytics case study** — from 180,519 raw order-line records to an executive-ready Power BI dashboard — uncovering a hidden revenue collapse, a broken premium-shipping promise, and the true (verified) customer loyalty rate behind Vantara's supply chain.

> Built to demonstrate SQL, Python, and Power BI fluency, business-first analytical judgment, and a transparent AI-assisted workflow — for analyst roles at an international standard.

![Overview](Screenshots/Overview.png)

---

## TL;DR

| Question asked | Answer found | Business impact |
|---|---|---|
| Is revenue growth real? | No — Q4 2017 revenue fell **-56% MoM** ($1.03M → $453K) while order volume rose | Signals a pricing/discounting or data-integrity failure, not a demand problem |
| Which shipping mode is best? | **First Class** (the premium, paid-for option) has a **95% late-delivery rate** — worse than Standard | The service customers pay a premium for is the least reliable one |
| How loyal are customers, really? | **63.51%** repeat rate — independently verified in SQL, DAX, and Excel (vs. an unverified 76% assumption) | Reveals the "true north" loyalty KPI leadership can actually trust |
| Where does profit come from? | **Fishing + Cleats = ~32%** of total profit | Tells leadership exactly where to defend margin |

---

## Table of Contents

- [Business Problem & Dataset](#business-problem--dataset)
- [Objectives](#objectives)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Methodology](#methodology)
- [Key Insights & Visuals](#key-insights--visuals)
- [Recommendations](#recommendations)
- [Skills Demonstrated](#skills-demonstrated)
- [How I Used AI](#how-i-used-ai)
- [How to Run](#how-to-run)
- [Future Work](#future-work)
- [Contact](#contact)

---

## Business Problem & Dataset

Vantara's order volume kept growing year over year, but leadership had no clear view of whether that growth was translating into profit, reliable delivery, or genuine customer loyalty. As Business Analyst, I was asked to investigate the underlying data and answer one question:

> **"Where is the business losing money and customers — and what should be done about it?"**

**Dataset:** [DataCo Smart Supply Chain for Big Data Analysis](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) (Kaggle)
**Size:** 180,519 order-line records · 53 columns
**Coverage:** Orders, customers, products, shipping, and payments, 2015–2018

> *Note: 180,519 "order-line" records count each product line on an order separately. "Total orders" (63,629 — see KPIs below) counts unique orders, since one order can span several line items.*

---

## Objectives

1. Where did revenue change unexpectedly over time?
2. Which shipping modes caused the most delivery delays?
3. Which customer segments and regions drove the most value?
4. Which products contributed most to profit?
5. What actions should leadership take to improve performance?

---

## Tools & Technologies

| Layer | Tools | Purpose |
|---|---|---|
| Data Cleaning | Python (Pandas), Jupyter | Deduplicate, standardize, structure raw data |
| Database | PostgreSQL | Star schema — 1 fact + 4 dimension tables |
| Analysis | SQL | Joins, CTEs, window functions, KPI aggregation |
| Modeling | Excel | Pivot tables, Power Pivot, independent cross-checks |
| Visualization | Power BI | DAX measures, branded executive dashboard |
| Documentation | BRD, Decisions Log, Findings Report | Audit trail for every analytical choice |

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

**1. Data Preparation** — Loaded the raw dataset into Python; cleaned missing values, duplicates, and inconsistent fields; standardized column names into analysis-ready tables.

**2. Database Modeling** — Designed a star schema in PostgreSQL (one fact table, four dimension tables) for scalable SQL analysis.

**3. SQL Analysis** — Calculated KPIs, revenue trends, delivery delays, and customer behavior using joins, CTEs, groupings, and date logic.

**4. Excel Modeling** — Built independent pivot-based views to cross-check every headline metric before it reached the dashboard.

**5. Power BI Dashboarding** — Built a multi-page, DAX-driven dashboard with a custom brand theme, focused on executive KPIs, delivery performance, and customer insight.

---

## Key Insights & Visuals

### 📉 The Q4 2017 revenue collapse: $1.03M → $453K in three months (-56%)
Revenue held a steady $900K–$1M/month rhythm across most of the three-year window, then fell sharply from October to December 2017 — **while order volume was rising**. Growth in top-line activity was masking a collapse in realized revenue: a strong signal of a pricing, discounting, or data-capture failure, not falling demand.

### 🚚 55% of all orders arrive late — and the premium option is the worst offender
First Class shipping — the option customers pay more for — carries a **95% late-delivery rate**, far above Standard Class. This is not one underperforming carrier; it's a systemic fulfilment capacity problem sitting directly under Vantara's most expensive promise to customers.

| Delivery Performance | Customer Insights |
|---|---|
| ![Delivery](Screenshots/Delivery%20Performance.png)
![Customers](Screenshots/Customer%20Insights.png) |

### 🔁 63.51% repeat customer rate — verified, not assumed
A reference estimate of 76% was recalculated independently in SQL, DAX, and Excel. All three converged on the same real number: **63.51%**. Customer lifetime value is nearly flat across segments — Consumer's revenue lead comes from volume, not from higher spend per customer.

### 💰 Two categories quietly drive a third of all profit
Fishing and Cleats together contribute ~32% of total profit, while several categories contribute almost nothing — a direct, data-backed signal for where to focus inventory, promotion, and category strategy.

### 📊 Executive KPIs
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

1. **Investigate the Q4 2017 revenue collapse.** Audit pricing, promotions, and data capture for that window; determine whether the drop stems from discounting, product-mix shifts, or missing records.
2. **Fix premium shipping performance.** Re-examine the First Class fulfilment process; rework SLAs, capacity planning, or pricing so premium shipping reflects an actual premium service level.
3. **Protect the high-profit core.** Prioritize inventory and marketing spend on Fishing and Cleats; reassess low-margin categories for pricing, sourcing, or discontinuation.
4. **Make repeat customer rate an executive KPI.** Track the verified 63.51% monthly, segmented by region and customer type, to catch churn risk early.
5. **Build a late-order risk flag.** Identify shipping-mode / region / product-type combinations most prone to delay, and trigger proactive customer communication ahead of time.

---

## Skills Demonstrated

- **End-to-end data pipeline ownership** — raw CSV → cleaned relational model → SQL analysis → BI dashboard
- **Relational database design** — star schema modeling in PostgreSQL
- **Advanced SQL** — CTEs, joins, date-based aggregation, KPI derivation
- **Cross-tool validation** — independently re-deriving the same KPI in SQL, DAX, and Excel before trusting it
- **Executive communication** — translating technical findings into a five-point action plan for leadership
- **Transparent AI-assisted workflow** — using AI to accelerate scaffolding, while independently verifying every number

---

## How I Used AI

I used an AI coding assistant to accelerate the repetitive, technical parts of this project:
- Generated starter SQL queries for KPI analysis and customer segmentation.
- Drafted initial Python cleaning and EDA code in Jupyter Notebook.
- Suggested DAX measures and dashboard layout ideas for Power BI.

I then reviewed, corrected, and simplified all of it myself:
- Adjusted logic to match the actual dataset schema.
- Added business-focused metrics such as late-delivery rate, profit margin, and repeat customer rate.
- Rechecked every important calculation across SQL, DAX, and Excel to validate the result.

AI accelerated the workflow — every final insight, calculation, and recommendation was independently verified by me.

---

## How to Run

1. **Clone the repo**
   ```bash
   git clone https://github.com/seema-kri/Vantara-Smart-Supply-Chain-Intelligence-Platform.git
   ```
2. **Data cleaning** — open `Notebook/Data_Preparation.ipynb` in Jupyter and run all cells to regenerate the cleaned tables in `Data/clean`.
3. **Database** — run the schema script in `Database/` against a PostgreSQL instance, then load the cleaned CSVs from `Data/clean` in this order: `customers → products → location → date → fact_orders`.
4. **SQL analysis** — run `SQL_Analysis/Vantara_Analysis_Queries.sql` against the database.
5. **Excel model** — open `Data/Vantara_Analysis_Model.xlsx` (Data → Refresh All if reconnected to a live source).
6. **Dashboard** — open `Dashboard/Vantara_Supply_Chain_Dashboard.pbix` in Power BI Desktop; apply the custom theme if needed.

---

## Future Work

- Add marketing spend / CAC data to extend into full ROI analysis.
- Automate the Python → PostgreSQL pipeline with a scheduled job.
- Publish the dashboard to Power BI Service for live web access.
- Extend the portfolio with a second project covering SaaS churn and revenue operations.

---

## Contact

**Seema Kumari**
📧 kriseema87@gmail.com · 🔗 [LinkedIn](https://linkedin.com/in/seema-kumari-375763308/) · 💻 [GitHub](https://github.com/seema-kri)

⭐ If this project was useful or interesting, a star on the repo is always appreciated.
