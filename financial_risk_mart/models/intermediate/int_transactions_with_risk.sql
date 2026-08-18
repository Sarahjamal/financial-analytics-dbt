select
    t.transaction_id,
    t.transaction_date,
    t.amount,
    c.customer_id,
    c.customer_name,
    c.risk_rating
from {{ ref('stg_transactions') }} t
join {{ ref('stg_customers') }} c on t.customer_sk = c.customer_sk