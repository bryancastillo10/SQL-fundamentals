-- SQLite

-- Filtering people table with people living only at California
SELECT *
FROM people
WHERE state_code='CA';

-- Filtering by people with hat only
SELECT *
FROM people
WHERE shirt_or_hat = 'hat';

-- More filtering by AND 
SELECT first_name, last_name
FROM people
WHERE state_code='CA' AND shirt_or_hat='shirt' AND team='Angry Ants';

-- Specific filtering adding LIKE to match %word
-- %word%   word%
SELECT *
FROM people
WHERE company LIKE 'B%N';

-- Sorting Data by ORDER BY
-- ASC is ascending, DESC is descending
SELECT first_name,last_name
FROM people
ORDER BY first_name DESC;


-- Geting some information about a data
-- LENGTH counts the number of string letters
-- DISTINCT filtering specific values in a column
-- COUNT
SELECT DISTINCT(first_name) 
FROM people;

-- Joining Function
SELECT people.first_name, people.state_code, states.division
FROM people
JOIN states ON people.state_code=states.state_abbrev;

--Overlapping Keys (INNER JOIN)
SELECT DISTINCT(people.state_code), states.state_abbrev
FROM states
LEFT JOIN people ON people.state_code = states.state_abbrev
ORDER BY people.state_code;

-- Grouping Filters
SELECT state_code, quiz_points, COUNT(quiz_points)
FROM people
GROUP BY state_code, quiz_points;

-- Test-2
SELECT states.region,team, COUNT(people.team)
FROM people
JOIN states ON people.state_code = states.state_abbrev 
GROUP BY people.team, states.region;

-- Aggregate Functions in SQL
SELECT team, COUNT(*), SUM(quiz_points), AVG(quiz_points)
FROM people
GROUP BY team;

-- SELECT first_name, last_name, quiz_points
SELECT first_name, last_name, quiz_points
FROM people
WHERE quiz_points = (SELECT MAX(quiz_points) FROM people);

-- Sub-query to use in another table
SELECT *
FROM people
WHERE state_code = (
    SELECT state_abbrev FROM states
    WHERE state_name = 'Kansas'
);

-- Data Transformation
-- Text transformation by uppercase or lowercase strings
SELECT LOWER(first_name), UPPER(last_name)
FROM people;

-- SUBSTR for SQLite
-- Trimming a string syntax SUBSTR(column with strings
-- ,start letter index,end letter index)
SELECT  SUBSTR(last_name,1,3)
FROM people;

-- Replace text from a string
SELECT REPLACE(first_name,"a","-")
FROM people;

-- Changing the data types
SELECT quiz_points
FROM people
ORDER BY CAST(quiz_points AS CHAR);

