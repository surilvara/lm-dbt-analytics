{%- set keys_list = get_key_list() -%}

select
media_id,
{%- for key in keys_list %}
sum(case when key = '{{key}}' then 1 else 0 end) as {{key}}
{{ "," if not loop.last }} -- another way to write '{{ "," if not loop.last }}' is '{% if not loop.last %},{% endif %}'. It stops the trailing comma for the last select statement before FROM.
{% endfor %}
from {{ ref('duplicates_rm') }}
group by 1