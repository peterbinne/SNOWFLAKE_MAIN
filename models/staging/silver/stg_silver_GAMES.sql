with
    source as (select * from {{ ref('stg_bronze__PLAY_BY_PLAY_BRONZE') }}),

    renamed as (

        select
            game_id,
            play_team_home_points,
            play_team_away_points,
            play_team,
            player_id,
            game_season_year,
        -- Create home and away team name as game_home/away_team by grouping by
        -- game_id and finding unique values in play_team.
        -- Clean up game_time
        from source

    )

select *
from renamed
