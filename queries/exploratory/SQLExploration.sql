-- Combien de lignes contient la table Sample_Superstore_clean
SELECT 
    count(*)
FROM [Superstore].[dbo].[Sample_Superstore_clean]

-- Quelles sont les différentes catégories de produits présentes dans les données
SELECT 
    Category
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Category)

-- Quelles sont les différentes régions présentes dans les données
SELECT 
    *
FROM [Superstore].[dbo].[Sample_Superstore_clean]

SELECT 
    Region
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Region)

--Quel est le montant total des Sales
SELECT 
    SUM(Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]

-- Quel est le Profit total

SELECT 
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]

--Quel est le nombre total de clients différents
SELECT 
    count (Distinct Customer_ID) AS Total_Customer
FROM [Superstore].[dbo].[Sample_Superstore_clean]

--Combien de commandes différentes existe-t-il
SELECT 
    count (Distinct Order_ID) AS Total_Oeder
FROM [Superstore].[dbo].[Sample_Superstore_clean]

SELECT 
     Order_ID
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Order_ID)

--Quel est le montant total des Sales par catégorie
SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Category)
ORDER BY (SUM(Sales)) DESC

--Quel est le Profit total par catégorie
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Category)
ORDER BY (SUM(Profit)) DESC

-- Quel est le montant moyen des Sales par commande
SELECT 
    AVG(Total_Sales) AS AVG_Sales_Par_Commande
FROM
(
    SELECT 
        Order_ID,
        SUM(Sales) AS Total_Sales
    FROM [Superstore].[dbo].[Sample_Superstore_clean]
    GROUP BY Order_ID
) AS Commandes;


-- Quelle région génère le plus de Sales
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Region)
ORDER BY (Total_Sales) DESC

--Quelle région génère le plus de Profit

SELECT 
    Region,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Region)
ORDER BY (Total_Profit) DESC

-- Combien de ventes sont réalisées par Segment

SELECT 
     Segment,
    count (Distinct Order_ID) AS Total_Order
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Segment)

-- Quel est le Profit moyen par catégorie
SELECT 
    Category,
    AVG(Profit) AS AVG_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Category)
ORDER BY (AVG(Profit)) DESC

-- Quelles sont les 10 sous-catégories qui génèrent le plus de Sales
SELECT 
    TOP 10
    SUB_Category,
    SUM(Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (SUB_Category)
ORDER BY (Total_Sales) DESC

-- Quelles sous-catégories ont généré un Profit total négatif
SELECT 
    SUB_Category,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (SUB_Category)
HAVING SUM(Profit)<  0

-- Quelles sous-catégories ont généré plus de 50 000 $ de Sales
SELECT 
    SUB_Category,
    SUM(Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (SUB_Category)
HAVING SUM(Sales) > 50.000

-- Quels produits ont généré un Profit total négatif
SELECT 
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
HAVING SUM(Profit)<  0

-- Quels produits ont généré plus de 10 000 $ de Sales

SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
HAVING SUM(Sales) > 10.000

-- Quelle est la marge bénéficiaire de chaque catégorie
-- Profit Margin = Profit / Sales
SELECT 
    Category,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Category)
ORDER BY SUM(Profit) / SUM(Sales) DESC

-- Quelle sous-catégorie possède la marge bénéficiaire la plus élevée
SELECT 
    SUB_Category,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (SUB_Category)
ORDER BY (Profit_Margin) DESC

-- Quelle sous-catégorie possède la marge bénéficiaire la plus faible
SELECT 
    SUB_Category,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (SUB_Category)
ORDER BY (Profit_Margin) ASC 

-- Quelles sous-catégories ont une marge bénéficiaire inférieure à la marge globale
SELECT 
    SUB_Category,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (SUB_Category)
HAVING SUM(Profit) / SUM(Sales)< (SELECT SUM(Profit) / SUM(Sales) AS Marge_Globale FROM [Superstore].[dbo].[Sample_Superstore_clean])

-- Quels produits génèrent beaucoup de Sales mais un Profit négatif
SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
HAVING SUM(Profit)<  0 
ORDER BY SUM(Sales) DESC

SELECT 
    SUB_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (SUB_Category)
HAVING SUM(Profit)<  0 
ORDER BY SUM(Sales) DESC

-- Quelle est l'évolution des Sales et du Profit par année
 SELECT
    YEAR([Order_Date]) AS Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]

GROUP BY YEAR([Order_Date])

ORDER BY Year;

-- Quels mois génèrent le plus de Sales
 SELECT
    TOP 1 
    MONTH([Order_Date]) AS Month,
    SUM(Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY MONTH([Order_Date])
ORDER BY SUM(Sales) DESC;

-- Quels mois génèrent le plus de Profit
 SELECT
    TOP 1 
    MONTH([Order_Date]) AS Month,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY MONTH([Order_Date])
ORDER BY SUM(Profit) DESC;

-- Existe-t-il des périodes où les Sales augmentent mais où le Profit diminue
 SELECT
    YEAR([Order_Date]) AS Year,
    MONTH([Order_Date]) AS Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY YEAR([Order_Date]), MONTH([Order_Date])
HAVING SUM(Sales)> 10000 AND SUM(Profit)<0

-- Quelle est la relation entre Discount et Profit
SELECT 
    (COUNT(*) * SUM([Discount] * [Profit]) - SUM([Discount]) * SUM([Profit])) /                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    (SQRT(COUNT(*) * SUM(POWER([Discount], 2)) - POWER(SUM([Discount]), 2)) * 
     SQRT(COUNT(*) * SUM(POWER([Profit], 2)) - POWER(SUM([Profit]), 2))) AS coefficient_correlation
FROM [Superstore].[dbo].[Sample_Superstore_clean];

-- Quelle est la relation entre Discount et Profit Margin

WITH PreparedData AS (
    SELECT 
        [Discount],
        [Profit] * 100.0 / NULLIF([Sales], 0) AS Profit_Margin
    FROM [Superstore].[dbo].[Sample_Superstore_clean]
)
SELECT 
    (COUNT(*) * SUM([Discount] * Profit_Margin) - SUM([Discount]) * SUM(Profit_Margin)) / 
    (NULLIF(
        SQRT(COUNT(*) * SUM(POWER([Discount], 2)) - POWER(SUM([Discount]), 2)) * 
        SQRT(COUNT(*) * SUM(POWER(Profit_Margin, 2)) - POWER(SUM(Profit_Margin), 2)), 
        0
    )) AS coefficient_correlation
FROM PreparedData;

--Quelle catégorie est la plus sensible aux remises (Discount)
SELECT 
    Category,
    AVG([Discount]) * 100.0 AS Discount_Moyen
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Category)
ORDER BY Discount_Moyen DESC

-- Pour chaque niveau de Discount, quelle est la marge bénéficiaire moyenne
SELECT 
    Discount * 100.0, 
    AVG([Profit] * 100.0 / NULLIF([Sales], 0)) AS marge_beneficiaire_moyenne
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Discount)

-- Quels produits combinent les trois conditions suivantes :Sales élevées ,Profit négatif ,Discount élevé

SELECT 
    Product_Name,
    AVG([Discount]) * 100.0 AS Discount_Moyen,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
HAVING SUM(Profit)<  0
      AND SUM(Sales) >50000
      AND SUM(Discount) > 0
ORDER BY SUM(Sales) DESC


-- Quelles régions ont beaucoup de Sales mais une faible marge bénéficiaire ?
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Region)
ORDER BY SUM(Sales) DESC, SUM(Profit) / SUM(Sales) ASC

-- Quels clients génèrent beaucoup de Sales mais peu de Profit

SELECT 
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Customer_Name)
ORDER BY SUM(Sales) DESC, SUM(Profit) ASC

-- Quelle proportion du chiffre d'affaires total est générée par les 10 meilleurs produits ?
SELECT 
    TOP 10
    Product_Name,
    SUM(Sales) AS Total_Sales ,(SELECT AVG(Sales) FROM [Superstore].[dbo].[Sample_Superstore_clean]) AS Chiffre_Affaire
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
ORDER BY (Total_Sales) DESC
   

-- chiffre d'affaires total est générée par les 10 meilleurs produits
SELECT 
    TOP 10
    Product_Name,
    SUM(Sales) AS Total_Sales 
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
-- Sales_Total, Sales_Top10
SELECT SUM(Sales_Top10) AS somme_des_sommes
FROM (
    SELECT TOP 10 Product_Name, SUM(Sales) AS Sales_Top10
    FROM [Superstore].[dbo].[Sample_Superstore_clean]
    GROUP BY Product_Name
    ORDER BY Sales_Top10 DESC
) AS sous_requete;

-- chiffre d'affaires total est générée par les 10 meilleurs produits

SELECT SUM(Sales) AS Sales_Total, (SELECT SUM(Sales_Top10) AS somme_des_sommes
FROM (
    SELECT TOP 10 Product_Name, SUM(Sales) AS Sales_Top10
    FROM [Superstore].[dbo].[Sample_Superstore_clean] 
    GROUP BY Product_Name
    ORDER BY Sales_Top10 DESC
) AS sous_requete) AS Sales_Top10,     ((SELECT SUM(Sales_Top10) 
      FROM (
          SELECT TOP 10 SUM(Sales) AS Sales_Top10
          FROM [Superstore].[dbo].[Sample_Superstore_clean] 
          GROUP BY Product_Name
          ORDER BY SUM(Sales) DESC
      ) AS sous_requete) / SUM(Sales)) * 100 AS Proportion_Top10_Pourcent
FROM [Superstore].[dbo].[Sample_Superstore_clean]; 

-- Quelle proportion du Profit total est générée par les 10 meilleurs produits ?

SELECT SUM(Profit) AS Profit_Total, (SELECT SUM(Profit_Top10) AS somme_des_sommes
FROM (
    SELECT TOP 10 Product_Name, SUM(Profit) AS Profit_Top10
    FROM [Superstore].[dbo].[Sample_Superstore_clean] 
    GROUP BY Product_Name
    ORDER BY Profit_Top10 DESC
) AS sous_requete) AS Profit_Top10,     ((SELECT SUM(Profit_Top10) 
      FROM (
          SELECT TOP 10 SUM(Profit) AS Profit_Top10
          FROM [Superstore].[dbo].[Sample_Superstore_clean] 
          GROUP BY Product_Name
          ORDER BY SUM(Profit) DESC
      ) AS sous_requete) / SUM(Profit)) * 100 AS Proportion_Top10_Pourcent
FROM [Superstore].[dbo].[Sample_Superstore_clean]; 

-- Quels produits représentent les plus gros contributeurs au Profit ?

SELECT 
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
ORDER BY SUM(Profit) DESC

-- Quels produits représentent les plus grosses pertes
-- Perte = Sales, Quantity, Discount, Profit 
SELECT 
    Product_Name,
    SUM(Profit) AS Total_Profit,
    SUM (Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Product_Name)
HAVING SUM(Profit)< 0 
ORDER BY Total_Profit ASC


SELECT 
    Sub_Category,
    SUM(Profit) AS Total_Profit,
    SUM (Sales) AS Total_Sales
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Sub_Category)
HAVING SUM(Profit)< 0 
ORDER BY Total_Profit ASC

--Existe-t-il des catégories où une forte augmentation des Sales ne se traduit pas par une augmentation proportionnelle du Profit
SELECT 
    Category,
    SUM(Profit) AS Total_Profit,
    SUM (Sales) AS Total_Sales,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Taux_Marge
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Category)
HAVING SUM (Sales)> 50000 AND SUM(Profit) / NULLIF(SUM(Sales), 0) < 0 
ORDER BY Taux_Marge DESC

-- Quels segments de clients sont les plus rentables
SELECT 
    Segment,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Taux_Marge
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Segment)
ORDER BY Taux_Marge DESC

-- Quels clients ont un volume de ventes important mais une marge faible 

SELECT 
    Customer_ID,
    SUM (Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Taux_Marge
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Customer_ID)
HAVING SUM(Sales) > 5000        
   AND SUM(Profit) / NULLIF(SUM(Sales), 0) < 0.05 
ORDER BY Total_Sales DESC

--Quelles combinaisons Region + Category sont les plus rentables 
SELECT 
    Region,
    Category,
    SUM (Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Taux_Marge
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Region), (Category)
ORDER BY SUM(Profit) / NULLIF(SUM(Sales), 0) DESC

-- Quelles combinaisons Region + Category ont une marge négative
SELECT 
    Region,
    Category,
    SUM (Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Taux_Marge
FROM [Superstore].[dbo].[Sample_Superstore_clean]
GROUP BY (Region), (Category)
HAVING  SUM(Profit) / NULLIF(SUM(Sales), 0) < 0