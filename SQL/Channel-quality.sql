--channel quality 
with C as(
select [channel],sum([count_Customers]) as total_customer from [dbo].[clean_Customers]
group by [channel]),

P as (
select [channel], sum([count_Parcels]) as total_paracel from [dbo].[clean_Parcels]
group by [channel])

select C.[channel], C.total_customer, P.total_paracel, CAST(total_paracel as float)/total_customer as quality
from C
join P
on(C.[channel] = P.[channel])
