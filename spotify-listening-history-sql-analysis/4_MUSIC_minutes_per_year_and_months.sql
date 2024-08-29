select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2014_2018_0
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
union all
select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2018_1
	where master_metadata_track_name not like 'null'
group by to_char(ts, 'YYYY-MM')
union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2018_2019_2
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
	union all
		select 
	to_char(ts, 'YYYY-MM') as datas, 
	sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2019_3
	where master_metadata_track_name not like 'null'
		group by to_char(ts, 'YYYY-MM')
union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2019_2020_4
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2020_5
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
	union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2020_2021_6
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
	union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2021_7
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
	union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2021_2022_8
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
	union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2022_9
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
	union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2022_2023_10
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
	union all
	select 
to_char(ts, 'YYYY-MM') as datas, 
sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes from sha_2023_2024_11
	where master_metadata_track_name not like 'null'
	group by to_char(ts, 'YYYY-MM')
order by datas
