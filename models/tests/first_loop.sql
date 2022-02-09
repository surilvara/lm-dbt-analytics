{%- set keys_list = get_key_list() -%}

select
media_id,
{%- for key in keys_list %}
sum(case when key = '{{key}}' then 1 else 0 end) as {{key}}
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('duplicates_rm') }}
group by 1