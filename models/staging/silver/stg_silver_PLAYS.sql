with 
    source as (
        select * from {{ ref('stg_bronze__PLAY_BY_PLAY_BRONZE') }}
    )

select 
    GAME_ID,
    PLAYER_ID,
    PLAY_PERIOD,
    PLAY_TIME,
    PLAY_TEAM_HOME_POINTS,
    PLAY_TEAM_AWAY_POINTS,
    PLAY_TEAM,
    PLAY_TYPE,
    PLAY_SUBTYPE,
    PLAY_OUTCOME,
    PLAY_COURT_X,
    PLAY_COURT_Y

from source
order by GAME_ID, play_period, play_time desc

