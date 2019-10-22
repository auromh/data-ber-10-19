USE publications;

SELECT *
FROM authors;

SELECT *
FROM titleauthor;

SELECT *
FROM titles;


-- CHALLENGE 1
SELECT 
	authors.au_id 	AS `AUTHOR ID`, 
	au_lname		AS `LAST NAME`, 
	au_fname		AS `FIRST NAME`, 
	title			AS TITLE, 
	pub_name		AS PUBLISHER
FROM `authors`
INNER JOIN titleauthor on authors.au_id = titleauthor.au_id
INNER JOIN titles on titleauthor.title_id = titles.title_id
INNER JOIN publishers on titles.pub_id = publishers.pub_id
ORDER BY 1;

-- CHALLENGE 2

SELECT 
	authors.au_id 	AS `AUTHOR ID`,
	au_lname		AS `LAST NAME`, 
	au_fname		AS `FIRST NAME`, 
	pub_name		AS PUBLISHER,
	count(titleauthor.title_id) AS Title_Coun
FROM `authors`
INNER JOIN titleauthor on authors.au_id = titleauthor.au_id
INNER JOIN titles on titleauthor.title_id = titles.title_id
INNER JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY authors.au_id DESC;

-- CHALLENGE 3
SELECT
	authors.au_id 	AS `AUTHOR ID`,
	au_lname		AS `LAST NAME`, 
	au_fname		AS `FIRST NAME`, 
	sum(sales.qty) AS BestSellers
FROM `authors`
INNER JOIN titleauthor on authors.au_id = titleauthor.au_id
INNER JOIN titles on titleauthor.title_id = titles.title_id
-- INNER JOIN publishers on titles.pub_id = publishers.pub_id
INNER JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY BestSellers DESC
LIMIT 3;

-- CHALLENGE 4
SELECT
	authors.au_id 	AS `AUTHOR ID`,
	au_lname		AS `LAST NAME`, 
	au_fname		AS `FIRST NAME`, 
	CASE
		WHEN sum(sales.qty)>0
			THEN sum(sales.qty)
		ELSE 0
	END AS BestSellers
FROM `authors`
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
LEFT JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY BestSellers DESC;


-- BONUS
/*CHECK solutions of advance mysql challenge 1*/

-- CLASS SOLUTION


select au_id as "AUTHOR ID", 
au_lname as "LAST NAME", 
au_fname as "FIRST NAME", 
FLOOR(sum(advance + ROYALTIES)) as PROFITS,
sum(advance) 
from (
		select title_id, au_id, au_lname, au_fname, advance, sum(ROYALTIES) as ROYALTIES 
		from (
				select t.title_id, t.price, t.advance, t.royalty, s.qty, a.au_id, au_lname, au_fname, ta.royaltyper, (t.price * s.qty * t.royalty * ta.royaltyper / 10000) as ROYALTIES
				from titles t
					inner join sales s on s.title_id = t.title_id
					inner join titleauthor ta on ta.title_id = s.title_id
					inner join authors a on a.au_id = ta.au_id
				) as tmp
		group by au_id, title_id
	) as tmp2
group by au_id
order by PROFITS desc
limit 3


