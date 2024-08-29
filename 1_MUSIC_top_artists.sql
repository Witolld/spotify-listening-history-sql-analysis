select sum(cast(ms_played as float)/cast((1000*60) as float)) as minutes,  
	master_metadata_album_artist_name from sha_all
group by 2
order by 1 desc