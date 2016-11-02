require './lib/tool'
require './lib/tool_generator'
require './lib/ingredient'
require './lib/ingredient_generator'
require './lib/cooking'
require './lib/markup_generator'
require 'pry'
require 'pry-nav'

class Recipe

  attr_accessor :tools_array, :ingredients_array, :mixing_array, :cooking_array

  def initialize
    @tools_array = []
    @ingredients_array = []
    @mixing_array = []
    @cooking_array = []
  end

  def self.describe(recipe_name, &block)
    recipe = Recipe.new
    recipe.instance_eval(&block)
    recipe
  end

  def tools(&block)
    generator = ToolGenerator.new(self)
    generator.instance_eval(&block)
  end

  def ingredients(&block)
    generator = IngredientGenerator.new(self)
    generator.instance_eval(&block)
  end

  def cooking(*args, &block)
    cooking = Cooking.new(self)
    cooking.instance_eval(&block)
  end

  def ingredient_names_and_quantities
    array = @ingredients_array.uniq
    array.map { |i| i.quantity.to_s + " " + i.unit.to_s + " of " + i.name.to_s }
  end

  def tool_names
    @tools_array.map { |t| t.quantity.to_s + " " + t.name.to_s }
  end

  def ingredient_names
    array = @ingredients_array.uniq
    array.map { |i| i.name.to_s }
  end

  def pretty_print
    puts "In order to cook #{ingredient_names.first}, you need the following tools #{tool_names.join(', ')}.\n"
    puts "You'll also need the following ingredients: #{ingredient_names_and_quantities[0..1].join(', ')}\n"
    puts "First you need to cook the #{ingredient_names.last}. You need the following tools: #{tool_names[1..2].join(', ')}.\n"
    puts "Then add #{ingredient_names_and_quantities[0..1].join(', ')} and mix until #{@mixing_array[0]}.\n"
    puts "Finally you need to cook the end product. You need to use the following: #{tool_names[0]}.\n"
    puts "Then add #{ingredient_names_and_quantities[2]} and cook #{@cooking_array[0]}."
  end


  this = Recipe.describe 'Eggs in the microwave' do
    tools do
      add 'Microwave', 1
      add 'Pot', 1
      add 'Fork', 1
    end

    ingredients do
      add 'Egg', 1, :unit
      add 'Milk', 0.1, :litres
    end

    cooking 'Egg mix', 200, :grams do
      using 'Pot', 'Fork' do
        add 'Egg', 1, :unit
        add 'Milk', 0.1, :litres
        mix_until 'properly mixed'
      end
    end

    cooking 'Melt cheese', 200, :grams do
      using 'Pot' do
        add 'Cheese', 1, :unit
        mix_until 'melted'
      end
    end

    cooking 'End product' do
      using 'Microwave' do
        add 'Egg mix', 200, :grams
        cook_for '2 minutes'
      end
    end
  end

  html = MarkupGenerator.new do
    html do
      body do
        div do
          ul do
            li 'Microwave'
            li 'Pot'
            li 'Fork'
          end
        end
        div do
          ul do
            li 'Egg'
            li 'Milk'
          end
        end
        div do
          div do
            pa "Description"
          end
          div do
            pa 'Description'
          end
        end
      end
    end
  end

  puts html.result

end
