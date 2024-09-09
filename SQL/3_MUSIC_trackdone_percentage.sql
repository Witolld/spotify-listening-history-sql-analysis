with per_trackdone as (select count(ts) as trackdone from sha_all
where reason_end like 'trackdone'
)
,
all_streams as (select count(ts) as all_stream from sha_all
	)
,
 per_endplay as (select count(ts) as endplay from sha_all
where reason_end like 'endplay'
)
-- ,
-- all_streams as (select count(ts) as all_stream from sha_all
-- 	)


select 'trackdone' as reason_end_category, td.trackdone as number, ast.all_stream,
	 (td.trackdone::decimal / ast.all_stream) * 100 AS percentage_of_listened_tracks
from 
	per_trackdone td
cross join all_streams ast
union all
select 'endplay' as reason_end_category, e.endplay as number, ast.all_stream,
	 (e.endplay::decimal / ast.all_stream) * 100 AS percentage_of_listened_tracks
from 
	per_endplay e
cross join all_streams ast
 