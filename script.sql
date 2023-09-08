// Recipes Collection
db.Recipes.insertMany([
    {
        recipe_id: 1,
        recipe_name: 'Cake',
        categories: [1, 2, 3],
        ingredients: [1, 2, 3, 4, 5],
        steps: [
            { step_id: 1, step_number: 1, instruction: 'Beat Cream Cheese' },
            { step_id: 2, step_number: 2, instruction: 'Add condensed Milk and blend' },
            { step_id: 3, step_number: 3, instruction: 'Add Lemon Juice and blend' },
            { step_id: 4, step_number: 4, instruction: 'Add the mix to the pie crust' },
            { step_id: 5, step_number: 5, instruction: 'Spread the Cherry Jam' },
            { step_id: 6, step_number: 6, instruction: 'Place in refrigerator for 3h.' }
        ]
    },
    {
        recipe_id: 2,
        recipe_name: 'Roasted Brussels Sprouts',
        categories: [2, 3],
        ingredients: [6, 7, 8, 9, 10, 11],
        steps: [
            { step_id: 7, step_number: 1, instruction: 'Preheat the oven' },
            { step_id: 8, step_number: 2, instruction: 'Mix the ingredients in a bowl' },
            { step_id: 9, step_number: 3, instruction: 'Spread the mix on a baking sheet' },
            { step_id: 10, step_number: 4, instruction: 'Bake for 30 minutes' }
        ]
    },
    {
        recipe_id: 3,
        recipe_name: 'Mac & Cheese',
        categories: [3],
        ingredients: [12, 13, 14, 15, 16, 17, 18],
        steps: [
            { step_id: 11, step_number: 1, instruction: 'Cook Macaroni for 8 minutes' },
            { step_id: 12, step_number: 2, instruction: 'Melt butter in a saucepan' },
            { step_id: 13, step_number: 3, instruction: 'Add flour, salt, pepper and mix' },
            { step_id: 14, step_number: 4, instruction: 'Add Milk and mix' },
            { step_id: 15, step_number: 5, instruction: 'Cook until mix is smooth' },
            { step_id: 16, step_number: 6, instruction: 'Add cheddar cheese' },
            { step_id: 17, step_number: 7, instruction: 'Add the macaroni' }
        ]
    },
    {
        recipe_id: 4,
        recipe_name: 'Tamagoyaki Japanese Omelette',
        categories: [3, 4],
        ingredients: [19, 20, 21, 22, 23],
        steps: [
            { step_id: 18, step_number: 1, instruction: 'Beat the eggs' },
            { step_id: 19, step_number: 2, instruction: 'Add soy sauce, sugar and salt' },
            { step_id: 20, step_number: 3, instruction: 'Add oil to a saucepan' },
            { step_id: 21, step_number: 4, instruction: 'Bring to medium heat' },
            { step_id: 22, step_number: 5, instruction: 'Add some mix to the saucepan' },
            { step_id: 23, step_number: 6, instruction: 'Let it cook for 1 minute' },
            { step_id: 24, step_number: 7, instruction: 'Add oil to a saucepan' },
            { step_id: 25, step_number: 8, instruction: 'Add some mix to the saucepan' },
            { step_id: 26, step_number: 9, instruction: 'Let it cook for 1 minute' },
            { step_id: 27, step_number: 10, instruction: 'Remove pan from fire' }
        ]
    }
]);

// Categories Collection
db.Categories.insertMany([
    { category_id: 1, category_name: 'Cake' },
    { category_id: 2, category_name: 'No-Bake' },
    { category_id: 3, category_name: 'Vegetarian' }
]);

// Ingredients Collection
db.Ingredients.insertMany([
    { ingredient_id: 1, ingredient_name: 'Condensed milk' },
    { ingredient_id: 2, ingredient_name: 'Cream Cheese' },
    { ingredient_id: 3, ingredient_name: 'Lemon Juice' },
    { ingredient_id: 4, ingredient_name: 'Pie Crust' },
    { ingredient_id: 5, ingredient_name: 'Cherry Jam' },
    { ingredient_id: 6, ingredient_name: 'Brussels Sprouts' },
    { ingredient_id: 7, ingredient_name: 'Lemon juice' },
    { ingredient_id: 8, ingredient_name: 'Sesame seeds' },
    { ingredient_id: 9, ingredient_name: 'Pepper' },
    { ingredient_id: 10, ingredient_name: 'Salt' },
    { ingredient_id: 11, ingredient_name: 'Olive oil' },
    { ingredient_id: 12, ingredient_name: 'Macaroni' },
    { ingredient_id: 13, ingredient_name: 'Butter' },
    { ingredient_id: 14, ingredient_name: 'Flour' },
    { ingredient_id: 15, ingredient_name: 'Salt' },
    { ingredient_id: 16, ingredient_name: 'Pepper' },
    { ingredient_id: 17, ingredient_name: 'Milk' },
    { ingredient_id: 18, ingredient_name: 'Shredded Cheddar cheese' },
    { ingredient_id: 19, ingredient_name: 'Eggs' },
    { ingredient_id: 20, ingredient_name: 'Soy sauce' },
    { ingredient_id: 21, ingredient_name: 'Sugar' },
    { ingredient_id: 22, ingredient_name: 'Salt' },
    { ingredient_id: 23, ingredient_name: 'Olive Oil' }
]);
