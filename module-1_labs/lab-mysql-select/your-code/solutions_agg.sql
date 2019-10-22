USE bank;

-- 1

SELECT 
	-- client_id,
	district_id,
	count(district_id) as SUMME
FROM `client`
WHERE district_id<10
GROUP BY district_id
ORDER BY district_id ASC;

-- 2

SELECT type,
	count(card_id)
FROM card
GROUP BY `type`;


-- 3

SELECT 
	account_id,
	sum(amount) as SUMME
FROM loan
GROUP BY account_id
ORDER BY SUMME DESC;
LIMIT 10;

-- 4

SELECT `date`,
	count(1)
FROM loan
WHERE date<930907
GROUP BY `date`
ORDER BY `date` DESC;

-- 5

SELECT `date`,
	 duration,
	 count(loan_id)
FROM loan
WHERE CAST(`date` as char) LIKE '9712%'
Group BY `date`,duration;

-- 6

SELECT account_id,
	`type`,
	sum(amount)
FROM trans
WHERE account_id=396
GROUP BY account_id,`type`;

-- 7

SELECT  account_id,
	CASE
	WHEN `type` = 'PRIJEM'
		THEN 'INCOMING'
	WHEN `type` = 'VYDAJ'
		THEN 'OUTCOMING'
	END as transacc_type,
	CAST(sum(amount) as SIGNED) as total_am
FROM trans
WHERE account_id = 396
GROUP BY account_id, `type`;

-- 8

SELECT account_id,
	FLOOR(SUM(IF(type='PRIJEM',amount,0))) AS income,
	FLOOR(SUM(IF(type='VYDAJ',amount,0))) AS outcome,
	CONCAT(FLOOR(SUM(IF(type='PRIJEM',amount,0))),' ',FLOOR(SUM(IF(type='VYDAJ',amount,0)))) AS conct,
	FLOOR(SUM(IF(type='PRIJEM',amount,0))) - FLOOR(SUM(IF(type='VYDAJ',amount,0))) AS diff
FROM trans
WHERE account_id = 396
GROUP BY account_id;
	


-- 9

SELECT account_id,
	FLOOR(SUM(IF(type='PRIJEM',amount,0))) - FLOOR(SUM(IF(type='VYDAJ',amount,0))) AS diff
FROM trans
GROUP BY account_id
ORDER BY diff DESC
LIMIT 10 ;




