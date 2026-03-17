WITH daily_weather as
(
    select 
    date(time) as day,
    weather,
    temp,
    pressure,
    humidity,
    clouds

    from 
    {{ source('demo', 'weather') }}
    
)
,daily_weather_agg as 
(
    select 
    day,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds
    from daily_weather
    group by 1,2
    qualify row_number() over(partition by day order by count(weather) desc)=1
    
)
select * from daily_weather_agg