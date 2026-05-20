-- 04_diagnostic_analysis.sql
-- Gig Worker Welfare Policy Analysis — India


-- Q15: Gender gap — male vs female gig registration by state 
-- Shows how many fewer women are registered as gig workers vs men
-- Highlights gender disparity in platform economy visibility
 
SELECT
    state_name,
    gig_male,
    gig_female,
    total_gig_workers,
    female_gig_pct,
    gig_male - gig_female AS gender_gap,
    CASE
        WHEN gig_female = 0 THEN 'No Female Registration'
        WHEN female_gig_pct < 20  THEN 'Severely Male Dominated'
        WHEN female_gig_pct < 40  THEN 'Male Dominated'
        WHEN female_gig_pct < 50  THEN 'Slightly Male Dominated'
        ELSE 'Balanced'
    END AS gender_status
FROM gig_workers_gender
ORDER BY female_gig_pct ASC;



--  Q16: Do wealthier states pass gig laws faster? 
-- Joins NSDP economic data with law status

 
SELECT
    c.state_name,
    c.protection_status,
    c.has_gig_law,
    n.nsdp_crore_2024_25,
    n.per_capita_nsdp_rs,
    n.per_capita_status,
    n.nsdp_rank,
    n.economy_size_category
FROM state_coverage c
JOIN state_nsdp n 
ON c.state_name = n.state_name
ORDER BY n.nsdp_crore_2024_25 DESC;


-- Q17: How many workers in no-law states have zero accident insurance? 
 
SELECT
    c.state_name,
    c.protection_status,
    u.total_unorganised_registrations AS unorganised_workers,
    g.total_gig_workers,
    u.total_unorganised_registrations - g.total_gig_workers AS workers_with_no_insurance,
    CASE
        WHEN c.protection_status = 'Enforced'
        AND  c.key_features LIKE '%insurance%' THEN 'Has Insurance Provision'
        WHEN c.protection_status = 'Enforced' THEN 'Enforced But Insurance Unclear'
        ELSE 'No Insurance Coverage'
    END AS insurance_status
FROM state_coverage c
JOIN total_unorganised_27mar u
ON c.state_name = u.state_name
JOIN gig_workers_gender      g
ON c.state_name = g.state_name
ORDER BY workers_with_no_insurance DESC;