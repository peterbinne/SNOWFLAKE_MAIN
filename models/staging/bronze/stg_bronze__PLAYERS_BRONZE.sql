with

    source as (
        select * from {{ source("raw", "PLAYERS_RAW") }}
    ),

    renamed as (

        select
            player as player_name,
            height as player_height,
            weight as play_weight,
            collage as player_ collage,
            born as player_year_born,
            birth_city as player_birth_city,
            birth_state as player_birth_state

        from source

    )

select *
from renamed
