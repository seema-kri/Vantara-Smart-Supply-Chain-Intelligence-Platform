# Vantara — Smart Supply Chain Intelligence Platform

**End-to-end Business Analytics project** — from raw data to executive decision.
`Python` · `PostgreSQL` · `SQL` · `Excel` · `Power BI`

---

## The Problem

Vantara's order volume kept growing year over year, but leadership couldn't tell if that growth was actually translating into profit, reliable delivery, or loyal customers. As Business Analyst, I was tasked to dig into 180,519 order records and answer:

> **"Where is the business losing money and customers — and what should be done about it?"**

---

## 📊 Dashboard

| Overview | Delivery Performance | Customer Insights |
|---|---|---|
| ![Overview](Screenshots/overview.png) | ![Delivery](Screenshots/delivery.png) | ![Customers](Screenshots/customers.png) |

*(Full interactive `.pbix` in `/Dashboard`)*

---

## Findings → Recommendations

### 1. Revenue dropped 56% in Q4 2017 — while order volume rose
Revenue held a steady $900K–$1M/month rhythm through September 2017, then fell to $452.7K by December — despite orders actually *increasing* in that window.
**→ Recommendation:** Investigate immediately with Finance and Sales — rising orders with falling revenue points to a pricing or data-recording issue, not falling demand. This needs an answer before next year's planning.

### 2. 55% of all orders arrive late — and the premium shipping option is worst
First Class shipping (the option customers pay more for) has a 95% late-delivery rate — far above Standard Class at 38%.
**→ Recommendation:** Treat this as a fulfilment capacity problem, not a single-carrier issue. Fix reliability broadly rather than pushing customers toward a "faster" option that's actually less dependable.

### 3. Over half of all orders sit in unresolved status
Only ~44% of orders are in a confirmed Complete/Closed state; the rest sit in pending payment, on hold, processing, or fraud review.
**→ Recommendation:** Set clear SLAs to move orders out of limbo, and track resolution time as its own KPI — true confirmed revenue is smaller than total order value suggests.

### 4. Two categories drive nearly a third of all profit
Fishing and Cleats alone account for ~32% of total profit; several other categories (Strength Training, Video Games, Men's Clothing) contribute almost nothing.
**→ Recommendation:** Prioritize inventory and marketing spend on proven categories; reassess whether weak categories are worth the shelf space.

### 5. Customers are loyal — and discounting isn't the margin problem
63.51% of customers are repeat buyers (verified independently in SQL, DAX, and Excel). Profit margin stays flat (~12%) regardless of discount level, even at 25% off.
**→ Recommendation:** Keep using discounts as a sales lever — they're not what's eating margin. Focus cost-control efforts on delivery and order-status issues instead.

📄 Full write-up: [`Documentation/Vantara_Findings_and_Recommendations.docx`](Documentation/)

---

## What's Inside

```
├── Dashboard/        → Power BI file (.pbix) + custom brand theme (.json)
├── Data/              → Cleaned CSVs (fact + dimension tables)
├── Database/          → PostgreSQL schema (star schema: 1 fact + 4 dim tables)
├── Documentation/      → BRD, Decisions Log, Findings & Recommendations Report
├── Notebook/          → Python data cleaning pipeline (Jupyter)
├── SQL_Analysis/        → 10+ analysis queries (joins, CTEs, aggregations)
└── Screenshots/         → Dashboard preview images
```

---

## Process

1. **Clean** — Raw 53-column flat file cleaned and validated in Python
2. **Model** — Restructured into a star schema: `fact_orders` + 4 dimension tables
3. **Store** — Loaded into PostgreSQL with enforced referential integrity
4. **Analyze** — SQL queries covering revenue, profit, delivery, and customer behavior
5. **Report** — Excel scenario model + 3-page interactive Power BI dashboard

---

## Real Problems I Solved (Not Just Tools Used)

- **Broken date joins** — a hidden timestamp on `order_date` silently broke relationships, showing as one giant "blank" bucket in Excel. Fixed by normalizing to a true `Date` type.
- **Missing column discovered mid-build** — `payment_type` was dropped during initial cleaning; patched the pipeline to bring it back without re-running the whole process from scratch.
- **Corrupted source data** — some `Customer State` values were invalid (zip-code-like numbers, not state codes). Relabeled as "Unknown" instead of deleting rows, to protect order and revenue totals.
- **Caught my own wrong number** — started with a placeholder Repeat Customer Rate of 76% from a reference source. Recalculated independently in SQL, DAX, and Excel — all three agreed on the real number: **63.51%**. Corrected before it reached the final report.

📄 Full reasoning log: [`Documentation/Vantara_Decisions_Log_Final.docx`](Documentation/)

---

## Documentation

- [Business Requirement Document](Documentation/) — problem, scope, stakeholders, success criteria
- [Decisions Log](Documentation/) — every assumption and data-quality fix, explained
- [Findings & Recommendations](Documentation/) — insights translated into 5 business actions

---

## About

**Seema Kumari** — Business Analyst
📧 your.email@example.com · 🔗 [LinkedIn](https://linkedin.com/in/seema-kumari-375763308/) · 💻 [GitHub](https://github.com/seema-kri)

---

*Dataset: [DataCo Smart Supply Chain for Big Data Analysis](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) (Kaggle)*
