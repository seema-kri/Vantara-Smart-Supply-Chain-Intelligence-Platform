# Vantara — Smart Supply Chain Intelligence Platform

**A full-stack business analytics case study: from 180,519 raw order-line records to an executive-ready Power BI dashboard, uncovering a hidden revenue collapse, a broken premium-shipping promise, and the true, verified customer loyalty rate behind Vantara's supply chain.**

![Python](https://img.shields.io/badge/Python-Pandas-3776AB?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Star_Schema-4169E1?logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Analysis-CC2927?logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-Modeling-217346?logo=microsoftexcel&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

Built to demonstrate SQL, Python, and Power BI fluency, business-first analytical judgment, and a transparent AI-assisted workflow, for analyst roles at an international standard.

📄 [Business Requirements Document](Documentation/BRD.pdf) &nbsp;|&nbsp; 📑 [Findings & Recommendations](Documentation/Vantara_Findings_and_Recommendations.docx) &nbsp;|&nbsp; 📋 [Decisions Log](Documentation/Vantara_Decisions_Log.docx) &nbsp;|&nbsp; 📽️ [Presentation](Documentation/Presentation.pdf)

![Overview](Screenshots/Overview.png)

---

## Table of Contents

- [Executive Summary](#executive-summary)
- [Business Problem & Dataset](#business-problem--dataset)
- [Objectives](#objectives)
- [Project Deliverables](#project-deliverables)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Methodology](#methodology)
- [Key Insights & Visuals](#key-insights--visuals)
- [Executive KPIs](#executive-kpis)
- [Recommendations](#recommendations)
- [Skills Demonstrated](#skills-demonstrated)
- [How I Used AI](#how-i-used-ai)
- [How to Run](#how-to-run)
- [Future Work](#future-work)
- [Contact](#contact)

---

## Executive Summary

Vantara's order volume kept growing year over year, but leadership had no clear view of whether that growth was translating into profit, reliable delivery, or genuine customer loyalty. This engagement was run as a full analyst investigation, starting with a formal Business Requirements Document, not a spreadsheet, and answering one question with data: **where is the business losing money and customers, and what should be done about it.**

| Question asked | Answer found | Business impact |
|---|---|---|
| Is revenue growth real? | No. Q4 2017 revenue fell **-56% MoM** ($1.03M to $453K) while order volume rose | Signals a pricing/discounting or data-integrity failure, not a demand problem |
| Which shipping mode is best? | **First Class** (the premium, paid-for option) has a **95% late-delivery rate**, worse than Standard | The service customers pay a premium for is the least reliable one |
| How loyal are customers, really? | **63.51%** repeat rate, independently verified in SQL, DAX, and Excel (vs. an unverified 76% assumption) | Reveals the "true north" loyalty KPI leadership can actually trust |
| Where does profit come from? | **Fishing + Cleats = approximately 32%** of total profit | Tells leadership exactly where to defend margin |

## Business Problem & Dataset

Vantara's order volume kept growing year over year, but leadership had no clear view of whether that growth was translating into profit, reliable delivery, or genuine customer loyalty. As Business Analyst, the task was to investigate the underlying data and answer one question:

> **"Where is the business losing money and customers, and what should be done about it?"**

**Dataset:** [DataCo Smart Supply Chain for Big Data Analysis](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) (Kaggle)
**Size:** 180,519 order-line records, 53 columns
**Coverage:** Orders, customers, products, shipping, and payments, 2015 to 2018

> *Note: 180,519 "order-line" records count each product line on an order separately. "Total orders" (63,629, see Executive KPIs below) counts unique orders, since one order can span several line items.*

## Objectives

1. Where did revenue change unexpectedly over time?
2. Which shipping modes caused the most delivery delays?
3. Which customer segments and regions drove the most value?
4. Which products contributed most to profit?
5. What actions should leadership take to improve performance?

## Project Deliverables

This repository is structured as a complete analytics engagement, not just a dashboard file.

| Deliverable | Purpose |
|---|---|
| **[BRD.pdf](Documentation/BRD.pdf)** | Problem definition, scope, and success criteria, agreed before build |
| **[Findings & Recommendations](Documentation/Vantara_Findings_and_Recommendations.docx)** | Full written analysis behind every number in the dashboard |
| **[Decisions Log](Documentation/Vantara_Decisions_Log.docx)** | Audit trail explaining every analytical and data-cleaning choice |
| **[Presentation.pdf](Documentation/Presentation.pdf)** | Executive-ready summary of problem, method, and findings |
| **[Vantara_Supply_Chain_Dashboard.pbix](Dashboard/Vantara_Supply_Chain_Dashboard.pbix)** | Full interactive Power BI dashboard |
| **[Vantara_Analysis_Queries.sql](SQL_Analysis/Vantara_Analysis_Queries.sql)** | Full SQL query set behind every KPI |
| **[Vantara_Analysis_Model.xlsx](Data/Vantara_Analysis_Model.xlsx)** | Independent Excel cross-check of every headline metric |
| **[Data_Preparation.ipynb](Notebook/Data_Preparation.ipynb)** | Reproducible cleaning pipeline |

## Tools & Technologies

| Layer | Tools | Purpose |
|---|---|---|
| Data Cleaning | Python (Pandas), Jupyter | Deduplicate, standardize, structure raw data |
| Database | PostgreSQL | Star schema, one fact table and four dimension tables |
| Analysis | SQL | Joins, CTEs, window functions, KPI aggregation |
| Modeling | Excel | Pivot tables, Power Pivot, independent cross-checks |
| Visualization | Power BI | DAX measures, branded executive dashboard |
| Documentation | BRD, Decisions Log, Findings Report | Audit trail for every analytical choice |

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

## Methodology

**1. Requirements first.** The investigation was scoped in a formal BRD before any pipeline work began, tying every downstream artifact back to the five objectives above.

**2. Data Preparation.** Loaded the raw dataset into Python; cleaned missing values, duplicates, and inconsistent fields; standardized column names into analysis-ready tables.

**3. Database Modeling.** Designed a star schema in PostgreSQL (one fact table, four dimension tables) for scalable SQL analysis.

**4. SQL Analysis.** Calculated KPIs, revenue trends, delivery delays, and customer behavior using joins, CTEs, groupings, and date logic.

**5. Excel Modeling.** Built independent pivot-based views to cross-check every headline metric before it reached the dashboard.

**6. Power BI Dashboarding.** Built a multi-page, DAX-driven dashboard with a custom brand theme, focused on executive KPIs, delivery performance, and customer insight.

## Key Insights & Visuals

### The Q4 2017 revenue collapse: $1.03M to $453K in three months, -56%
Revenue held a steady $900K to $1M/month rhythm across most of the three-year window, then fell sharply from October to December 2017, while order volume was rising. Growth in top-line activity was masking a collapse in realized revenue, a strong signal of a pricing, discounting, or data-capture failure, not falling demand.

### 55% of all orders arrive late, and the premium option is the worst offender
First Class shipping, the option customers pay more for, carries a **95% late-delivery rate**, far above Standard Class. This is not one underperforming carrier. It is a systemic fulfilment capacity problem sitting directly under Vantara's most expensive promise to customers.

![Delivery Performance](Screenshots/Delivery%20Performance.png)
![Customer Insights](Screenshots/Customer%20Insights.png)

### 63.51% repeat customer rate, verified, not assumed
A reference estimate of 76% was recalculated independently in SQL, DAX, and Excel. All three converged on the same real number: **63.51%**. Customer lifetime value is nearly flat across segments; Consumer's revenue lead comes from volume, not from higher spend per customer.

### Two categories quietly drive a third of all profit
Fishing and Cleats together contribute approximately 32% of total profit, while several categories contribute almost nothing, a direct, data-backed signal for where to focus inventory, promotion, and category strategy.

## Executive KPIs

| Metric | Value |
|---|---|
| Total Revenue | $32.76M |
| Total Orders | 63,629 |
| Repeat Customer Rate | 63.51% |
| Average Fulfilment Time | 3.47 days |
| Profit Margin | 12% |

📄 Full findings: [`Documentation/Vantara_Findings_and_Recommendations.docx`](Documentation/Vantara_Findings_and_Recommendations.docx)
📄 Every data decision explained: [`Documentation/Vantara_Decisions_Log.docx`](Documentation/Vantara_Decisions_Log.docx)

## Recommendations

1. **Investigate the Q4 2017 revenue collapse.** Audit pricing, promotions, and data capture for that window; determine whether the drop stems from discounting, product-mix shifts, or missing records.
2. **Fix premium shipping performance.** Re-examine the First Class fulfilment process; rework SLAs, capacity planning, or pricing so premium shipping reflects an actual premium service level.
3. **Protect the high-profit core.** Prioritize inventory and marketing spend on Fishing and Cleats; reassess low-margin categories for pricing, sourcing, or discontinuation.
4. **Make repeat customer rate an executive KPI.** Track the verified 63.51% monthly, segmented by region and customer type, to catch churn risk early.
5. **Build a late-order risk flag.** Identify shipping-mode, region, and product-type combinations most prone to delay, and trigger proactive customer communication ahead of time.

## Skills Demonstrated

- **End-to-end data pipeline ownership.** Raw CSV to cleaned relational model to SQL analysis to BI dashboard.
- **Relational database design.** Star schema modeling in PostgreSQL.
- **Advanced SQL.** CTEs, joins, date-based aggregation, KPI derivation.
- **Cross-tool validation.** Independently re-deriving the same KPI in SQL, DAX, and Excel before trusting it.
- **Executive communication.** Translating technical findings into a five-point action plan for leadership.
- **Transparent AI-assisted workflow.** Using AI to accelerate scaffolding, while independently verifying every number.

## How I Used AI

An AI coding assistant was used to accelerate the repetitive, technical parts of this project:
- Generated starter SQL queries for KPI analysis and customer segmentation.
- Drafted initial Python cleaning and EDA code in Jupyter Notebook.
- Suggested DAX measures and dashboard layout ideas for Power BI.

Every output was then reviewed, corrected, and simplified independently:
- Adjusted logic to match the actual dataset schema.
- Added business-focused metrics such as late-delivery rate, profit margin, and repeat customer rate.
- Rechecked every important calculation across SQL, DAX, and Excel to validate the result.

AI accelerated the workflow. Every final insight, calculation, and recommendation was independently verified.

## How to Run

1. **Clone the repo**
   ```bash
   git clone https://github.com/seema-kri/Vantara-Smart-Supply-Chain-Intelligence-Platform.git
   ```
2. **Review the requirements.** Read [`Documentation/BRD.pdf`](Documentation/BRD.pdf) for the full problem scope and success criteria.
3. **Data cleaning.** Open `Notebook/Data_Preparation.ipynb` in Jupyter and run all cells to regenerate the cleaned tables in `Data/clean`.
4. **Database.** Run the schema script in `Database/` against a PostgreSQL instance, then load the cleaned CSVs from `Data/clean` in this order: `customers → products → location → date → fact_orders`.
5. **SQL analysis.** Run `SQL_Analysis/Vantara_Analysis_Queries.sql` against the database.
6. **Excel model.** Open `Data/Vantara_Analysis_Model.xlsx` (Data → Refresh All if reconnected to a live source).
7. **Dashboard.** Open `Dashboard/Vantara_Supply_Chain_Dashboard.pbix` in Power BI Desktop; apply the custom theme if needed.

## Future Work

- Add marketing spend / CAC data to extend into full ROI analysis.
- Automate the Python to PostgreSQL pipeline with a scheduled job.
- Publish the dashboard to Power BI Service for live web access.
- Extend the portfolio with a second project covering SaaS churn and revenue operations.

## Contact

**Seema Kumari**

- 📧 Email: [kriseema87@gmail.com](mailto:kriseema87@gmail.com)
- 💼 LinkedIn: [linkedin.com/in/seema-kumari-375763308](https://linkedin.com/in/seema-kumari-375763308)
- 💻 GitHub: [github.com/seema-kri](https://github.com/seema-kri)

---

⭐ If this project was useful or interesting, a star on the repo is always appreciated.
