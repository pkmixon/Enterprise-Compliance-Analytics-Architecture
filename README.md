# Enterprise-Compliance-Analytics-Architecture

## Project Overview
End-to-end automated regulatory compliance, criticality assessment, and unstructured complaint topic modeling lakehouse.

## Architecture Layers
- **Data Transformation (dbt):** Cleans and standardizes raw complaint data.
- **Data Governance (Snowflake):** Enforces role-based access control and dynamic data masking for sensitive information.
- **AI Analytics & Reporting (GenAI & BI):** Analyzes themes, friction points, and generates executive reports using agentic AI, alongside semantic views for business intelligence.

## Technology Stack
- **Database:** Snowflake
- **Transformation Tool:** dbt (data build tool)
- **Reporting:** Power BI
- **Agentic AI:** GenAI / LLMs
- **Version Control:** GitHub

## Repository Structure
```text
├── dbt_project/              # dbt models and project configuration
│   └── models/
│       └── staging_complaints.sql
├── snowflake_ddl/            # Snowflake RBAC and masking policies
│   ├── 01_rbac_and_masking.sql
│   └── 02_star_schema_views.sql
└── README.md                 # Project documentation
