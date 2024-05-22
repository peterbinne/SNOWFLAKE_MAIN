with 
    source as (
        select * from {{ ref('stg_bronze__PLAYERS_BRONZE') }}
    )

select *
from source

