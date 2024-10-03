
![Spotify](https://cdn2.downdetector.com/static/uploads/c/300/12f48/Spotify_Logo_RGB_Green.png)

#  My Spotify streaming history
## 
The goal of this project is to showcase my SQL skills and better understand the history of music playback over the years I’ve used Spotify (2014-2024). As a radio personality, I’ve spent a lot of time listening to and selecting music for my shows. As such, this is a particularly personal and important project for me. Here’s a rough summary of what I’ve managed to extract from the database. The topics covered in this query are not exhaustive and are intended as a starting point for further research.
##### 


## ETL process

In this project, I performed a manual ETL process, where I extracted data from CSV files, transformed the data by merging tables and cleaning it, and loaded it into PostgreSQL using pgAdmin for further analysis.

#### More on this:
The basis of this study is my personal database downloaded from Spotify: Spotify Extended Streaming History which each Spotify user can request. Despite the simple structure of the database, its over 180000 records can tell a lot about music listening habits and personal taste.
The tool I used to run it was PostgreSQL’s pgAdmin. I converted downloaded JSONs into CSV files and I copied CSV data into the created “sha_all” database.
In order to avoid unnecessary and repeated use of the `UNION ALL`, I permanently connected a database consisting of more than 10 files, as each of them contained the same columns.
I deleted columns that didn’t add up to the project. These were either columns that  always contain the same value (*username, conn_country, platform, user_agent_decrypted* -  these factors couldn’t be of any value to this study) or columns with values that indicate something that wasn’t a significant part of my streaming history (*offline, offline_timestamp, incognito_mode*).

I also resigned from including my podcast streaming history because the habits that govern listening to podcasts are different and there is so much data that it could be a field for separate analysis.

Features
- Analysis of top artists, albums, and tracks based on streaming frequency.
- Insights into listening habits across months and years.
- Identification of skipped tracks and shuffled play statistics.
- SQL queries demonstrating use of aggregation functions, `JOIN` operations, and common table expressions.












*Questions and queries can be found in separate files. 
