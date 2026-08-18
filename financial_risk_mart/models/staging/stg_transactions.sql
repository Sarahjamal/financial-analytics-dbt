select
    transaction_id,
    customer_sk,
    transaction_date,
    amount
from {{ source('raw', 'transactions') }}