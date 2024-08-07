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
SELECT round(count(texts.email_id)::decimal/count(DISTINCT emails.email_id),2)
FROM emails 
left join texts on texts.email_id=emails.email_id and texts.signup_action = 'Confirmed';

-- bai 3
