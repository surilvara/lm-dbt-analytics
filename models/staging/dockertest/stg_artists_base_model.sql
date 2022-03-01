select * from {{ source('dockertest_bq', 'artists') }}
ORDER BY artist_id ASC