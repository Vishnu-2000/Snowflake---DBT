WITH BIKE AS
(
    select
    distinct
    start_station_id,
    start_station_name,
    start_lat,
    start_lng
    from 
    {{ source('demo', 'bike') }}
    where RIDE_ID!='ride_id'
)

select * from bike