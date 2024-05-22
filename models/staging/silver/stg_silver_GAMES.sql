WITH first_points AS (
    SELECT
        game_id,
        play_team,
        play_team_home_points,
        play_team_away_points,
        LAG(play_team_home_points, 1, 0) OVER (PARTITION BY game_id ORDER BY play_team_home_points, play_team_away_points) AS prev_home_points,
        LAG(play_team_away_points, 1, 0) OVER (PARTITION BY game_id ORDER BY play_team_home_points, play_team_away_points) AS prev_away_points
    FROM
        {{ ref('stg_bronze__PLAY_BY_PLAY_BRONZE') }}
    WHERE
        play_team IS NOT NULL
),
team_mapping AS (
    SELECT DISTINCT
        game_id,
        FIRST_VALUE(play_team) OVER (PARTITION BY game_id ORDER BY play_team_home_points DESC) AS game_home_team,
        FIRST_VALUE(play_team) OVER (PARTITION BY game_id ORDER BY play_team_away_points DESC) AS game_away_team
    FROM
        first_points
    WHERE
        play_team_home_points > prev_home_points OR play_team_away_points > prev_away_points
),
final_scores AS (
    SELECT
        game_id,
        play_team_home_points,
        play_team_away_points,
        play_team,
        GAME_SEASON_YEAR,
        ROW_NUMBER() OVER (PARTITION BY game_id ORDER BY play_team_home_points DESC, play_team_away_points DESC) AS row_num
    FROM
        {{ ref('stg_bronze__PLAY_BY_PLAY_BRONZE') }}
)

SELECT
    fs.game_id,
    tm.game_home_team,
    tm.game_away_team,
    MAX(fs.play_team_home_points) AS game_team_home_total_points,
    MAX(fs.play_team_away_points) AS game_team_away_total_points,
    fs.play_team AS game_final_scorer,
    fs.GAME_SEASON_YEAR
FROM
    final_scores fs
JOIN
    team_mapping tm ON fs.game_id = tm.game_id
WHERE
    fs.row_num = 1
GROUP BY
    fs.game_id, tm.game_home_team, tm.game_away_team, fs.play_team, fs.GAME_SEASON_YEAR

