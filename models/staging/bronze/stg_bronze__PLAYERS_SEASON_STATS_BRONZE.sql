{{ 
    config(
        materialized='table',
        schema='bronze'
        ) 
    }}

with 

source as (

    select * from {{ source('raw', 'PLAYERS_SEASON_STATS_RAW') }}

),

renamed as (

    select
        year as player_season_year,
        player as player_name,
        pos as player_position,
        age as player_age,
        tm,
        g,
        gs,
        mp,
        per,
        ts,
        par,
        ftr,
        orb_percent,
        drb_percent,
        trb_percent,
        ast_percent,
        stl_percent,
        blk_percent,
        tov_percent,
        usg_percent,
        blanl,
        ows,
        dws,
        ws,
        ws_fourtyeight,
        blank2,
        obpm,
        dbpm,
        bpm,
        vorp,
        fg,
        fga,
        fg_percent,
        threep,
        threepa,
        threep_percent,
        twop,
        twopa,
        twop_percent,
        efg_percent,
        ft,
        fta,
        ft_percent,
        orb,
        drb,
        trb,
        ast,
        stl,
        blk,
        tov,
        pf,
        pts

    from source

)

select * from renamed
