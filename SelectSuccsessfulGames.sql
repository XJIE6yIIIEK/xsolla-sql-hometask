SELECT game, COUNT(*) AS succsessful_payments FROM payments
WHERE (payment_canceled IS FALSE) AND (d_date BETWEEN '<date_1>' AND '<date_2>')
GROUP BY game
HAVING COUNT(*) > 0
ORDER BY succsessful_payments