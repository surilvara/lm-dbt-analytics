SELECT 
        *, 
        ROW_NUMBER() OVER (PARTITION BY mediataghistory_id, media_id, tag_id, media_creation_date, key, tag_creation_date order by media_creation_date) as row_rank,
FROM datalake-328011.test.med_tagh_mth