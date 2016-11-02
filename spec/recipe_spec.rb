require 'spec_helper'

describe 'Recipe' do
  let(:recipe) { Recipe.new }

  context 'adding tools' do

    it 'adds the given tool to the tools' do
      recipe = Recipe.describe 'Eggs in the microwave' do
        tools do
          add 'Microwave', 1
          add 'this', 2
        end
      end
      expect(recipe.tools_array.first.name).to eq 'Microwave'
    end

    it 'adds multiple tools' do
      recipe = Recipe.describe 'Eggs in the microwave' do
        tools do
          add 'Microwave', 1
          add 'this', 2
        end
      end
      expect(recipe.count).to eq(2)
    end
  end

  context 'adding ingredients' do

    it 'adds the given ingredient to the ingredients' do
      recipe = Recipe.describe 'Eggs in the microwave' do
        ingredients do
          add 'Egg', 1, :unit
          add 'Milk', 0.1, :litres
        end
      end
      expect(recipe.first.name).to eq 'Egg'
    end

    it 'adds multiple ingredients' do
      recipe = Recipe.describe 'Eggs in the microwave' do
        ingredients do
          add 'Egg', 1, :unit
          add 'Milk', 0.1, :litres
        end
      end
      expect(recipe.count).to eq(2)
    end
  end

end
