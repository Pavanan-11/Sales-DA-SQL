SELECT * 
FROM blinkit_csv;


SELECT COUNT(*) 
FROM blinkit_csv;

SELECT * 
FROM blinkit_csv;

UPDATE blinkit_csv
SET `Item Fat Content`=
CASE 
WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat' 
WHEN `Item Fat Content` = 'reg' THEN 'Regular'
ELSE `Item Fat Content`
END;

SELECT DISTINCT `Item Fat Content`
FROM blinkit_csv;

SELECT SUM(`Total Sales`)  AS Total_Sales
FROM blinkit_csv;

SELECT CONCAT(CAST(SUM(`Total Sales`)/1000000 AS DECIMAL (10,2)), 'Million') AS Total_Sales_Millions
FROM blinkit_csv;

SELECT CAST(AVG(`Total Sales`) AS DECIMAL (10)) AS Average_Sales
FROM blinkit_csv;

SELECT COUNT(*) AS Number_of_items
FROM blinkit_csv;

SELECT *
FROM blinkit_csv
WHERE `Outlet Establishment Year` = 2015;

SELECT CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv;

SELECT `Item Fat Content`,
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
WHERE `Outlet Establishment Year` = 2022
Group by `Item Fat Content`
ORDER BY Total_Sales DESC;

SELECT `Item Fat Content`,
 CONCAT(CAST(SUM(`Total Sales`)/1000 AS DECIMAL (10,2)) , 'K') AS Total_Sales_Thousand,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Item Fat Content`
ORDER BY Total_Sales_Thousand ASC;


SELECT `Item Fat Content`,
 CONCAT(CAST(SUM(`Total Sales`)/1000 AS DECIMAL (10,2)) , 'K') AS Total_Sales_Thousand,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,2)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Item Fat Content`
ORDER BY Total_Sales_Thousand DESC;


SELECT `Item Fat Content`,
CONCAT(CAST(SUM(`Total Sales`)/1000 AS DECIMAL (10,2)) , 'K') AS Total_Sales_Thousand,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
WHERE `Outlet Establishment Year` = 2022
Group by `Item Fat Content`
ORDER BY Total_Sales_Thousand DESC;


SELECT `Item type`,
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Item type`
ORDER BY Total_Sales DESC;

SELECT `Item type`,
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Item type`
ORDER BY Total_Sales DESC
LIMIT 5;

SELECT `Outlet Location Type`, `Item Fat Content`,
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Outlet Location Type`, `Item Fat Content`
ORDER BY Total_Sales DESC;


SELECT `Outlet Location Type`, `Item Fat Content`,
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Outlet Location Type`, `Item Fat Content`
ORDER BY Total_Sales ASC;

SELECT 
`Outlet Location Type`, `Item Fat Content`,
	CAST(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN `Total Sales` ELSE 0 END) AS DECIMAL (10,2))  AS Low_Fat,
    CAST(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN `Total Sales` ELSE 0 END) AS DECIMAL (10,2))  AS Regular
FROM blinkit_csv
GROUP BY `Outlet Location Type`, `Item Fat Content`
ORDER BY `Outlet Location Type`, `Item Fat Content`;

SELECT 
`Outlet Location Type`, 
	CAST(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN `Total Sales` ELSE 0 END) AS DECIMAL (10,2))  AS Low_Fat,
    CAST(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN `Total Sales` ELSE 0 END) AS DECIMAL (10,2))  AS Regular
FROM blinkit_csv
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;
 
SELECT `Outlet Establishment Year`,
		CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales
FROM blinkit_csv
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`;


SELECT `Outlet Establishment Year`,
		CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
        CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
        COUNT(*) AS Number_of_Items,
        CAST(AVG(Rating) AS DECIMAL (10,2)) AS Rating
FROM blinkit_csv
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`;


SELECT 
	`Outlet Size`,
	 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
     CAST(SUM(`Total Sales`) * 100.0 / SUM(SUM(`Total Sales`)) OVER () AS DECIMAL (10,2)) AS Sales_Percentage
FROM blinkit_csv
GROUP BY `Outlet Size`
ORDER BY Total_Sales DESC;
     
SELECT `Outlet Location Type`, 
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Outlet Location Type`
ORDER BY Total_Sales DESC;


SELECT `Outlet Location Type`, 
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
  CAST(SUM(`Total Sales`) * 100.0 / SUM(SUM(`Total Sales`)) OVER () AS DECIMAL (10,2)) AS Sales_Percentage,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Outlet Location Type`
ORDER BY Total_Sales DESC;


SELECT `Outlet Location Type`, 
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
  CAST(SUM(`Total Sales`) * 100.0 / SUM(SUM(`Total Sales`)) OVER () AS DECIMAL (10,2)) AS Sales_Percentage,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
WHERE `Outlet Establishment Year` = 2022
Group by `Outlet Location Type`
ORDER BY Total_Sales DESC;

SELECT `Outlet Type`, 
 CAST(SUM(`Total Sales`) AS DECIMAL (10,2)) AS Total_Sales,
  CAST(SUM(`Total Sales`) * 100.0 / SUM(SUM(`Total Sales`)) OVER () AS DECIMAL (10,2)) AS Sales_Percentage,
 CAST(AVG(`Total Sales`) AS DECIMAL (10,1)) AS Average_Sales,
 COUNT(*) AS Number_of_Items,
 CAST(AVG(Rating) AS DECIMAL (10,2)) AS Average_Rating
FROM blinkit_csv
Group by `Outlet Type`
ORDER BY Total_Sales DESC;
