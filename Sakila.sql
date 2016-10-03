/*1. What query would you run to get all the customers inside city_id = 312? 
Your query should returm customer first name, last name, email, and address.
*/
SELECT cities.id AS City_id, cities.city AS City,first_name AS First_Name, customers.last_name AS Last_name, customers.email AS Email, addresses.address AS Address
FROM addresses
JOIN customers ON customers.address_id = addresses.id
JOIN cities ON cities.id = addresses.city_id
WHERE cities.id = 312

 
/*2. What query would you run to get all comedy films? Your query would return film title, description, release year, rating, special features and genre.*/

SELECT films.id AS id, films.title AS title, films.description AS Description, films.release_year AS release_year, films.rating AS Rating, films.special_features AS Special_Features, categories.name 
FROM film_category
JOIN films ON films.id = film_category.film_id 
JOIN categories ON categories.id = film_category.category_id
WHERE categories.name = 'Comedy'

/*3. What query would you run to get all the films joined by actor_id=5? Your query shoud return the film title, description and release year.*/

SELECT actors.id as ID,actors.first_name AS actor_name,films.id AS film_id, films.title as Title, films.description as Description, films.release_year as release_year
FROM film_actor
JOIN films ON films.id = film_actor.film_id
JOIN actors ON actors.id = film_actor.actor_id
WHERE actor_id = 5

/*4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? 
Your query should return customer first name, last name, email, and address.*/

SELECT customers.store_id AS store_id, cities.id  AS city_id , customers.first_name AS first_name, customers.last_name AS last_name, customers.email AS email, address  
FROM addresses
JOIN customers ON customers.address_id = addresses.id
JOIN cities ON cities.id = addresses.city_id
WHERE store_id = 1 AND cities.id IN (1,42,312,459)

/*5. What query would you run to get all the films with a rating = G and special feature = behind the scenes, joined by actor_id = 15? 
Your query shoud return the film title, description, release year, rate and special feature.*/

SELECT films.title AS title, films.description AS Description, films.release_year as release_year, films.rating AS Rating, films.special_features AS Special_feature
FROM film_actor
JOIN films ON films.id = film_actor.film_id
JOIN actors ON actors.id = film_actor.actor_id
WHERE films.rating = 'G' AND actor_id = 15 AND special_features LIKE '%Behind the Scenes'


/*6. What query would you run to get all the actors that joined in the film_id = 369? 
Your query should return the first_name, last name and last_update of the actors.*/

SELECT films.id AS film_id, films.title AS title, CONCAT(actors.first_name,' ',actors.last_name )AS actor_name  
FROM film_actor
JOIN films ON films.id = film_actor.film_id
JOIN actors ON actors.id = film_actor.actor_id
WHERE film_id  = 369

/*7. What query would you run to get all drama films with a rental rate of 2.99 ? 
Your query should return film title, description, release year, rating, special features and genre.*/

SELECT films.id AS film_id, films.title AS title, films.description AS description, films.release_year AS release_year, films.rating AS rating , films.special_features AS special_features, categories.name AS genre
FROM film_category
JOIN films ON films.id = film_category.film_id
JOIN categories ON categories.id = film_category.category_id
WHERE films.rental_rate = 2.99 AND categories.name = 'Drama'

/*8. What query would you run to get all the action films joined by SANDRA KILMER. 
Your query should return film title, description, release year, rating, special features, genre and actor's first name and last name.*/
SELECT actors.id AS actor_id, CONCAT(actors.first_name,' ',actors.last_name) AS actor_name, films.id AS film_id, films.title AS title, films.description AS description, films.release_year AS release_year,films.rating AS rating, films.special_features AS special_features, categories.name AS genre
FROM actors,films, categories, film_category, film_actor
WHERE films.id = film_actor.film_id AND films.id = film_category.film_id 
	  AND actors.id = film_actor.actor_id AND categories.id = film_category.category_id 
	  AND actor_id = 23 AND categories.name = 'Action'

