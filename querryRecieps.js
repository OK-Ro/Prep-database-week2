const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '@FALcom2023',
  database: 'girrafe'
});

connection.connect(err => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }

  console.log('Connected to the database');
  
// Execute the first query: All the vegetarian recipes with potatoes
connection.query(`
  SELECT Recipes.recipe_id, Recipes.recipe_name, Ingredients.ingredient_name
  FROM Recipes
  JOIN RecipeIngredients ON Recipes.recipe_id = RecipeIngredients.recipe_id
  JOIN Ingredients ON RecipeIngredients.ingredient_id = Ingredients.ingredient_id
  JOIN RecipeCategories ON Recipes.recipe_id = RecipeCategories.recipe_id
  JOIN Categories ON RecipeCategories.category_id = Categories.category_id
  WHERE Categories.category_name = 'Vegetarian'
  AND Ingredients.ingredient_name LIKE '%Potato%';
`, (err, results) => {
  if (err) {
    console.error('Error executing the query:', err);
  } else {
    console.log('Vegetarian recipes with potatoes:', results);
  }
});

  // Execute the second query: All the cakes that do not need baking
  connection.query(`
    SELECT *
    FROM Recipes
    JOIN RecipeCategories ON Recipes.recipe_id = RecipeCategories.recipe_id
    JOIN Categories ON RecipeCategories.category_id = Categories.category_id
    WHERE category_name = 'Cake'
    AND NOT EXISTS (
        SELECT 1
        FROM Steps
        WHERE Recipes.recipe_id = Steps.recipe_id
          AND instruction LIKE '%bake%'
    );
  `, (err, results) => {
    if (err) {
      console.error('Error executing the query:', err);
    } else {
      console.log('Cakes that do not need baking:', results);
    }
  });

  // Execute the third query: All the vegan and Japanese recipes
  connection.query(`
    SELECT *
    FROM Recipes
    JOIN RecipeCategories ON Recipes.recipe_id = RecipeCategories.recipe_id
    JOIN Categories ON RecipeCategories.category_id = Categories.category_id
    WHERE category_name IN ('Vegan', 'Japanese');
  `, (err, results) => {
    if (err) {
      console.error('Error executing the query:', err);
    } else {
      console.log('Vegan and Japanese recipes:', results);
    }

    // End the connection when all queries are done
    connection.end();
  });
});
