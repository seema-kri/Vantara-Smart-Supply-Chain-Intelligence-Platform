# Vantara — Smart Supply Chain Intelligence Platform

**End-to-end supply chain analytics: 180,519 order-line records cleaned in Python, modeled in PostgreSQL, analyzed in SQL, cross-validated in Excel, and delivered as a live executive Power BI dashboard — uncovering a hidden Q4 revenue collapse behind rising order volume.**

![Python](https://img.shields.io/badge/Python-Pandas-3776AB?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Star_Schema-4169E1?logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Window_Functions-CC2927?logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-Modeling-217346?logo=microsoftexcel&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

**[🔗 Live Interactive Dashboard](https://app.fabric.microsoft.com/links/7kEQOVZFb_?ctid=e93d71d6-b5c0-4b78-a861-d9964ecdfcd6&pbi_source=linkShare)**

![Overview](Screenshots/Overview.png)

---

## Table of Contents

- [Business Problem & Dataset](#business-problem--dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Key Insights & Visuals](#key-insights--visuals)
- [How to Run](#how-to-run)
- [Future Work & Contact](#future-work--contact)

---

## Business Problem & Dataset

Vantara is a supply chain and logistics company selling across USCA, Europe, LATAM, Africa, and Pacific Asia. Order volume grew year over year, but leadership noticed that growth wasn't always translating into more profit, and had no clear view of delivery reliability or true customer loyalty.

Leadership observed:
- Order volume kept increasing, but revenue growth slowed and in some months reversed sharply.
- Delivery times were inconsistent across shipping modes, with a high share of orders arriving late.
- It was unclear how loyal the customer base really was, or which segments deserved more investment.
- A large share of orders sat in unresolved statuses (pending payment, on hold, fraud review), making true revenue hard to pin down.

**Core question:** *"Where is Vantara losing money and customers, and what should be done about it?"*

I chose this dataset deliberately, not for convenience, but because it contains a genuine hidden problem rather than a pre-labeled one. Total order volume rises every year — a shallow read says "the business is healthy." Only by separating revenue-per-order, order-status mix, and delivery performance does the real story emerge: a sharp **Q4 2017 revenue collapse** sitting directly underneath rising volume. The data also had a wrong answer already sitting in it — an early reference figure put customer loyalty at 76%. Rather than accept it, I recalculated it from first principles, independently, in SQL, DAX, and Excel, before trusting it.

**Dataset:** [DataCo Smart Supply Chain for Big Data Analysis](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) (Kaggle) — 180,519 order-line records, 2015–2017, covering order, customer, product, shipping, payment, and location details.

**Scope:** full calendar years 2015–2017; year-over-year and month-over-month comparisons; profitability by region/category/segment; delivery performance by shipping mode and status; customer retention and segment behavior. *Out of scope:* the partial trailing month (Jan 2018), real-time tracking, and direct operational changes — this project recommends, it doesn't execute.

**Stakeholders:** CEO (growth direction), CFO (revenue & margin), VP Operations (delivery reliability), VP Customer Success (retention), Marketing (region/product/segment prioritization).

---

## Tools & Technologies

| Layer | Tools |
|---|---|
| Data Cleaning | Python (Pandas), Jupyter |
| Database & Modeling | PostgreSQL — star schema (1 fact + 4 dimension tables) |
| Analysis | SQL — joins, CTEs, window functions |
| Cross-Validation | Excel — independent pivot tables + what-if scenario model |
| Visualization | Power BI — DAX measures, 3-page branded dashboard, published live via Microsoft Fabric |

**Process:** BRD → Python cleaning → PostgreSQL star schema → SQL analysis → Excel cross-check → Power BI dashboard → written findings, with every judgment call logged in the Decisions Log.

---

## Project Structure

```
Vantara-Smart-Supply-Chain-Intelligence-Platform/
├── Dashboard/          → .pbit, .pbix, PDF export
├── Data/
│   ├── Raw/            → original Kaggle CSVs
│   └── clean/          → dim_customers, dim_date, dim_location, dim_products, fact_orders, Excel model
├── Database/           → Vantara_Database_Schema.sql, README
├── Docs/                → BRD, SQL findings report, presentation
├── Notebook/            → Data_Preparation.ipynb
├── SQL_Analysis/        → Vantara_Analysis_Queries.sql
├── Screenshots/
├── LICENSE
└── README.md
```

---

## Key Insights & Visuals

**Executive KPIs (Overview page):**

| KPI | Value |
|---|---|
| Total Revenue | $32.76M |
| Total Orders | 63,629 |
| Sales Growth Rate | 47.91% |
| Repeat Customer Rate | 56.98% |
| Profit Margin | 12% |
| Avg. Fulfilment Time | 3.47 days |
| Unique Products | 118 |

**What the analysis found:**

1. **Revenue growth is not what it looks like.** 2017 revenue held strong through September (peaking at **$1.03M**) then fell sharply to **$453K by December** — a ~56% drop — while order volume stayed steady. Rising volume was masking a Q4 collapse.
2. **The "Sales Growth Rate" card hides real volatility.** SQL shows month-over-month swings as sharp as **-11.85% (Feb 2015)** followed by **+13.40% (Mar 2015)**. The flat 47.91% headline doesn't communicate this.
3. **Customer loyalty is real, and now verified.** The **56.98% repeat customer rate** was independently recalculated and confirmed across SQL, DAX, and Excel, replacing a prior unverified reference figure of 76%.
4. **The dashboard has an internal inconsistency worth fixing.** The Customer Insights KPI card reports **56.98%** repeat customers, but the narrative text on the same page states **63.51%** — needs reconciling to one number.
5. **First Class shipping is the best performer, not the worst.** Standard and Second Class average **4 days**, twice as long as First Class at **2 days** — an underused selling point.
6. **Late delivery is the dominant delivery issue,** at roughly **55%** of tracked deliveries — far ahead of cancellations, advance shipping, or on-time shipping.
7. **That late-delivery figure doesn't reconcile with SQL.** SQL counts late delivery at **54.83% of order-line records** (98,977 of ~180,519), while the dashboard's 36.0K figure is built at order/shipment grain — the two agree directionally, not in raw count.
8. **The revenue map hides Vantara's global footprint.** SQL ranks **England ("Inglaterra"), Isle of France, and California** as top revenue locations, but the Power BI map only renders U.S. states, hiding non-U.S. revenue entirely.
9. **Fishing and Cleats anchor profitability** — together **~31.5% of total profit**, ranked identically across Consumer and Corporate segments.
10. **Consumer is the core segment,** driving **~52% of revenue and orders**, ahead of Corporate (~30%) and Home Office (~18%).
11. **Customer value is broad, not concentrated.** Across 20,652 customers, average lifetime value is consistent (~$1.59K–$1.6K) across all three segments — Consumer's lead comes from volume, not higher per-customer spend.
12. **Puerto Rico and California are the top-contributing states** by both customer count and revenue.

**Recommendations by priority:**

| Priority | Action |
|---|---|
| 🔴 High | Investigate the Q4 2017 revenue collapse (pricing, promotions, data capture for Oct–Dec 2017) |
| 🔴 High | Document the Sales Growth Rate calculation; add a trend sparkline so 47.91% isn't misread as constant |
| 🔴 High | Lock repeat-customer definition as single source of truth; reconcile the 56.98% vs 63.51% conflict |
| 🔴 High | Reconcile late-delivery counting between SQL (order-line grain) and Power BI (order grain) |
| 🔴 High | Replace the U.S.-only revenue map with a world map or market filter/toggle |
| 🟡 Medium | Promote First Class as the reliable shipping tier |
| 🟡 Medium | Build a customer value-tier (quartile) view and an order-cadence view for win-back campaigns |
| 🟢 Low | Prioritize inventory/marketing spend on Fishing and Cleats platform-wide |

Full write-up with business impact per finding: [`Docs/sql_Report.pdf`](Docs/sql_Report.pdf).

---

## How to Run

1. Clone the repo:
   ```bash
   git clone https://github.com/seema-kri/Vantara-Smart-Supply-Chain-Intelligence-Platform.git
   ```
2. Read `Docs/Vantara_BRD.pdf` for scope and success criteria.
3. Run `Notebook/Data_Preparation.ipynb` to regenerate the cleaned tables from raw data.
4. Load `Database/Vantara_Database_Schema.sql` into PostgreSQL, then load the cleaned CSVs in order: `customers → products → location → date → fact_orders`.
5. Run `SQL_Analysis/Vantara_Analysis_Queries.sql` against the database to reproduce the findings.
6. Open `Data/Vantara_Analysis_Model.xlsx` and refresh to see the cross-check pivots.
7. Open `Dashboard/Vantara_Supply_Chain_Dashboard.pbix` in Power BI Desktop, **or** explore the [live published dashboard](https://app.fabric.microsoft.com/links/7kEQOVZFb_?ctid=e93d71d6-b5c0-4b78-a861-d9964ecdfcd6&pbi_source=linkShare) in the browser — no install required.

---

## Future Work & Contact

**Future work:**
- Automate SQL-vs-DAX reconciliation checks with a scheduled validation script so grain mismatches are caught before publishing.
- Build the quartile-based customer-tier and order-cadence views identified in the findings but not yet in the dashboard.
- Add a world-map / market-toggle visual to close the geographic scope gap.
- Deeper cohort/pricing analysis to isolate the root cause of the Q4 2017 collapse.

**How I used AI:** I used an AI assistant to scaffold starter SQL, draft initial Python cleaning code, and suggest DAX/dashboard layout ideas — then reviewed, corrected, and independently re-verified every number across SQL, DAX, and Excel before trusting it. Where SQL and the dashboard disagreed, the mismatch was documented, not smoothed over.

**Skills demonstrated:** end-to-end pipeline ownership · relational database design (star schema) · advanced SQL (window functions, CTEs) · cross-tool KPI validation · requirements discipline (BRD-first) · Power BI/DAX development · executive communication.

**Contact:**

**Seema Kumari** — Business Analyst
📧 [kriseema87@gmail.com](mailto:kriseema87@gmail.com) · 💼 [LinkedIn](https://linkedin.com/in/seema-kumari-375763308) · 💻 [GitHub](https://github.com/seema-kri)

---
⭐ If this project was useful, a star on the repo is appreciated.
