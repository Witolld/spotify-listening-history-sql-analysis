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