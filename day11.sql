-- bai 1
SELECT 
    COUNTRY.Continent, 
    FLOOR(AVG(CITY.Population)) AS average_population
FROM 
    CITY
INNER JOIN 
    COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY 
    COUNTRY.Continent;

-- bai 2
