select
    customer_sk,
    customer_id,
    customer_name,
    risk_rating,
    valid_from,
    valid_to,
    is_current
from {{ source('raw', 'customers') }}