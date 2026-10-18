### Ensemble de données / Table: `[Sample_Superstore_clean]`

| Nom du champ | Type de données | Description | Exemple de valeur |
|------------|-----------|-------------|---------------|
| `Row_ID` | Entier | Identifiant unique de chaque ligne | 1 |
| `Order_ID` | Texte | Identifiant de la commande (répété sur chaque produit d'une même commande) | CA-2016-152156 |
| `Order_Date` | Date | Date de la commande | 2016-11-08 |
| `Ship_Date` | Date | Date d'expédition | 2016-11-11 |
| `Ship_Mode` | Texte | Mode d'expédition | Second Class |
| `Customer_ID` | Texte | Identifiant unique de chaque client | CG-12520 |
| `Customer_Name` | Texte | Nom du client (données fictives) | Claire Gute |
| `Segment` | Texte | Type de client : Consumer, Corporate ou Home Office | Consumer |
| `Country` | Texte | Pays de résidence du client | United States |
| `City` | Texte | Ville de résidence du client | Henderson |
| `State` | Texte | État américain du client | Kentucky |
| `Postal_Code` | Texte | Code postal du client | 42420 |
| `Region` | Texte | Région : West, East, South ou Central | South |
| `Product_ID` | Texte | Identifiant unique de chaque produit | FUR-BO-10001798 |
| `Category` | Texte | Catégorie du produit : Technology, Furniture ou Office Supplies | Furniture |
| `Sub_Category` | Texte | Sous-catégorie du produit (17 valeurs) | Bookcases |
| `Product_Name` | Texte | Nom du produit | Bush Somerset Collection Bookcase |
| `Sales` | Décimal | Montant des ventes de la ligne ($) | 261.96 |
| `Quantity` | Entier | Quantité de produits commandés | 2 |
| `Discount` | Décimal | Remise appliquée, de 0 à 1 (0,2 = 20 %) | 0 |
| `Profit` | Décimal | Profit de la ligne ($), négatif en cas de vente à perte | 41.91 |
| `Tranche_remise` | Texte | Tranche de remise de la ligne : 1. 0 %, 2. 1-20 %, 3. 21-40 % ou 4. > 40 %. Colonne calculée dans Power BI | 2. 1-20 % |
> **Row count (approx.):** [9 993]
> **Date range:** [03-01-2014] – [30-12-2017]


La table `Calendar` n'existe pas dans les données d'origine : je l'ai créée dans Power BI avec DAX, avec une ligne par date (colonnes Date, Year et Month). Elle est reliée à `Order_Date` et sert surtout aux comparaisons avec l'année précédente (N-1).
