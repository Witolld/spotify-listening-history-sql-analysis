select 
	extract( year from date) as year,
	extract( month from date) as month,
	avg(daily_minutes) as avg_daily_minutes
from(
	SELECT
        DATE(ts) AS date,
        SUM(ms_played) / 60000.0 AS daily_minutes
    FROM
        sha_all
    GROUP BY
        DATE(ts)
	) 
group by 1, 2
order by 1, 2