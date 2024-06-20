SELECT
  DATE_TRUNC('DAY', ts) AS ts,
  COUNT(*) AS count
FROM public.messages
WHERE
  NOT bot_id IS NULL
  AND NOT bot_profile__app_id IS NULL
  AND NOT bot_profile__name IS NULL
  AND NOT bot_profile__team_id IS NULL
  AND NOT channel_id IS NULL
GROUP BY
  DATE_TRUNC('DAY', ts)
LIMIT 50000;

SELECT
  DATE_TRUNC('DAY', ts) AS ts,
  COUNT(*) AS count
FROM public.messages
WHERE
  NOT bot_id IS NULL
  AND NOT bot_profile__app_id IS NULL
  AND NOT bot_profile__name IS NULL
  AND NOT bot_profile__team_id IS NULL
  AND NOT channel_id IS NULL
  AND NOT client_msg_id IS NULL
GROUP BY
  DATE_TRUNC('DAY', ts)
LIMIT 50000;


SELECT level_of_aggregation AS zx_segment, IFF(SUM(weighted_ctr_conversions) > 0, round(( SUM(ctr_revenue) / SUM(weighted_ctr_conversions)),6), 0.0) + 0E0 AS ctr_acv, IFF(SUM(weighted_ctr_orders) > 0, round(( SUM(ctr_revenue) / SUM(weighted_ctr_orders)),6), 0.0) + 0E0 AS ctr_aov, COALESCE(SUM(weighted_ctr_conversions), 0) AS weighted_ctr_conversions, COALESCE(SUM(weighted_ctr_orders), 0) AS weighted_ctr_orders, IFF(SUM(weighted_trt_conversions) > 0, round(( SUM(spend) / SUM(weighted_trt_conversions)),6), 0.0) + 0E0 AS cost_per_gross_new_sales, IFF(SUM(delivered) > 0, round(( SUM(clicks) / SUM(delivered)),6), 0.0) + 0E0 AS click_rate, COALESCE(SUM(clicks), 0) AS clicks FROM crm.reporting.v_fct_zx_poc_stats fzp WHERE ((((fzp.time_stamp BETWEEN '2024-05-12 00:00:00' AND '2024-06-10 23:59:59') AND (((level_of_aggregation IS NOT NULL) AND (level_of_aggregation != '')) OR ((level_of_aggregation IS NOT NULL) AND (level_of_aggregation != '')) OR ((level_of_aggregation IS NOT NULL) AND (level_of_aggregation != '')))) AND (customer_key ILIKE 'Email_Customers::4')) AND (breakdown_name ILIKE 'segment')) GROUP BY level_of_aggregation ORDER BY zx_segment ASC LIMIT 20 OFFSET 0


SELECT id, first_name, last_name, department, salary
FROM employees
WHERE (department = 'Sales' AND salary > 50000 AND hire_date > '2020-01-01')
   OR (department = 'Engineering' AND salary BETWEEN 60000 AND 80000 AND hire_date < '2019-01-01')
   OR (department = 'HR' AND salary < 45000)
   AND last_name LIKE 'S%'
ORDER BY salary DESC;





SELECT id, first_name, last_name, department, salary
FROM employees
WHERE (department = 'Sales' AND salary > 50000 AND hire_date > '2020-01-01')
   OR (department = 'Engineering' AND salary BETWEEN 60000 AND 80000 AND hire_date < '2019-01-01')
   OR (department = 'HR' AND salary < 45000)
   AND last_name LIKE 'S%'
ORDER BY salary DESC;


SELECT "PURCHASE_CHANNEL" AS "PURCHASE_CHANNEL",
       sum("REVENUE") AS "SUM(REVENUE)"
FROM
  (SELECT *
   from demo_db.public.attribution_results_ashley_furniture_demo_append) AS virtual_table
WHERE "AGENCY" IS NOT NULL
  AND "CHANNEL" IS NOT NULL
GROUP BY "PURCHASE_CHANNEL"
ORDER BY "SUM(REVENUE)" DESC
LIMIT 100;

