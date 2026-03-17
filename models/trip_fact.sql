with trips as 
(
    select 
    RIDE_ID,
    -- RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
    START_STATION_ID,
    END_STATION_ID,
    MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS 
    from {{ ref('stg_bike') }}
    WHERE RIDE_ID!='bikeid' and ENDED_AT!='stoptime'
)

select * from trips