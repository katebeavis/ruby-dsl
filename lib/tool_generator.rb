class ToolGenerator

  def initialize(recipe)
    @recipe = recipe
  end

  def add(name, quantity)
    @recipe.tools_array << Tool.new(name, quantity)
  end
end
