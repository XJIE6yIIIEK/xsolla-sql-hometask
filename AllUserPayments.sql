SELECT * FROM payments
JOIN purchases
ON paymnets.payment_num = purchases.payment_num
WHERE purchases.user_id = '<user_id>'