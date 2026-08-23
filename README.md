# Vantara — Smart Supply Chain Intelligence Platform

**A full-stack analytics case study: 180,519 order-line records → an executive Power BI dashboard, uncovering a hidden Q4 revenue collapse, a masked growth-volatility problem, and an independently verified customer loyalty rate.**

![Python](https://img.shields.io/badge/Python-Pandas-3776AB?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Star_Schema-4169E1?logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Window_Functions-CC2927?logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-Modeling-217346?logo=microsoftexcel&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

![Overview](Screenshots/Overview.png)

---

## The Question

Vantara's order volume kept growing year over year, but leadership had no clear view of whether that growth was translating into profit, reliable delivery, or real customer loyalty. Task:

> **"Where is the business losing money and customers, and what should be done about it?"**

**Dataset:** [DataCo Smart Supply Chain](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) (Kaggle) · 180,519 order-line records · 2015–2017

---

## 1. Executive KPIs (Overview page)

1. **Total Revenue:** $32.76M
2. **Total Orders:** 63,629
3. **Sales Growth Rate:** 47.91%
4. **Repeat Customer Rate:** 56.98%
5. **Profit Margin:** 12%
6. **Avg. Fulfilment Time:** 3.47 days
7. **Unique Products:** 118

---

## 2. What I Found

1. **Revenue growth is not what it looks like.** In 2017, revenue held strong through September (peaking at **$1.03M**) then fell sharply to **$453K by December** — a ~56% drop — while order volume stayed steady. Rising volume was masking a Q4 collapse.
2. **The single "Sales Growth Rate" card hides real volatility.** SQL analysis shows month-over-month swings as sharp as **-11.85% (Feb 2015)** followed by **+13.40% (Mar 2015)**. The flat 47.91% headline figure on the Overview page doesn't communicate this, and it isn't documented which single period it compares.
3. **Customer loyalty is real, and now verified.** The **56.98% repeat customer rate** was independently recalculated and confirmed in SQL, DAX, and Excel using order-sequence logic (any customer with more than one order counts as repeat), replacing a prior unverified reference figure of 76%.
4. **The dashboard has an internal inconsistency worth fixing.** The Customer Insights page KPI card reports **56.98%** repeat customers, but the narrative text on the same page states **63.51%** — the same page disagrees with itself, and this should be reconciled to one number before the next review.
5. **First Class shipping is the best performer, not the worst.** Fulfilment time by shipping mode shows Standard and Second Class averaging **4 days**, twice as long as First Class at **2 days**. First Class is the platform's most reliable shipping tier — an underused selling point, not a problem.
6. **Late delivery is the dominant delivery issue.** Of all delivery-status records, **36.0K are "Late delivery"** — far ahead of "Advance shipping" (15.1K), "Shipping on time" (11.7K), and "Shipping canceled" (2.9K), putting the late-delivery share at roughly **55%** of tracked deliveries.
7. **That late-delivery figure doesn't reconcile with SQL.** SQL analysis counts late delivery at **54.83% of order-line records** (98,977 of ~180,519), while the dashboard's 36.0K figure is built at order/shipment grain — the two numbers agree directionally but not in raw count, because they're counting different things.
8. **The revenue map hides Vantara's global footprint.** SQL ranks **England ("Inglaterra"), Isle of France, and California** as top revenue-generating locations, but the Power BI map visual only renders U.S. states — leaving most of the map gray and making the business look far more U.S.-concentrated than it is.
9. **Fishing and Cleats anchor profitability.** These two categories alone contribute **~31.5% of total profit** (19.06% + 12.47%), and this ranking holds in the same order for both Consumer and Corporate segments — no need for segment-specific category strategy.
10. **Consumer is the core segment.** Consumer drives **51.7%–51.9% of revenue** and **51.89% of orders** (34K of ~65K orders), ahead of Corporate (~30%) and Home Office (~18%) on both counts.
11. **Customer value is broad, not concentrated.** Across 20,652 customers, average lifetime value sits close to **$1.59K–$1.6K per customer**, and this is surprisingly consistent across all three segments (Corporate $1,593, Consumer $1,591, Home Office $1,561) — Consumer's revenue lead comes from volume, not higher per-customer spend.
12. **Puerto Rico and California are the top-contributing states.** Puerto Rico leads with 7,933 customers and ~$12.7M in revenue; California follows with 3,318 customers and ~$5.3M.

---

## 3. Recommendations

1. **Investigate the Q4 2017 revenue collapse** — audit pricing, promotions, and data capture for October–December 2017.
2. **Document and clarify the Sales Growth Rate calculation**, and add a trend sparkline or footnote so the 47.91% card isn't misread as a constant, stable figure.
3. **Lock the repeat-customer definition (order sequence > 1) as the single source of truth**, and reconcile the Customer Insights page's 56.98% KPI card against its own 63.51% narrative text.
4. **Promote First Class as the reliable shipping tier** rather than treating shipping mode as undifferentiated — it already outperforms Standard/Second Class 2x on speed.
5. **Reconcile late-delivery counting** between SQL (order-line grain) and Power BI (order/shipment grain) so both report the same number at the same grain.
6. **Replace the U.S.-only revenue map** with a world map view or add a market filter/toggle so international revenue (England, Isle of France) isn't hidden.
7. **Protect the high-profit core** — prioritize inventory and marketing spend on Fishing and Cleats, platform-wide.
8. **Build a customer value-tier (quartile) view** and an order-cadence/"days since last order" view on Customer Insights to power targeted marketing and win-back campaigns — the data already supports both; the dashboard currently has neither.

---

## 4. How It Was Built

| Layer | Tools |
|---|---|
| Cleaning | Python (Pandas), Jupyter |
| Database | PostgreSQL — star schema (1 fact + 4 dimension tables) |
| Analysis | SQL — joins, CTEs, window functions |
| Cross-check | Excel — independent pivot validation of every headline metric |
| Visualization | Power BI — DAX measures, branded 3-page dashboard |

Process: **BRD → Python cleaning → PostgreSQL star schema → SQL analysis → Excel cross-check → Power BI dashboard → written findings**, with every judgment call logged in the Decisions Log.

---

## 5. Repo Structure

```
Vantara-Smart-Supply-Chain-Intelligence-Platform/
├── Dashboard/         → .pbix, PDF export, screenshots
├── Data/               → raw + cleaned tables, Excel model
├── Database/          → schema.sql, load scripts
├── Documentation/     → BRD, SQL findings, decisions log, presentation
├── Notebook/           → Data_Preparation.ipynb
├── SQL_Analysis/      → Vantara_Analysis_Queries.sql
└── Screenshots/
```

---

## 6. How to Run

1. `git clone https://github.com/seema-kri/Vantara-Smart-Supply-Chain-Intelligence-Platform.git`
2. Read `Documentation/BRD.pdf` for scope and success criteria.
3. Run `Notebook/Data_Preparation.ipynb` to regenerate cleaned tables.
4. Load `Database/Vantara_Database_Schema.sql` into PostgreSQL, then load cleaned CSVs (`customers → products → location → date → fact_orders`).
5. Run `SQL_Analysis/Vantara_Analysis_Queries.sql` against the database.
6. Open `Data/Vantara_Analysis_Model.xlsx` and refresh.
7. Open `Dashboard/Vantara_Supply_Chain_Dashboard.pbix` in Power BI Desktop.

---

## 7. How I Used AI

Used an AI assistant to scaffold starter SQL, draft initial Python cleaning code, and suggest DAX/dashboard layout ideas — then reviewed, corrected, and independently re-verified every number across SQL, DAX, and Excel before trusting it. Where SQL and the dashboard disagreed (e.g. late-delivery counts, repeat-rate figures), the mismatch was documented, not smoothed over.

---

## 8. Skills Demonstrated

End-to-end pipeline ownership · relational database design · advanced SQL (window functions, CTEs) · cross-tool KPI validation · requirements discipline (BRD-first) · executive communication · transparent AI-assisted workflow.

---

## Contact

**Seema Kumari** — Business Analyst
📧 [kriseema87@gmail.com](mailto:kriseema87@gmail.com) · 💼 [LinkedIn](https://linkedin.com/in/seema-kumari-375763308) · 💻 [GitHub](https://github.com/seema-kri)

---
⭐ If this project was useful, a star on the repo is appreciated.
