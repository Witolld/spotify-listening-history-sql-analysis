SELECT 
	 
	to_char(ts, 'ID') as day_id,
	to_char(ts, 'Day') as day_name,
	sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes FROM sha_all
group by 

	to_char(ts, 'ID') ,
	to_char(ts, 'Day')
order by 3 desc