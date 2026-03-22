USE netflix_db;
SELECT * FROM netflix_titles LIMIT 5;

-- Q1: Total number of titles
SELECT COUNT(*) AS total_titles FROM netflix_titles;

-- Q2: Count of Movies vs TV Shows
SELECT type, COUNT(*) AS count
FROM netflix_titles
GROUP BY type;

-- Q3: Top 10 countries with most content
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL AND country != ''
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- Q4: Content added per year (trend)
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC
LIMIT 15;

-- Q5: Top 10 directors with most titles
SELECT director, COUNT(*) AS total
FROM netflix_titles
WHERE director IS NOT NULL AND director != ''
GROUP BY director
ORDER BY total DESC
LIMIT 10;

-- Q6: Most common ratings
SELECT rating, COUNT(*) AS total
FROM netflix_titles
WHERE rating IS NOT NULL AND rating != ''
GROUP BY rating
ORDER BY total DESC;

-- Q7: Null value check (data cleaning)
SELECT 
  SUM(CASE WHEN director = '' OR director IS NULL THEN 1 ELSE 0 END) AS missing_director,
  SUM(CASE WHEN country = '' OR country IS NULL THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN cast = '' OR cast IS NULL THEN 1 ELSE 0 END) AS missing_cast
FROM netflix_titles;

-- Q8: Top 10 genres
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

-- Q9: Movies vs TV Shows by country (top 5 countries)
SELECT country, type, COUNT(*) AS total
FROM netflix_titles
WHERE country IN ('United States', 'India', 'United Kingdom', 'Japan', 'South Korea')
GROUP BY country, type
ORDER BY country, type;

-- Q10: Content added over the years (date_added)
SELECT 
  SUBSTRING(date_added, -4) AS year_added,
  COUNT(*) AS total
FROM netflix_titles
WHERE date_added IS NOT NULL AND date_added != ''
GROUP BY year_added
ORDER BY year_added DESC;

-- Q11: India specific content analysis
SELECT type, rating, COUNT(*) AS total
FROM netflix_titles
WHERE country LIKE '%India%'
GROUP BY type, rating
ORDER BY total DESC;

-- Q12: Most productive year for Movies
SELECT release_year, COUNT(*) AS total_movies
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY release_year
ORDER BY total_movies DESC
LIMIT 10;
