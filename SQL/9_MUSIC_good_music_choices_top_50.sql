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