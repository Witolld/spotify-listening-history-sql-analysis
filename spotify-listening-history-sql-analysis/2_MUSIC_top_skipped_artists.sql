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