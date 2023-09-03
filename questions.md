1. Was your database already in 2NF / 3 NF?

The database appears to be in 2NF since it eliminates partial dependencies by separating data into tables appropriately. For example, the Recipes table is separate from the RecipeCategories and RecipeIngredients tables, which removes partial dependencies.

2. What changes did you have to do to normalize your database?

Created separate tables for entities like Recipes, Categories, Ingredients, and Steps.
Implemented many-to-many relationships using junction tables (RecipeCategories and RecipeIngredients).
Used foreign keys to establish relationships between tables.


3. If you want to add thousands of recipes to your database, what challenges do you foresee?


Data Volume:
As the number of recipes grows, the database's storage requirements  increases. 

Performance:
With a large dataset, query performance can becomes a concern. will need to uitlize database design,By using appropriate indexing.

Data Entry and Maintenance:
Entering and maintaining thousands of recipes can be time-consuming and error-prone. Consider implementing batch import tools and data validation mechanisms to streamline data entry.

Search and Retrieval: 
Retrieving specific recipes efficiently from a large database can be challenging. Implementing efficient search mechanisms (e.g., full-text search or optimized SQL queries) will become dificult.

Backup and Recovery: 
With a large dataset, regular backups become more essential to prevent data loss in case of unforeseen issues.


Security:
As the dataset grows, maintaining data security is paramount.

