
## spotify_streaming_history_queries

 
1. Most listened to artists of all time

``` sql
select sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes,  
	master_metadata_album_artist_name from sha_all
group by 2
order by 1 desc
```


2. Most skipped artist by percentage
```sql
with CTE_top_artists as	
	(select 
	count(ts) as total_streams,
	SUM(cast (ms_played as float)) / 60000.0 as total_minutes_streamed,
	master_metadata_album_artist_name from sha_all
	group by 3
	)
,
	CTE_top_skipped as
	(select count(reason_end)
	as skipped, 
	master_metadata_album_artist_name from sha_all
	where reason_end like 'fwdbtn'
group by 2
order by 1 desc)

select 
	ta.master_metadata_album_artist_name, 
	ta.total_streams, 
	ta.total_minutes_streamed,
	COALESCE(cast(ts.skipped as float), 0) as total_skips,
	COALESCE(cast(ts.skipped as float ), 0 ) /nullif(ta.total_streams, 0 ) * 100 as skip_rate_percentage
from 
	CTE_top_artists ta
left join CTE_top_skipped ts
on ta.master_metadata_album_artist_name=ts.master_metadata_album_artist_name
where ta.total_streams > 50
order by  skip_rate_percentage DESC
limit 50
```


3. Percentage of songs listened to to the end
``` sql
with CTE_top_artists as	
	(select 
	count(ts) as total_streams,
	SUM(cast (ms_played as float)) / 60000.0 as total_minutes_streamed,
	master_metadata_album_artist_name from sha_all
	group by 3
	)
,
	CTE_top_skipped as
	(select count(reason_end)
	as skipped, 
	master_metadata_album_artist_name from sha_all
	where reason_end like 'fwdbtn'
group by 2
order by 1 desc)

select 
	ta.master_metadata_album_artist_name, 
	ta.total_streams, 
	ta.total_minutes_streamed,
	COALESCE(cast(ts.skipped as float), 0) as total_skips,
	COALESCE(cast(ts.skipped as float ), 0 ) /nullif(ta.total_streams, 0 ) * 100 as skip_rate_percentage
from 
	CTE_top_artists ta
left join CTE_top_skipped ts
on ta.master_metadata_album_artist_name=ts.master_metadata_album_artist_name
where ta.total_streams > 50
order by  skip_rate_percentage DESC
limit 50
```

4. Number of minutes over months and years.
```sql
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_all
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
order by datas
```sql
SELECT 
	 
	to_char(ts, 'ID') as day_id,
	to_char(ts, 'Day') as day_name,
	
	sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes FROM sha_all
group by 

	to_char(ts, 'ID') ,
	to_char(ts, 'Day')
order by 3 desc
```

5. Top days of the week in terms of minutes listened to
```sql
SELECT 
	 
	to_char(ts, 'ID') as day_id,
	to_char(ts, 'Day') as day_name,
	
	sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes FROM sha_all
group by 

	to_char(ts, 'ID') ,
	to_char(ts, 'Day')
order by 3 desc
```

6. Average number of minutes in a given month (all years)
```sql
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
```
7. Top albums of all time (top 50)
```sql
select sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes,  
	master_metadata_album_album_name from sha_all
group by 2
order by 1 desc
limit 50
```
8. Number of artists I listened to in a given month and year
```sql
SELECT 
    EXTRACT(YEAR FROM ts) AS year,
    to_char(ts, 'Month') AS month,
    COUNT(DISTINCT master_metadata_album_artist_name) AS number_of_unique_artists
FROM 
    sha_all
GROUP BY 
    year, month
ORDER BY 
    year, month;
```
9. Top artists I listened to for the first time in a given year and the time I devoted to them (i.e. those with whom I best matched my taste).
```sql
select 
	top_artists.artist_name, 
	top_artists.first_year_listened, 
	sum(cast(sa.ms_played as float)/cast((1000*60) as float)) as minutes 
from 
	top_artists 
join 
	sha_all sa
on 
	sa.master_metadata_album_artist_name = top_artists.artist_name 
where 
	extract(year from sa.ts) = top_artists.first_year_listened 
group by 
	2, 1
order by 
	3 desc
limit 50
```

10. Impact of shuffle mode on skipping songs.
```sql
SELECT 
    (CAST((SELECT COUNT(reason_end) 
           FROM sha_all 
           WHERE shuffle LIKE 'true' AND reason_end LIKE 'fwdbtn') AS DECIMAL) 
    / 
    CAST((SELECT COUNT(reason_end) 
          FROM sha_all 
          WHERE shuffle LIKE 'true') AS DECIMAL)) * 100 AS percentage_of_fwdbtn, 'true' as shuffle
UNION ALL
SELECT 
    (CAST((SELECT COUNT(reason_end) 
           FROM sha_all 
           WHERE shuffle LIKE 'false' AND reason_end LIKE 'fwdbtn') AS DECIMAL) 
    / 
    CAST((SELECT COUNT(reason_end) 
          FROM sha_all 
          WHERE shuffle LIKE 'false') AS DECIMAL)) * 100 AS percentage_of_fwdbtn, 'false' as shuffle
```