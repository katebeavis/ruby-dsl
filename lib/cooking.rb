class Cooking

  def initialize(recipe)
    @recipe = recipe
  end

  def using(*args, &block)
    generator = IngredientGenerator.new(@recipe)
    generator.instance_eval(&block)
  end
end
