# Supplier Performance & Procurement Analytics (SAP HANA)

Professional, recruiter-ready sample project demonstrating supplier reliability, delivery performance, and procurement spend analysis using SAP HANA SQL and SQLScript.

## Overview
This repository models a procurement domain—suppliers, purchase orders and deliveries—and provides analytical queries, an aggregated view, and a stored procedure that computes supplier performance scores combining delivery timeliness and cost efficiency.

## Repository Structure
```
sap-hana-supplier-performance-analytics/
├── sql/
│   ├── 01_create_tables.sql         # DDL: SUPPLIER, PURCHASE_ORDER, DELIVERY
│   ├── 02_insert_data.sql           # Sample dataset (suppliers, POs, deliveries)
│   ├── 03_basic_queries.sql         # Basic lookups and joins
│   ├── 04_analytics_queries.sql     # On-time %, monthly spend, rankings
│   └── 05_procedure.sql             # SQLScript: supplier performance procedure
├── views/
│   └── supplier_performance_view.sql# Aggregated analytical view
├── screenshots/
│   └── README.md                    # Place screenshots here (optional)
└── README.md                        # This file
```

## Key Features
- Supplier performance scoring (on-time vs delayed deliveries)
- Supplier-level and monthly procurement spend reports
- Analytical view `SUPPLIER_PERFORMANCE_VIEW` for dashboards
- SQLScript stored procedure `CALC_SUPPLIER_PERFORMANCE` for ranking

## Getting Started (Quick)
1. Execute the DDL: `sql/01_create_tables.sql` to create tables.
2. Load sample data: `sql/02_insert_data.sql`.
3. Run basic checks: `sql/03_basic_queries.sql`.
4. Run analytics: `sql/04_analytics_queries.sql`.
5. Create the view in `views/supplier_performance_view.sql`.
6. Call the procedure to produce scores, for example:

```sql
-- Example (HANA SQLScript):
CALL CALC_SUPPLIER_PERFORMANCE(?);
-- Or execute the procedure in your HANA client and inspect the returned RESULT table
```

Notes:
- Adjust schema or data types to match your SAP HANA version if needed.
- Use your DB client (SAP HANA Studio / Cockpit / DB Explorer) to run these scripts.

## Resume / LinkedIn Copy (Suggested)
Supplier Performance & Procurement Analytics using SAP HANA
- Designed an in-memory procurement analytics system using SAP HANA SQL
- Evaluated supplier delivery delays, cost efficiency, and monthly spend
- Built analytical views and SQLScript procedures to rank supplier performance
- Enabled data-driven supplier selection for procurement optimization

## Want to extend this project?
- Add exported CSVs or connect the view to a lightweight dashboard (Power BI, Grafana)
- Add SLA breach alerts, lead-time distribution charts, and trend analysis
- Replace sample data with an anonymized real dataset for demo authenticity

---
If you want, I can also push these changes to GitHub and prepare suggested commit messages.


