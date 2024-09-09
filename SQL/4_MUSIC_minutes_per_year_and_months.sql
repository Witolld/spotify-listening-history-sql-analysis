select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_all
	group by to_char(ts, 'YYYY-MM')
order by datas
