select
  media_id,
  {{ dbt_utils.pivot(
      "duplicates_rm.key",
      dbt_utils.get_column_values(ref('duplicates_rm'), "key")
  ) }}
from {{ ref('duplicates_rm') }}
group by 1