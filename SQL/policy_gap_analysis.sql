-- 02_policy_gap_analysis.sql
-- Gig Worker Welfare Policy Analysis — India


-- Q8: How do cess rates compare across enforced states? 
-- Shows welfare fund contribution rates for states that have passed laws
-- Cess = small % platforms pay per transaction into welfare fund

SELECT
    state_name,
    law_passed_date,
    gazette_date,
    enforcement_status,
    protection_status,
    key_features,
    CASE state_name
        WHEN 'Rajasthan' THEN 2.0
        ELSE NULL
    END AS cess_rate_pct
FROM state_coverage
WHERE protection_status = 'Enforced'
ORDER BY law_passed_date ASC;


--Q9: No-law states ranked by population 

SELECT
    c.state_name,
    c.protection_status,
    p.total_pop_2025,
    u.total_unorganised_registrations   AS unorganised_workers,
    g.total_gig_workers
FROM state_coverage c
JOIN state_population        p 
ON c.state_name = p.state_name
JOIN total_unorganised_27mar u 
ON c.state_name = u.state_name
JOIN gig_workers_gender      g 
ON c.state_name = g.state_name
WHERE c.protection_status = 'No_Law'
ORDER BY p.total_pop_2025 DESC;


-- Q10: % of gig workers by protection status 
SELECT
    c.protection_status,
    COUNT(DISTINCT c.state_name) AS num_states,
    SUM(g.total_gig_workers) AS total_gig_workers,
    SUM(p.total_pop_2025) AS total_population
FROM state_coverage c
JOIN gig_workers_gender g 
ON c.state_name = g.state_name
JOIN state_population   p 
ON c.state_name = p.state_name
GROUP BY c.protection_status
ORDER BY total_gig_workers DESC;


-- Q11: Top 10 most underserved states (no law + high workers) 
SELECT TOP 10
    c.state_name,
    c.protection_status,
    u.total_unorganised_registrations AS unorganised_workers,
    g.total_gig_workers,
    u.total_unorganised_registrations - g.total_gig_workers AS protection_gap
FROM state_coverage c
JOIN total_unorganised_27mar u 
ON c.state_name = u.state_name
JOIN gig_workers_gender      g 
ON c.state_name = g.state_name
WHERE c.protection_status IN ('No_Law', 'In_Progress', 'Discussions')
ORDER BY u.total_unorganised_registrations DESC;