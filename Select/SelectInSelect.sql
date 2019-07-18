-- 1) List each country name where the population is larger than that of 'Russia'.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2) Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

select name from world where continent = 'Europe' and gdp DIV population > 
(select gdp DIV population from world where name='United Kingdom')

-- 3) List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

select name,continent from world where continent in 
(select continent from world where name='Argentina' or name='Australia') order by name

-- 4) Which country has a population that is more than Canada but less than Poland? Show the name and the population.

select name,population  from world where population < 
(select population from world where name = 'Poland') and 
population > (select population from world where name = 'Canada')

-- 5) Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

--Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

select name,Concat(Round(population*100/(select population from world where name='Germany')),'%') from world where continent='Europe'

-- 6) Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

select name from world where gdp > ALL(select gdp from world where continent='Europe' AND gdp  > 0 )

-- 7) Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area FROM world x
  WHERE area = 
    (SELECT max(area) FROM world y
        WHERE y.continent=x.continent)
        
-- 8) List each continent and the name of the country that comes first alphabetically.

select continent,name from world as x where name = 
(select y.name from world as y where x.continent = y.continent order by name limit 1)

-- 9)Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

select name, continent, population from world as x where 25000000 >=
                         ALL(select population from world as y where y.continent = x.continent) 
-- 10) Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

select name,continent from world as x where population > 
    (select 3*max(population) from world as y where x.continent = y.continent and x.population != y.population)
