class IngredientGenerator

  def initialize(recipe)
    @recipe = recipe
  end

  def add(name, quantity, unit)
    @recipe.ingredients_array << Ingredient.new(name, quantity, unit)
  end

  def mix_until(instructions)
    @recipe.mixing_array << instructions
  end

  def cook_for(time)
    @recipe.cooking_array << time
  end
end
