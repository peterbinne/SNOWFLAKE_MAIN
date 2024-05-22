with

    source_players as (
        select
            *,
            concat(
                left(player_name, 1),
                '. ',
                substring(player_name, position(' ' in player_name) + 1)
            ) as player_short_name
        from {{ ref("stg_bronze__PLAYERS_SEASON_STATS_BRONZE") }}
    ),

    source_playbyplay as (select * from {{ ref("stg_bronze__PLAY_BY_PLAY_BRONZE") }}),

    source_players_only as (select * from {{ ref('stg_bronze__PLAYERS_BRONZE') }})

select
    source_playbyplay.player_id,
    source_players.player_position,
    source_players.player_name,
    source_players.player_age,
    source_players.player_season_year,
    source_players_only.*
from source_players
JOIN
    source_players_only ON source_players.player_name = source_players_only.player_name

join
    source_playbyplay on source_players.player_short_name = source_playbyplay.player_name
    and source_players.player_season_year = source_playbyplay.game_season_year

