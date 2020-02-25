CREATE TABLE restaurants (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT,
    category TEXT
);

CREATE TABLE reviewers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    karma INTEGER check (karma <= 7 and karma >=0)
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    reviewer_id INTEGER REFERENCES reviewers(id),
    stars INTEGER CHECK (stars >= 0 and stars <= 5),
    title TEXT,
    review TEXT,
    restaurant_id INTEGER REFERENCES restaurants(id)
);



--Exercises
--1
FROM reviews WHERE restaurant_id = [id number];

--2
SELECT stars, title, review FROM reviews inner join restaurants on reviews.restaurant_id = restaurants.id 
WHERE restaurants.name = 'Daddy Dz'; --(restaurant name)

--3
SELECT stars, title, review FROM reviews inner join reviewers on reviews.reviewer_id = reviewers.id 
WHERE reviewers.name = 'Mike';

--4
SELECT restaurants.name as name, reviews.review as review
    FROM restaurants INNER JOIN reviews ON reviews.restaurant_id = restaurants.id;

--5
SELECT to_char(AVG(reviews.stars), '99999999999999999D99'), restaurants.name
    FROM reviews INNER JOIN restaurants ON reviews.restaurant_id = restaurants.id
    GROUP BY restaurants.name; 

--6
SELECT restaurants.name, COUNT(reviews.review)
    FROM reviews INNER JOIN restaurants ON reviews.restaurant_id = restaurants.id
    GROUP BY restaurants.name; 

--7
SELECT restaurants.name, reviewers.name, reviews.review 
    FROM restaurants
    INNER JOIN reviews on reviews.restaurant_id = restaurants.id
    INNER JOIN reviewers on reviews.reviewer_id = reviewers.id;

--8
SELECT reviewers.name, to_char(AVG(reviews.stars), '99999999999999999D99')
    FROM reviewers
    INNER JOIN reviews on reviewers.id = reviews.reviewer_id
    GROUP BY reviewers.name;

--9
SELECT reviewers.name, MAX(reviews.stars)
    FROM reviewers
    INNER JOIN reviews on reviewers.id = reviews.reviewer_id
    GROUP BY reviewers.name;

--10
SELECT category, COUNT(category)
    FROM restaurants
    GROUP BY category;

--11
SELECT restaurants.name, to_char(AVG(reviews.stars), '99999999999999999D99')
    FROM restaurants
    INNER JOIN reviews on restaurants.id = reviews.restaurant_id
    WHERE reviews.stars = 5
    GROUP BY restaurants.name;

--12
SELECT DISTINCT AVG(reviews.stars), restaurants.category
    FROM reviews
    JOIN restaurants on restaurants.id = reviews.restaurant_id
  
    GROUP BY restaurants.category;