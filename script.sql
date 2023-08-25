-- Create Tables

-- Recipes Table
CREATE TABLE Recipes (
    recipe_id INT PRIMARY KEY,
    recipe_name VARCHAR(255)
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- RecipeCategories Table (Many-to-Many Relationship)
CREATE TABLE RecipeCategories (
    recipe_id INT,
    category_id INT,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes (recipe_id),
    FOREIGN KEY (category_id) REFERENCES Categories (category_id)
);

-- Ingredients Table
CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    ingredient_name VARCHAR(255)
);

-- RecipeIngredients Table (Many-to-Many Relationship)
CREATE TABLE RecipeIngredients (
    recipe_id INT,
    ingredient_id INT,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes (recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients (ingredient_id)
);

-- Steps Table
CREATE TABLE Steps (
    step_id INT PRIMARY KEY,
    recipe_id INT,
    step_number INT,
    instruction TEXT,
    FOREIGN KEY (recipe_id) REFERENCES Recipes (recipe_id)
);

-- Insert Data

-- Insert Categories
INSERT INTO Categories (category_id, category_name)
VALUES
    (1, 'Cake'),
    (2, 'No-Bake'),
    (3, 'Vegetarian');

-- Insert Ingredients
INSERT INTO Ingredients (ingredient_id, ingredient_name)
VALUES
    (1, 'Condensed milk'),
    (2, 'Cream Cheese'),
    (3, 'Lemon Juice'),
    (4, 'Pie Crust'),
    (5, 'Cherry Jam');

-- Insert Steps for Recipe "Cake"
INSERT INTO Steps (step_id, recipe_id, step_number, instruction)
VALUES
    (1, 1, 1, 'Beat Cream Cheese'),
    (2, 1, 2, 'Add condensed Milk and blend'),
    (3, 1, 3, 'Add Lemon Juice and blend'),
    (4, 1, 4, 'Add the mix to the pie crust'),
    (5, 1, 5, 'Spread the Cherry Jam'),
    (6, 1, 6, 'Place in refrigerator for 3h.');

-- Insert Recipe "Roasted Brussels Sprouts"
INSERT INTO Recipes (recipe_id, recipe_name)
VALUES (2, 'Roasted Brussels Sprouts');

-- Associate Recipe with Categories
INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES (2, 2), (2, 3); -- Vegan and Gluten-Free categories

-- Insert Ingredients for Recipe "Roasted Brussels Sprouts"
INSERT INTO RecipeIngredients (recipe_id, ingredient_id)
VALUES
    (2, 6),   -- Brussels Sprouts
    (2, 7),   -- Lemon juice
    (2, 8),   -- Sesame seeds
    (2, 9),   -- Pepper
    (2, 10),  -- Salt
    (2, 11);  -- Olive oil

-- Insert Steps for Recipe "Roasted Brussels Sprouts"
INSERT INTO Steps (step_id, recipe_id, step_number, instruction)
VALUES
    (7, 2, 1, 'Preheat the oven'),
    (8, 2, 2, 'Mix the ingredients in a bowl'),
    (9, 2, 3, 'Spread the mix on a baking sheet'),
    (10, 2, 4, 'Bake for 30 minutes');

-- Insert Recipe "Mac & Cheese"
INSERT INTO Recipes (recipe_id, recipe_name)
VALUES (3, 'Mac & Cheese');

-- Associate Recipe with Categories
INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES (3, 3); -- Vegetarian category

-- Insert Ingredients for Recipe "Mac & Cheese"
INSERT INTO RecipeIngredients (recipe_id, ingredient_id)
VALUES
    (3, 12),  -- Macaroni
    (3, 13),  -- Butter
    (3, 14),  -- Flour
    (3, 15),  -- Salt
    (3, 16),  -- Pepper
    (3, 17),  -- Milk
    (3, 18);  -- Shredded Cheddar cheese

-- Insert Steps for Recipe "Mac & Cheese"
INSERT INTO Steps (step_id, recipe_id, step_number, instruction)
VALUES
    (11, 3, 1, 'Cook Macaroni for 8 minutes'),
    (12, 3, 2, 'Melt butter in a saucepan'),
    (13, 3, 3, 'Add flour, salt, pepper and mix'),
    (14, 3, 4, 'Add Milk and mix'),
    (15, 3, 5, 'Cook until mix is smooth'),
    (16, 3, 6, 'Add cheddar cheese'),
    (17, 3, 7, 'Add the macaroni');

-- Insert Recipe "Tamagoyaki Japanese Omelette"
INSERT INTO Recipes (recipe_id, recipe_name)
VALUES (4, 'Tamagoyaki Japanese Omelette');

-- Associate Recipe with Categories
INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES (4, 3), (4, 4); -- Vegetarian and Japanese categories

-- Insert Ingredients for Recipe "Tamagoyaki Japanese Omelette"
INSERT INTO RecipeIngredients (recipe_id, ingredient_id)
VALUES
    (4, 19),  -- Eggs
    (4, 20),  -- Soy sauce
    (4, 21),  -- Sugar
    (4, 22),  -- Salt
    (4, 23);  -- Olive Oil

-- Insert Steps for Recipe "Tamagoyaki Japanese Omelette"
INSERT INTO Steps (step_id, recipe_id, step_number, instruction)
VALUES
    (18, 4, 1, 'Beat the eggs'),
    (19, 4, 2, 'Add soy sauce, sugar and salt'),
    (20, 4, 3, 'Add oil to a saucepan'),
    (21, 4, 4, 'Bring to medium heat'),
    (22, 4, 5, 'Add some mix to the saucepan'),
    (23, 4, 6, 'Let it cook for 1 minute'),
    (24, 4, 7, 'Add oil to a saucepan'),
    (25, 4, 8, 'Add some mix to the saucepan'),
    (26, 4, 9, 'Let it cook for 1 minute'),
    (27, 4, 10, 'Remove pan from fire');


-- All the vegetarian recipes with potatoes
SELECT Recipes.category_id, Recipes.category_name, Recipes.ingredient_name
FROM Recipes
JOIN RecipeCategories ON Recipes.recipe_id = RecipeCategories.recipe_id
JOIN Categories ON RecipeCategories.category_id = Categories.category_id
JOIN RecipeIngredients ON Recipes.recipe_id = RecipeIngredients.recipe_id
JOIN Ingredients ON RecipeIngredients.ingredient_id = Ingredients.ingredient_id
WHERE Categories.category_name = 'Vegetarian'
AND Ingredients.ingredient_name LIKE '%Potato%';

-- All the cakes that do not need baking
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

-- All the vegan and Japanese recipes
SELECT *
FROM Recipes
JOIN RecipeCategories ON Recipes.recipe_id = RecipeCategories.recipe_id
JOIN Categories ON RecipeCategories.category_id = Categories.category_id
WHERE category_name IN ('Vegan', 'Japanese');
