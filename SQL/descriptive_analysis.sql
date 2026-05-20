-- 01_descriptive_analysis.sql
-- Gig Worker Welfare Policy Analysis — India


-- Shows state-wise gig worker registration count, ranked highest to lowest
 
SELECT
    g.state_name,
    g.gig_male,
    g.gig_female,
    g.gig_others,
    g.total_gig_workers,
    RANK() OVER (ORDER BY g.total_gig_workers DESC) AS rank_by_gig_workers
FROM gig_workers_gender g


-- Q2: What % of total unorganised workers are gig workers per state? 

-- Measures gig penetration rate — how visible gig workers are within
-- the broader unorganised workforce in each state
 
SELECT
    g.state_name,
    g.total_gig_workers,
    u.total_unorganised_registrations AS total_unorganised,
    ROUND(CAST(g.total_gig_workers AS FLOAT) /COALESCE(u.total_unorganised_registrations, 0) * 100, 4) AS gig_penetration_rate_pct
FROM gig_workers_gender g
JOIN total_unorganised_27mar u 
ON g.state_name = u.state_name
ORDER BY gig_penetration_rate_pct DESC;


-- Q3: Coverage gap — how many workers have zero welfare protection? 

-- Core finding: unorganised workers who are NOT registered as gig workers 

SELECT
    g.state_name,
    u.total_unorganised_registrations AS total_unorganised,
    g.total_gig_workers AS gig_registered,
    u.total_unorganised_registrations - g.total_gig_workers  AS protection_gap,
    ROUND(CAST(g.total_gig_workers AS FLOAT) /COALESCE(u.total_unorganised_registrations, 0) * 100, 2)AS coverage_pct,
    100 - ROUND(CAST(g.total_gig_workers AS FLOAT) /COALESCE(u.total_unorganised_registrations, 0) * 100, 2)AS gap_pct
FROM gig_workers_gender g
JOIN total_unorganised_27mar u
ON g.state_name = u.state_name
ORDER BY protection_gap DESC;



-- Q4: How has eShram registration grown between 23 Mar and 27 Mar 2025?
 
SELECT
    t27.state_name,
    t23.total_unorganised_registrations AS registrations_23mar,
    t27.total_unorganised_registrations AS registrations_27mar,
    t27.total_unorganised_registrations - t23.total_unorganised_registrations  AS growth_4_days,
    ROUND(CAST(
            t27.total_unorganised_registrations -
            t23.total_unorganised_registrations
        AS FLOAT) / 4, 0) AS avg_daily_growth
FROM total_unorganised_27mar t27
JOIN total_unorganised_23mar t23 
ON t27.state_name = t23.state_name
ORDER BY growth_4_days DESC;



-- Q5: Registration gap — eShram gig registered vs state population 

-- Gig workers per lakh population 
 
SELECT
    g.state_name,
    g.total_gig_workers,
    p.total_pop_2025,
    ROUND(CAST(g.total_gig_workers AS FLOAT) /(p.total_pop_2025 / 100000.0),2) AS gig_workers_per_lakh_pop
FROM gig_workers_gender g
JOIN state_population p 
ON g.state_name = p.state_name
ORDER BY gig_workers_per_lakh_pop DESC;


-- Q6: States with law vs without — total worker count comparison 

-- how many unorganised workers live under each protection status
 
SELECT
    c.protection_status,
    COUNT(DISTINCT c.state_name) AS state_count,
    SUM(u.total_unorganised_registrations) AS total_unorganised_workers,
    SUM(g.total_gig_workers) AS total_gig_workers,
    ROUND(CAST(SUM(g.total_gig_workers) AS FLOAT) /COALESCE(SUM(u.total_unorganised_registrations), 0) * 100, 2) 
    AS avg_gig_coverage_pct
FROM state_coverage c
JOIN total_unorganised_27mar u 
ON c.state_name = u.state_name
JOIN gig_workers_gender g      
ON c.state_name = g.state_name
GROUP BY c.protection_status
ORDER BY total_unorganised_workers DESC;


-- Q7: States with high unorganised count but low gig registration

SELECT
    u.state_name,
    u.total_unorganised_registrations AS total_unorganised,
    g.total_gig_workers,
    ROUND(g.total_gig_workers * 100.0 / NULLIF(u.total_unorganised_registrations, 0), 4) AS gig_rate_pct,
    c.protection_status,
    DENSE_RANK() OVER (ORDER BY u.total_unorganised_registrations DESC) AS unorganised_rank,
    DENSE_RANK() OVER (ORDER BY g.total_gig_workers * 1.0 / NULLIF(u.total_unorganised_registrations, 0) ASC) AS lowest_coverage_rank
FROM total_unorganised_27mar u
JOIN gig_workers_gender g 
ON u.state_name = g.state_name
JOIN state_coverage c     
ON u.state_name = c.state_name
ORDER BY unorganised_rank;
