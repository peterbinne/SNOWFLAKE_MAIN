with

    source as (select * from {{ source("raw", "PLAYERS_SEASON_STATS_RAW") }}),

    renamed as (

        select
            year as player_season_year,
            player as player_name,
            pos as player_position,
            age as player_age,
            tm as player_tm,
            g as player_g,
            gs as player_gs,
            mp as player_mp,
            per as player_per,
            ts as player_ts,
            par as player_par,
            ftr as player_ftr,
            orb_percent as player_orb_percent,
            drb_percent as player_drb_percent,
            trb_percent as player_trb_percent,
            ast_percent as player_ast_percent,
            stl_percent as player_stl_precent,
            blk_percent as player_blk_percent,
            tov_percent as player_tov_percent,
            usg_percent as player_usg_percent,
            blanl as player_blanl,
            ows as player_ows,
            dws as player_dws,
            ws as player_ws,
            ws_fourtyeight as player_ws_fourtyeight,
            blank2 as player_blank2,
            obpm as player_odpm,
            dbpm as player_dbpm,
            bpm as player_bpm,
            vorp as player_vorp,
            fg as player_fg,
            fga as player_fga,
            fg_percent as player_fg_percent,
            threep as player_threep,
            threepa as player_threepa,
            threep_percent as player_threep_percent,
            twop as player_twop,
            twopa as player_twopa,
            twop_percent as player_twopa_percent,
            efg_percent as player_efg_percent,
            ft as player_ft,
            fta as player_fta,
            ft_percent as player_ft_percent,
            orb as player_orb,
            drb as player_drb,
            trb as player_trb,
            ast as player_ast,
            stl as player_stl,
            blk as player_blk,
            tov as player_tov,
            pf as player_pf,
            pts as player_pts

        from source

    )

select *
from renamed
