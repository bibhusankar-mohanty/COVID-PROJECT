SELECT * FROM COVID_DEATH
SELECT * FROM COVID_VACCINATION
--DETERMINE THE DEATH PERCENTAGE.
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as deathpercentage
from COVID_DEATH
where location like '%India%'
order by (total_cases)asc

--TOTAL POPULATION INFECTED.
SELECT location,date,total_cases,population,(total_cases/population)*100 as populationinfected
from COVID_DEATH
where location like '%India%'
order by (total_cases)asc;

--HIGHEST POPULATION INFECTED.

SELECT location,max(total_cases) as highestinfection,population,max(total_cases/population)*100 as populationinfected
from COVID_DEATH
group by location,population
order by (populationinfected)desc;

--SHOWING TOTAL DEATH COUNT.
SELECT location,max(cast(total_deaths as int))as totaldeathcount
from COVID_DEATH
where continent is not null
group by location,population
order by (totaldeathcount)desc;

--SHOWING CONTINENT MAX DEATH_COUNT.
SELECT continent,max(cast(total_deaths as int))as totaldeathcount
from COVID_DEATH
where continent is not null
group by continent
order by (totaldeathcount)desc;

--GLOBAL NUMBERS.
SELECT date,sum(new_cases)as total_cases,sum(cast(new_deaths as int))as total_deaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
from COVID_DEATH
where continent is not null
group by date
order by 1,2;
-- Total cases
SELECT sum(new_cases)as total_cases,sum(cast(new_deaths as int))as total_deaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
from COVID_DEATH
where continent is not null
--group by date
order by 1,2;






