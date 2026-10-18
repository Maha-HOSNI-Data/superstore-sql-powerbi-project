-- Quelle catégorie génère le plus de Sales et de Profit
SELECT 
    [Category],
    SUM([Sales]) AS Total_Sales,
    SUM([Profit]) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY [Category]
ORDER BY Total_Sales DESC , Total_Profit DESC ;

-- Quelles sous-catégories ont une marge inférieure à la marge globale 

SELECT 
    [Sub_Category],
    SUM([Profit]) / NULLIF(SUM([Sales]), 0) AS Marge
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY [Sub_Category];

SELECT 
    SUM([Profit]) / NULLIF(SUM([Sales]), 0) *100 AS Marge_globale
FROM [Superstore].[dbo].[Sample_Superstore_clean]


SELECT 
    [Sub_Category],
    SUM([Profit]) * 100.0 / NULLIF(SUM([Sales]), 0) AS Marge
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY [Sub_Category]
HAVING 
    SUM([Profit]) * 100.0 / NULLIF(SUM([Sales]), 0)
    <
    (
            SELECT 
            SUM([Profit]) * 100.0 / NULLIF(SUM([Sales]), 0)
        FROM [Superstore].[dbo].[Sample_Superstore_clean]
    );

-- Existe-t-il des produits qui génèrent beaucoup de Sales mais un Profit négatif 
SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
HAVING SUM(Profit)<  0 
ORDER BY SUM(Sales) DESC


-- Quelle est la relation entre Discount et Profit Margin 

SELECT
(
        COUNT(*) * SUM(Discount * Profit_Margin)
        - SUM(Discount) * SUM(Profit_Margin)
    )
    /
    (
        SQRT(
            COUNT(*) * SUM(POWER(Discount, 2))
            - POWER(SUM(Discount), 2)
        )
        *
        SQRT(
            COUNT(*) * SUM(POWER(Profit_Margin, 2))
            - POWER(SUM(Profit_Margin), 2)
        )
    ) AS Coefficient_Correlation
FROM
(
    SELECT
        Discount,
        Sales,
        Profit,
        Profit * 100.0 / NULLIF(Sales, 0) AS Profit_Margin
    FROM [Superstore].[dbo].[Sample_Superstore_clean]
) AS T;


-- Quelles périodes connaissent une augmentation des Sales mais une diminution du Profit 
SELECT
    CurrentPeriod.Year,
    CurrentPeriod.Month,
    CurrentPeriod.Total_Sales,
    CurrentPeriod.Total_Profit,
    PreviousPeriod.Total_Sales AS Previous_Sales,
    PreviousPeriod.Total_Profit AS Previous_Profit
FROM
(
    -- Période actuelle
    SELECT
        YEAR([Order_Date]) AS Year,
        MONTH([Order_Date]) AS Month,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM [Superstore].[dbo].[Sample_Superstore_clean]
    GROUP BY
        YEAR([Order_Date]),
        MONTH([Order_Date])
) AS CurrentPeriod

LEFT JOIN
(
    -- Période précédente
    SELECT
        YEAR([Order_Date]) AS Year,
        MONTH([Order_Date]) AS Month,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM [Superstore].[dbo].[Sample_Superstore_clean]
    GROUP BY
        YEAR([Order_Date]),
        MONTH([Order_Date])
) AS PreviousPeriod
    ON (
        CurrentPeriod.Year = PreviousPeriod.Year
        AND CurrentPeriod.Month = PreviousPeriod.Month + 1
    )
    OR (
        CurrentPeriod.Year = PreviousPeriod.Year + 1
        AND CurrentPeriod.Month = 1
        AND PreviousPeriod.Month = 12
    )

WHERE
    CurrentPeriod.Total_Sales > PreviousPeriod.Total_Sales
    AND CurrentPeriod.Total_Profit < PreviousPeriod.Total_Profit;