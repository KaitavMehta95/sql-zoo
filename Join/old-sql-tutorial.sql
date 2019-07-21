/*
https://sqlzoo.net/wiki/Old_JOIN_Tutorial

*/

-- 1) Show the athelete (who) and the country name for medal winners in 2000.

SELECT who, country.name
  FROM ttms JOIN country
         ON (ttms.country=country.id)
 WHERE games = 2000
 
 /* 2.
Show the who and the color of the medal for the medal winners from 'Sweden'.

ttms(games,color,who,country)
country(id,name)   2) */

Select who,color from ttms Join country on (country=id) where name='sweden'

/*
3.
Show the years in which 'China' won a 'gold' medal.


ttms(games,color,who,country)
country(id,name)   
*/

select games from ttms Join country on (country=id) where color='gold' and name='China'

/*
4.
Show who won medals in the 'Barcelona' games.


ttws(games,color,who,country)
games(yr,city,country) 
*/

SELECT who
  FROM ttws JOIN games
            ON (ttws.games=games.yr)
  WHERE city = 'Barcelona'
  
  
  /*
  5.
Show which city 'Jing Chen' won medals. Show the city and the medal color.

ttws(games,color,who,country)
games(yr,city,country)   
  */
  
  select city,color from games join ttws on (yr = games) where who='Jing chen'
  
  /*
  6.
Show who won the gold medal and the city.


ttws(games,color,who,country)
games(yr,city,country) 
  */
  
  select who,city from games join ttws on games=yr where color='gold'
  
  /*
  7.
Show the games and color of the medal won by the team that includes 'Yan Sen'.

ttmd(games,color,team,country)
team(id,,name)   

  */
  
  select games,color from ttmd join team on team=id where name like 'Yan Sen'
  
  /*
  8.
Show the 'gold' medal winners in 2004.


ttmd(games,color,team,country)
team(id,,name)   
  */
  
  select name from team join ttmd on (team=id) where color='gold' and games=2004
  
  /*
  9.
Show the name of each medal winner country 'FRA'.


ttmd(games,color,team,country)
team(id,,name)   
  */
  
  select name from team join ttmd on team=id where country='FRA'
