with t1 as (
    SELECT 
        * 
    FROM datalake-328011.test.med_tagh_mth
),

t2 as (
    SELECT 
        t1.*, 
        ROW_NUMBER() OVER (PARTITION BY t1.mediataghistory_id, t1.media_id, t1.tag_id, t1.media_creation_date, t1.key, t1.tag_creation_date order by t1.media_creation_date) as row_rank,
    FROM t1
)

SELECT 
    t2.mediataghistory_id, 
    t2.media_id, 
    t2.tag_id, 
    t2.media_creation_date, 
    t2.key, 
    t2.tag_creation_date,
    MAX(t2.row_rank) - 1 as num_duplicates,
FROM t2
GROUP BY t2.mediataghistory_id, t2.media_id, t2.tag_id, t2.media_creation_date, t2.key, t2.tag_creation_date