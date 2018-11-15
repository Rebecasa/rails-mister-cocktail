require 'open-uri'

Ingredient.destroy_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_ingredients = open(url).read
ingredients = JSON.parse(serialized_ingredients)

ingredients["drinks"].each do |h|
  ingredient = h["strIngredient1"]
  Ingredient.create(name: ingredient)
end



