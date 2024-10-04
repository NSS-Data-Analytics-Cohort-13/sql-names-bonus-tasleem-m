--q1 How many rows are in the names table?
SELECT COUNT (*)
FROM names

--q2 How many total registered people appear in the dataset?
SELECT SUM (num_registered) AS total_registered
FROM names

--q3 Which name had the most appearances in a single year in the dataset?
SELECT name, num_registered, year
FROM names
ORDER BY num_registered DESC
--answer: Linda in 1947

--q4 What range of years are included?
SELECT DISTINCT year
FROM names

--q5 What year has the largest number of registrations?
SELECT year, num_registered
FROM names
ORDER BY num_registered DESC
--answer: 1947

--q6 How many different (distinct) names are contained in the dataset?
SELECT COUNT (DISTINCT name) AS count_distinct_name
FROM names

--q7 Are there more males or more females registered?
SELECT gender, COUNT (gender)
FROM names
GROUP BY gender
--answer: Females

--q8 What are the most popular male and female names overall (i.e., the most total registrations)?
SELECT name, SUM (num_registered) AS total_num_registered, gender
FROM names
GROUP BY name, gender
ORDER BY total_num_registered DESC
--answer: male - James, female - Mary

--q9 What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT name, SUM (num_registered) AS total_num_registered, gender
FROM names
WHERE year BETWEEN 2000 AND 2009
GROUP BY name, gender
ORDER BY total_num_registered DESC
--answer: male - Jacob, female - Emily

--q10 Which year had the most variety in names (i.e. had the most distinct names)?
SELECT year, COUNT (DISTINCT names) AS count_distinct_names
FROM names
GROUP BY year
ORDER BY count_distinct_names DESC
--answer: 2008

SELECT *
FROM names

--q11 What is the most popular name for a girl that starts with the letter X?
SELECT name, SUM (num_registered) AS total_num_registered, gender
FROM names 
WHERE name LIKE 'X%'
GROUP BY name, gender
ORDER BY total_num_registered DESC
--answer: Ximena

--q12 How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
SELECT COUNT (DISTINCT name) AS count_distinct_Q_names
FROM names
WHERE (name LIKE 'Q%' AND name NOT LIKE '_u%')

--q13 Which is the more popular spelling between "Stephen" and "Steven"?
SELECT name, SUM (num_registered) AS total_num_registered
FROM names
WHERE name = 'Stephen' OR name = 'Steven'
GROUP BY name
ORDER BY total_num_registered DESC
--answer: Steven

--q14 What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?
SELECT DISTINCT name, gender
FROM names
WHERE gender = 'M' AND gender = 'F'