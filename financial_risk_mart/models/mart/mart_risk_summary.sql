select
    risk_rating,
    count(*) as total_transactions,
    sum(amount) as total_amount,
    avg(amount) as avg_transaction_amount
from {{ ref('int_transactions_with_risk') }}
group by risk_rating