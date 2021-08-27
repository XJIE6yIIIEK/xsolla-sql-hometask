SELECT * FROM payments
JOIN purchases
ON paymnets.payment_num = purchases.payment_num
WHERE (purchases.user_id = '<user_id>') AND (payments.payment_date BETWEEN '<date_1>' AND '<date_2>')