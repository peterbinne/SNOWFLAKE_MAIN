{{ 
    config(
        materialized='table',
        schema='silver'
        ) 
    }}

with 

source as (

    select * from {{ ref('stg_bronze__PLAYERS_BRONZE') }}

),

SELECT * 