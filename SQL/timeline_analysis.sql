-- 03_timeline_analysis.sql
-- Gig Worker Welfare Policy Analysis — India


--Q12: How long did each state take — bill passed to gazette notified?

SELECT
    state_or_centre,
    passed_date,
    gazette_date,
    policy_lag_days
FROM policy_lag
ORDER BY policy_lag_days ASC;


-- Q13: What is the average policy lag across all states? 
SELECT
    AVG(policy_lag_days) AS avg_lag_days,
    MIN(policy_lag_days) AS fastest_days,
    MAX(policy_lag_days) AS slowest_days,
    COUNT(*) AS states_with_data
FROM policy_lag;


-- Q14: After Rajasthan 2023 how fast did other states follow? 

SELECT
    state_or_centre,
    event_type,
    event_date,
    enforcement_status,
    DATEDIFF(DAY,'2023-07-24',event_date)  AS days_after_rajasthan
FROM policy_timeline
WHERE event_type IN ('Bill Passed', 'Governor Assent')
AND   state_or_centre != 'Central'
ORDER BY event_date ASC;

