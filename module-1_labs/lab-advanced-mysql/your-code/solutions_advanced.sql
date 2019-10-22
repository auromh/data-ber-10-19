-- ADVANCE SQL

-- STEP 1

SELECT ta.au_id,
	t.title_id,
	t.price*s.qty*t.royalty/100*ta.royaltyper/100 AS royalty_sale
FROM titles t
JOIN sales s on s.title_id = t.title_id
JOIN titleauthor ta on ta.title_id = t.title_id;

-- STEP 2

SELECT r.au_id,
	r.title_id,
	sum(r.royalty_sale)
FROM (
	SELECT ta.au_id,
		t.title_id,
		t.price*s.qty*t.royalty/100*ta.royaltyper/100 AS royalty_sale
	FROM titles t
		JOIN sales s on s.title_id = t.title_id
		JOIN titleauthor ta on ta.title_id = t.title_id
) r
GROUP BY 1,2;

-- STEP 1 and 2 together

SELECT ta.au_id,
	t.title_id,
	t.advance,
	sum(t.price*s.qty*t.royalty/100*ta.royaltyper/100) AS royalty_sale
FROM titles t
JOIN sales s on s.title_id = t.title_id
JOIN titleauthor ta on ta.title_id = t.title_id
GROUP BY 1,2;

-- STEP 3 

SELECT rr.au_id,
		-- rr.title_id,
	  FLOOR(sum(rr.advance + rr.royalty_sale)) AS profit
FROM (
	SELECT ta.au_id,
		t.title_id,
		t.advance,
		sum(t.price*s.qty*t.royalty/100*ta.royaltyper/100) AS royalty_sale
	FROM titles t
		JOIN sales s on s.title_id = t.title_id
		JOIN titleauthor ta on ta.title_id = t.title_id
	GROUP BY 1,2
) rr
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;


-- CHALLENGE 2

CREATE TEMPORARY TABLE royalty_first AS(
SELECT ta.au_id,
	t.title_id,
	t.advance,
	sum(t.price*s.qty*t.royalty/100*ta.royaltyper/100) AS royalty_sale
FROM titles t
JOIN sales s on s.title_id = t.title_id
JOIN titleauthor ta on ta.title_id = t.title_id
GROUP BY 1,2);

SELECT rr.au_id,
		-- rr.title_id,
	  FLOOR(sum(rr.advance + rr.royalty_sale)) AS profit
FROM royalty_first rr
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;


-- CHALLENGE 3
CREATE TABLE most_profiting_authors AS(
SELECT rr.au_id,
		-- rr.title_id,
	  FLOOR(sum(rr.advance + rr.royalty_sale)) AS profit
FROM (
	SELECT ta.au_id,
		t.title_id,
		t.advance,
		sum(t.price*s.qty*t.royalty/100*ta.royaltyper/100) AS royalty_sale
	FROM titles t
		JOIN sales s on s.title_id = t.title_id
		JOIN titleauthor ta on ta.title_id = t.title_id
	GROUP BY 1,2
) rr
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3
);

SELECT *
FROM most_profiting_authors;
