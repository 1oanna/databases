SELECT * FROM world.city;
#What are the names of all the cities in the Netherlands?
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code WHERE country.Name = 'Netherlands';
#What is the population of Rotterdam ?
SELECT name,Population FROM city WHERE name = 'Rotterdam';
#What's the name of all the countries on the continent ‘North America’ ?
SELECT name FROM country WHERE Continent = 'North America';
#What's the top 10 countries by SurfaceArea ?
SELECT name,SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 10;
#What's the top 10 most populated cities?
SELECT name,Population FROM city ORDER BY Population DESC LIMIT 10;
#Select the top 3 countries by population that their names start with the letter ‘P’
SELECT name,Population FROM country WHERE (name LIKE 'P%' >0) ORDER BY Population DESC LIMIT 3;
#What is the population in Asia?
SELECT SUM(Population) FROM country WHERE Continent = 'Asia';
#Which languages are spoken in the Region of ‘South America’
SELECT COUNT(country.name), countrylanguage.language FROM country JOIN countrylanguage ON countrylanguage.countrycode = country.code WHERE region = 'South America' GROUP BY countrylanguage.language;
#What are the languages spoken on all cities named ‘Barcelona’ (you may need to join 3 tables =) )
SELECT DISTINCT city.name, countrylanguage.language
  FROM city JOIN country ON city.countrycode=country.code
  JOIN countrylanguage ON country.code=countrylanguage.countrycode
     WHERE city.name='Barcelona';