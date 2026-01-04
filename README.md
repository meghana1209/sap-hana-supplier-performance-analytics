Supplier Performance & Procurement Analytics using SAP HANA

A complete SAP HANA analytics project showcasing supplier reliability, delivery performance, and procurement spend analysis using SAP HANA SQL and SQLScript.
This project reflects a real-world procurement analytics use case and is suitable for SAP Associate, Analyst, and SAP HANA roles.

Project Overview

This project simulates a procurement system where supplier performance is evaluated based on delivery timeliness and cost efficiency.
Using SAP HANA’s in-memory processing, analytical queries, views, and stored procedures are implemented to support data-driven procurement decisions.

Business Objectives

Analyze supplier delivery performance (on-time vs delayed)

Track supplier-wise and monthly procurement spend

Rank suppliers based on performance score

Enable procurement optimization using analytics

Technology Stack

SAP HANA SQL

SQLScript (Stored Procedures)

Analytical Views

SAP HANA Studio / DB Explorer / SAP Cockpit

Repository Structure
sap-hana-supplier-performance-analytics/
├── sql/
│   ├── 01_create_tables.sql          # Table creation (DDL)
│   ├── 02_insert_data.sql            # Sample procurement data
│   ├── 03_basic_queries.sql          # Basic joins and validations
│   ├── 04_analytics_queries.sql      # KPIs, rankings, spend analysis
│   └── 05_procedure.sql              # SQLScript performance procedure
├── views/
│   └── supplier_performance_view.sql # Aggregated analytical view
├── screenshots/
│   └── README.md                     # Optional output screenshots
└── README.md                         # Project documentation

Data Model
Tables Used

SUPPLIER
Stores supplier master information

PURCHASE_ORDER
Stores procurement order details and cost

DELIVERY
Stores delivery dates and delivery status

Key Features

On-time delivery percentage calculation

Supplier-wise and monthly procurement spend analysis

Analytical view for reporting and dashboards

SQLScript stored procedure to calculate supplier performance score

Supplier ranking based on delivery and cost efficiency

Getting Started
Step 1: Create Tables

Run:

sql/01_create_tables.sql

Step 2: Insert Sample Data
sql/02_insert_data.sql

Step 3: Run Basic Queries
sql/03_basic_queries.sql

Step 4: Run Analytical Queries
sql/04_analytics_queries.sql

Step 5: Create Analytical View
views/supplier_performance_view.sql

Step 6: Execute Stored Procedure
CALL CALC_SUPPLIER_PERFORMANCE(?);


The procedure calculates supplier scores and ranks them based on performance.

Output Metrics

On-time delivery percentage

Total procurement spend per supplier

Monthly spend analysis

Supplier performance score

Supplier ranking
