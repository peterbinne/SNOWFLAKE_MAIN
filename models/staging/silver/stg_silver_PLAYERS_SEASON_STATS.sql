with 
    source as (
        select * from {{ ref('stg_bronze__PLAYERS_SEASON_STATS_BRONZE') }}
    )

select *
from source

