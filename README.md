# GigGap-India

## India Gig Worker Welfare Policy — End-to-End Analytics Project
--------------
```
"23+ million platform workers. 5 states with welfare laws. Crores of workers invisible to every welfare system in India."
```
---------------
An end-to-end data analytics project that tracks India's gig worker welfare legislation gap — built as a complete analytics engineering pipeline from raw government data to an interactive Power BI dashboard.
Pipeline: Python (cleaning) → SQL Server (storage + analysis) → Power BI (dashboard)

----------------

# **The Problem**

**India's platform economy employs an estimated 23.5 million gig workers — Swiggy and Zomato delivery riders, Ola and Uber drivers, Urban Company plumbers and beauticians. These workers operate outside the traditional employer–employee relationship. They are not salaried employees, so companies like Swiggy owe them no provident fund, no health insurance, no accident coverage, no sick leave. If a delivery rider is hit by a vehicle while on duty, he receives nothing.**

**The Code on Social Security 2020 recognised gig workers as a separate category for the first time in Indian law and promised them welfare benefits. It was notified in the Gazette on September 28, 2020. As of May 2026 — nearly six years later — it has never been brought into force at the central level.**

**In the absence of central enforcement, a small number of states have passed their own legislation. The rest of India's 36 states and UTs have done nothing. This project measures the scale of that gap.**

-----

# **📊 Key Findings and Insights**

**🔍 Finding 1 — The Registration Abyss**  
eShram has **307 million total unorganised worker registrations.** Of these, only **106,000 are registered specifically as gig/platform workers.** That is a gig registration rate of **0.034%.** The overwhelming majority of India's platform economy workforce is invisible to every welfare tracking system.  

**⚖️ Finding 2 — The Law Gap is Massive**  
Only **5 out of 36 states** have enforced dedicated gig worker legislation. **29 states and UTs have zero protection** — no welfare board, no cess collection, no registration system, no accident insurance. These 29 states contain the majority of India's population and gig workforce.  

**💰 Finding 3 — Wealth Does Not Drive Welfare**  
Maharashtra (**India's largest economy — NSDP ₹3.95 lakh crore**) has no gig worker law. Gujarat (**NSDP ₹2.45 lakh crore**) has no law. Meanwhile **Bihar (₹89,902 crore — one of India's poorest states)** passed a law in July 2025. Jharkhand passed one in December 2025. The data shows **no positive correlation between state economic size and welfare legislation adoption.**  

**⏳ Finding 4 — The Domino Effect is Slow**  
Rajasthan passed India's first law in July 2023. It took **730 days** for the next state (Bihar) to follow in July 2025. Karnataka followed 8 days later. Jharkhand took 158 days from bill to gazette. The domino effect exists but is slow — **2+ years between the first and second law.**  

**👩‍🦰 Finding 5 — Severe Gender Gap**  
In almost every state, **male gig worker registrations far outnumber female registrations.** Many states show near‑zero female registrations. This reflects the **structural gender imbalance** in platform work (delivery, ride‑hailing) as well as lower awareness and registration among women workers in domestic and home‑service gig categories.  

**🛑 Finding 6 — Uttar Pradesh is the Biggest Unprotected State**  
UP has the **highest total unorganised worker registrations** and the **largest population (241 million)** — and has no gig worker law. It represents the **single largest concentration of unprotected platform workers in India.**  

**📅 Finding 7 — Policy Lag Varies Widely**  
- Rajasthan: **8 days (bill to gazette) — fastest**  
- Bihar: **1 day**  
- Jharkhand: **158 days — slowest**  
- Central Code on Social Security: **2,000+ days and still not enforced**  

**🛡️ Finding 8 — The Protection Index Reveals the Tier Structure**  
The **Gig Worker Protection Index** (composite of law status, welfare features, registration rate, and economic capacity) shows a clear three‑tier structure:  

- **High protection (50–70):** Telangana, Karnataka, Rajasthan, Jharkhand, Bihar  
- **Medium protection (30–50):** Goa, Delhi, Sikkim (high income, no law)  
- **Low/minimal (0–30):** 29 remaining states  




# **🛠️ Tech Stack**

**📥 Data Collection**  
Tools: **Python, pandas**  
Purpose: Download and structure raw datasets  

**🧹 Data Cleaning**  
Tools: **Python, pandas, Jupyter**  
Purpose: Standardise, transform, derive metrics  

**💾 Storage**  
Tools: **SQL Server Express**  
Purpose: Structured relational storage  

**📊 Analysis**  
Tools: **T-SQL, SSMS**  
Purpose: 17 analytical queries across 4 files  

**📈 Dashboard**  
Tools: **Power BI Desktop**  
Purpose: 4‑page interactive dashboard 


# **📂 Project Structure — gig-worker-welfare-analytics**

```

gig-worker-welfare-analytics/
│
├── data/
│   ├── raw/                              ← original files untouched
│   │   ├── worker_gender_27.xls          ← eShram gig workers gender Mar 27
│   │   ├── worker_reg_27.xls             ← eShram total unorganised Mar 27
│   │   ├── worker_reg_23.xls             ← eShram total unorganised Mar 23
│   │   ├── PLFS.xls                      ← unemployment rate 2019-2024
│   │   ├── state_population_2025.csv     ← StatisticsTimes population projections
│   │   ├── policy_timeline.csv           ← manually built policy events
│   │   ├── state_coverage.csv            ← manually built law status
│   │   └── state_nsdp_2024_25.csv        ← RBI NSDP data
│   │
│   └── cleaned/                          ← Python output
│       ├── clean_gig_workers_gender.csv
│       ├── clean_total_unorganised_27mar.csv
│       ├── clean_total_unorganised_23mar.csv
│       ├── clean_plfs_unemployment.csv
│       ├── clean_state_population.csv
│       ├── clean_policy_timeline.csv
│       ├── clean_policy_lag.csv
│       ├── clean_state_coverage.csv
│       ├── clean_state_nsdp.csv
│       └── master_analytics_table.csv    ← all joined, 36 rows × 30 cols
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb            ← full cleaning pipeline
│   └── 02_sql_loading.ipynb              ← SQL Server upload
│
├── sql/
│   ├── 01_descriptive_analysis.sql       
│   ├── 02_policy_gap_analysis.sql        
│   ├── 03_timeline_analysis.sql         
│   └──  04_diagnostic_analysis.sql        
│   
│       
│
├── dashboard/
│   └── Gig_WorkerWelfare_Analysis.pbix
│
├── reports/
│   └── dashboard_screenshots/
│       ├── page1_coverage_overview.png
│       ├── page2_policy_timeline.png
│       ├── page3_Gendergap_Analysis.png
│       └── page4_State_Rankings.png
│
├── README.md
└── requirements.tx

```

# Data Methodology

## How eShram Gig Data Was Used
The eShram portal added a dedicated **"Gig and Platform Workers"** registration category in 2024.  
This project uses the **March 2025 parliamentary data (Rajya Sabha Session 267)** as the primary source for state‑wise gig worker counts.  
These are **actual registered workers — not estimates or projections.**

---

## How the Protection Index Was Calculated
The **Gig Worker Protection Index** is a composite score (0–100) built from four components:

- **Has formal law — 30 points** (binary)  
- **Welfare features count — 20 points** (normalised count of features in state law)  
- **Gig registration rate — 25 points** (gig workers as % of total unorganised, normalised)  
- **Per capita income — 25 points** (normalised NSDP per capita — higher income states score higher)  

This index is **clearly labelled as a modelled metric** and not an official government measure.

---

## How Policy Timeline Was Built
The `policy_timeline` and `state_coverage` datasets were manually constructed from:

- State government gazette notifications  
- PIB press releases  
- Rajya Sabha and Lok Sabha question answers  
- Verified news sources (The Hindu, Indian Express, UNI Global Union)  

All dates have been **cross‑verified across at least two sources** to ensure accuracy.


# Limitations

**Limitation 1 — No Sector‑wise Gig Worker Data Exists**  
The eShram portal classifies workers by broad occupation categories (Agriculture, Construction, Domestic Workers etc.) but does not separately classify delivery workers, ride‑hailing drivers, or other platform‑specific gig categories. It is therefore impossible to determine what percentage of Zomato riders vs Ola drivers vs Urban Company workers are registered. The category‑wise national breakdown exists but has no state‑wise split.  
*Impact on this project:* Sector‑level analysis (which platform type has the most unprotected workers) could not be conducted. This question remains unanswerable with publicly available data.  

---

**Limitation 2 — The 2021 Census Was Never Published**  
India's decennial census was due in 2021. As of May 2026 it has not been released. This means:  
- No official current state‑level population counts exist  
- All population figures in this project use 2025 projections from NHM's 2019 report  
- Urbanisation rates used are projected estimates, not measured values  

*Impact on this project:* Population‑based metrics (gig workers per lakh, urban share calculations) carry inherent uncertainty from projection methodology.  

---

**Limitation 3 — Cess Rates Not Publicly Available for All States**  
Only Rajasthan has a clearly published cess rate (2% of platform transaction value). The cess rates for Bihar, Karnataka, Jharkhand, and Telangana are not definitively published in publicly accessible documents as of May 2026.  
*Impact on this project:* Welfare fund size calculations use Rajasthan's rate as a proxy for all enforced states.  

---

# How to Reproduce

```bash
# 1. Clone the repository
git clone https://github.com/Hari-Shankar-11/gig-worker-welfare-analytics
cd gig-worker-welfare-analytics

# 2. Install Python dependencies
pip install -r requirements.txt


# 3. Run the cleaning pipeline
# Open notebooks/01_data_cleaning.ipynb in Jupyter
# Update RAW_PATH and CLEANED_PATH in Cell 1 to your local folder paths
# Run all cells in order (Cell 1 through Cell 17)
# Output: 10 cleaned CSV files in your CLEANED_PATH folder

# 4. Set up SQL Server
# Install SQL Server Express (free) from Microsoft
# Install SSMS (SQL Server Management Studio)
# Connect using Windows Authentication
# Then run:
sqlcmd -Q "CREATE DATABASE gig_welfare_india;"

# 5. Load data to SQL Server
# Open notebooks/02_sql_loading.ipynb
# Update connection string SERVER to your SQL Server instance name
# Run all cells
# Output: 10 tables loaded into gig_welfare_india database

# 6. Run SQL analysis
# Open SSMS → connect to gig_welfare_india
# Run SQL files in order:
#   01_descriptive_analysis.sql
#   02_policy_gap_analysis.sql
#   03_timeline_analysis.sql
#   04_diagnostic_analysis.sql

# 7. Open the dashboard
# Open dashboard/Gig_WorkerWelfare_Analysis.pbix in Power BI Desktop
# Go to Transform Data → Data source settings
# Update SQL Server connection to your instance
# Click Refresh


