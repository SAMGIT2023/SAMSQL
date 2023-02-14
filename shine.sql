--STRUCTURE OF OUR DATA COVID DEATHS
SELECT 
  * 
FROM 
  Projectshine.dbo.CovidDeaths$ 
ORDER BY 
  location;
--STRUCTURE OF OUR DATA COVID VACCINATIONS
SELECT 
  * 
FROM 
  Projectshine.dbo.CovidVaccinations$ 
ORDER BY 
  3;
--DATA TO BE USED COVID DEATHS
SELECT 
  location, 
  date, 
  total_cases, 
  new_cases, 
  total_deaths, 
  population 
FROM 
  Projectshine.dbo.CovidDeaths$ 
ORDER BY 
  location;
--TOTAL CASES PER COUNTRY
SELECT 
  location, 
  SUM(total_cases) AS total_cases_per_country 
FROM 
  Projectshine.dbo.CovidDeaths$ 
GROUP BY 
  location 
ORDER BY 
  total_cases_per_country;
--TOTAL CASES VS POPULATION
SELECT 
  location, 
  date, 
  population, 
  total_cases, 
  (total_cases / population)* 100 AS CasesPerPopulation 
FROM 
  Projectshine.dbo.CovidDeaths$ 
ORDER BY 
  CasesPerPopulation;
--TOTAL CASES VS TOTAL DEATHS
SELECT 
  location, 
  date, 
  total_cases, 
  total_deaths, 
  (total_deaths / total_cases)* 100 AS deathpercentage 
FROM 
  Projectshine.dbo.CovidDeaths$ 
ORDER BY 
  deathpercentage;
--TOTAL DEATHS VS POPULATION
SELECT 
  location, 
  date, 
  population, 
  total_deaths, 
  (total_deaths / population)* 100 AS CovidPopulationAttrittion 
FROM 
  Projectshine.dbo.CovidDeaths$ 
ORDER BY 
  CovidPopulationAttrittion;
--Classify 
SELECT 
  location, 
  date, 
  population, 
  total_cases, 
  (total_cases / population)* 100 AS CasesPerPopulation, 
  CASE WHEN (total_cases / population)* 100 < 1 THEN 'LOW' WHEN (total_cases / population)* 100 IS NULL THEN 'NIL' ELSE 'VERY HIGH' END AS Rate 
FROM 
  Projectshine.dbo.CovidDeaths$ 
ORDER BY 
  (total_cases / population)* 100;
--TOTAL CASES VS POPULATION IN KENYA
SELECT 
  location, 
  date, 
  population, 
  total_cases, 
  (total_cases / population)* 100 AS CasesPerPopulation 
FROM 
  Projectshine.dbo.CovidDeaths$ 
WHERE 
  location LIKE '%kenya%' 
ORDER BY 
  CasesPerPopulation;
--HIGHEST INFECTION RATE VS POPULATION
SELECT 
  Continent, 
  location, 
  population, 
  MAX(total_cases) AS HighestInfectionCount, 
  MAX(
    (total_cases / Population)
  )* 100 AS PercentPopInfected 
FROM 
  Projectshine.dbo.CovidDeaths$ 
GROUP BY 
  location, 
  population, 
  continent 
ORDER BY 
  4 desc;
--COUNTRIES WITH HIGHEST DEATH COUNT PER POPULATION
SELECT 
  location, 
  MAX(total_deaths) AS TotaDeathCount 
FROM 
  Projectshine.dbo.CovidDeaths$ 
GROUP BY 
  location 
ORDER BY 
  TotaDeathCount;
--Global Deaths
SELECT 
  continent, 
  SUM(
    CAST(total_deaths as int)
  ) AS DeathByContinent 
FROM 
  Projectshine.dbo.CovidDeaths$ 
WHERE 
  continent IS NOT NULL 
GROUP BY 
  continent;
--Global Totalcases
SELECT 
  continent, 
  SUM(total_cases) AS TotalCasesPerContinent 
FROM 
  Projectshine.dbo.CovidDeaths$ 
WHERE 
  continent IS NOT NULL 
GROUP BY 
  continent;
--Window function to get max total cases per continent
SELECT 
  continent, 
  date, 
  total_cases, 
  max(total_cases) over(partition by continent) as max_total_cases 
FROM 
  CovidDeaths$ 
WHERE 
  continent IS NOT NULL;
--ROW NUMBER
SELECT 
  continent, 
  date, 
  total_cases, 
  row_number() over(
    ORDER BY 
      total_cases
  ) as R_N 
FROM 
  CovidDeaths$ 
WHERE 
  continent IS NOT NULL;
--percentage of population vaccinated per country
SELECT 
  CovidDeaths$.location, 
  CovidDeaths$.population, 
  CovidVaccinations$.total_vaccinations, 
  (
    CovidVaccinations$.total_vaccinations / CovidDeaths$.population
  )* 100 AS vaccinationRate 
FROM 
  CovidDeaths$ 
  INNER JOIN CovidVaccinations$ ON CovidDeaths$.location = CovidVaccinations$.location 
ORDER BY 
  CovidDeaths$.location;
--Covid positivity on male smokers
SELECT 
  male_smokers, 
  positive_rate 
FROM 
  CovidDeaths$ 
WHERE 
  location = 'Kenya';
--UNION
SELECT 
  continent 
FROM 
  CovidDeaths$ 
UNION 
SELECT 
  continent 
FROM 
  CovidVaccinations$;
--days
SELECT 
  date, 
  SUM(new_cases) AS Total_cases, 
  SUM(
    cast(new_deaths as int)
  ) AS Total_deaths, 
  SUM(
    cast(new_deaths as int)
  )/ SUM(new_cases)* 100 AS DeathPercentage 
FROM 
  CovidDeaths$ 
WHERE 
  continent IS NOT NULL 
GROUP BY 
  date 
ORDER BY 
  1, 
  2;






