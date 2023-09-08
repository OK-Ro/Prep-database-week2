Exercise
Last week you updated your database to be normalized. Now that you have some more NoSQL knowledge, convert your database to a document-based database. Think about the following:

What are the collections?
What information will you embed in a document and which will you store normalised?
Discussion (Try to write answers to these questions in text, provide queries and commands when necessary)
What made you decide when to embed information? What assumptions did you make?
If you were given MySQL and MongoDB as choices to build the recipe's database at the beginning, which one would you choose and why?




**Collections 

1. **Recipes Collection:**
   - Each document represents a recipe.
   - Embedded fields:
     - `recipe_name`
     - `categories` (array of category names)
     - `ingredients` (array of ingredient names with quantities, if applicable)
     - `steps` (array of step instructions)
   - Normalized references:
     - None (recipe_id is not necessary here as the document _id can serve as the unique identifier)

2. **Categories Collection:**
   - Each document represents a category.
   - Embedded fields:
     - `category_name`

3. **Ingredients Collection:**
   - Each document represents an ingredient.
   - Embedded fields:
     - `ingredient_name`

**Recipe Document Structure (Embedded Fields):**

```json
{
   "_id": ObjectId("recipe_id_here"),
   "recipe_name": "Cake",
   "categories": ["Cake"],
   "ingredients": [
      {"ingredient_name": "Condensed milk"},
      {"ingredient_name": "Cream Cheese"},
      {"ingredient_name": "Lemon Juice"},
      {"ingredient_name": "Pie Crust"},
      {"ingredient_name": "Cherry Jam"}
   ],
   "steps": [
      "Beat Cream Cheese",
      "Add condensed Milk and blend",
      "Add Lemon Juice and blend",
      "Add the mix to the pie crust",
      "Spread the Cherry Jam",
      "Place in refrigerator for 3h."
   ]
}
```

**Discussion:**

-  i decided to embed information in the `Recipes` collection for the following reasons:
  1. **Read Performance:** Embedding reduces the need for multiple queries or joins when retrieving a complete recipe, improving read performance.
  2. **Simplicity:** Embedding simplifies the data model and query complexity, making it easier to work with recipes directly.
  3. **Data Size:** Since recipes typically don't have a huge number of ingredients or steps, the document size remains manageable.

- **Assumptions:** i assumed that recipes don't have an excessive number of ingredients or steps, which would lead to an unmanageable document size. Additionally, we assumed that the relationships between recipes, categories, and ingredients don't require complex querying, and the denormalized structure will be sufficient for most use cases.

- **MySQL vs. MongoDB:** If given the choice between MySQL and MongoDB for building the recipe's database from the beginning, the choice would depend on various factors:

  - **Use Case:** If the primary use case involves complex queries, reporting, and transactions (e.g., managing inventory, sales, or financial data), MySQL, being a relational database, would be a better choice due to its ACID compliance and support for complex joins and transactions.

  - **Schema Flexibility:** If the data structure is highly dynamic and can change frequently, MongoDB's schemaless nature and flexibility make it a better choice, as it allows for easy adaptation to changing data requirements.

  - **Scalability:** MongoDB is designed for horizontal scalability, making it suitable for applications with high read and write throughput, especially when distributed across multiple servers or in a cloud environment.

  - **Development Speed:** MongoDB can speed up development in scenarios where the data model is evolving rapidly, and you need to iterate quickly.

In the case of a recipe database, where the primary use case is efficient retrieval of recipes and their details, MongoDB's flexibility and performance for read-heavy operations would likely make it a more attractive choice. However, the choice between MySQL and MongoDB should always be made based on the specific requirements and constraints of the project.