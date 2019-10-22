SELECT client_id 
FROM client
WHERE district_id = 1
ORDER BY district_id ASC
LIMIT 5;

SELECT client_id
FROM client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

SELECT amount
FROM loan
ORDER BY amount ASC
LIMIT 3;

SELECT `status`
FROM loan
GROUP BY `status`
ORDER BY `status`;

SELECT loan_id
FROM loan
ORDER BY payments DESC
LIMIT 1;

SELECT 
	account_id,
	amount
FROM loan
ORDER BY account_id
LIMIT 5;

SELECT account_id
FROM loan
WHERE duration=60
ORDER BY amount
LIMIT 5;

SELECT DISTINCT k_symbol
FROM `order`
ORDER BY k_symbol ASC;

SELECT order_id
FROM `order`
WHERE account_id = 34;

SELECT DISTINCT account_id
FROM `order`
WHERE order_id BETWEEN 29540 AND 29560
LIMIT 4;

SELECT amount
FROM `order`
WHERE account_to = 30067122;

SELECT
	trans_id,
	`date`,
	`type`,
	amount
FROM trans
WHERE account_id = 793
ORDER BY `date` DESC
LIMIT 10;
