SELECT 
    t1.mediataghistory_id, 
    t1.media_id, 
    t1.tag_id, 
    t1.media_creation_date, 
    t1.key, 
    t1.tag_creation_date,
    MAX(t1.row_rank) - 1 as num_duplicates
FROM {{ ref('stg_rowcount') }} as t1
GROUP BY t1.mediataghistory_id, t1.media_id, t1.tag_id, t1.media_creation_date, t1.key, t1.tag_creation_date