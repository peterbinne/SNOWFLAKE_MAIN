with

    source as (select * from {{ source("raw", "PLAY_BY_PLAY_RAW") }}),

    renamed as (

        select
            gameid as game_id,
            period as game_period,
            clock as game_time,
            h_pts as team_home_points,
            a_pts as team_away_points,
            team as play_team,
            playerid as player_id,
            player as player_name,
            type as play_type,
            subtype as play_subtype,
            result as play_outcome,
            x as play_court_x,
            y as play_court_y,
            dist as play_distance,
            desc as play_description,
            season as game_season_year,
        -- Create home and away team name as game_home/away_team by grouping by
        -- game_id and finding unique values in play_team.
        -- Clean up game_time
        from source

    )

select *
from renamed
