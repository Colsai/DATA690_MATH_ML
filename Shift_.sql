-- Load the Data
CREATE TABLE if not exists advertisers(
  time integer,
  click integer,
  channel varchar(12),
  conversion integer,
  advertiser_id integer
);

INSERT INTO
  advertisers (time, click, channel, conversion, advertiser_id)
  
VALUES
  (1, 1, 'Youtube', Null, 1),
  (2, Null, Null, 1, 1),
  (3, Null, Null, 1, 1),
  (4, 1, 'Search', Null, 1),
  (5, 1,'Youtube', Null, 1),
  (1, Null, Null, 1, 2),
  (2, 1, 'Search', Null, 2),
  (3, Null, Null, 1, 2)
  ;

-- Query 1
select click,
case
when channel IS Null THEN channel = lag()
else channel
end as channel_,
*, LEAD(conversion, 1) over (partition by advertiser_id order by time asc) as lead_click from advertisers

-- Query 2
SELECT channel, sum(lag_use)
FROM 
(
select *, LEAD(conversion, 1) over (partition by advertiser_id order by time asc) as lag_use from advertisers
) as temp_table
group by channel
