SELECT 
    EXTRACT(MONTH FROM time_id) AS month,
    client_id,
    COUNT(DISTINCT user_id) AS unique_users
FROM fact_events
GROUP BY EXTRACT(MONTH FROM time_id), client_id
ORDER BY month, client_id;
