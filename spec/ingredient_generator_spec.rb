require 'spec_helper'

describe 'Ingredient Generator' do
  let(:ingredient_generator) { IngredientGenerator.new recipe }
  let(:recipe) { Recipe.new }

  describe 'add' do
    before do
      ingredient_generator.add('Egg', 1, :unit)
    end

    context 'adding an ingredient' do

      it 'creates a ingredient with the given name' do
        expect(recipe.ingredients_array.first.name).to eq("Egg")
      end

      it 'creates a ingredient with the given quantity' do
        expect(recipe.ingredients_array.first.quantity).to eq(1)
      end

      it 'creates a ingredient with the given unit' do
        expect(recipe.ingredients_array.first.unit).to eq(:unit)
      end
    end
  end

  describe 'mix_until' do
    before do
      ingredient_generator.mix_until('properly mixed')
    end

    context 'adding an ingredient instruction' do
      it 'creates an instruction' do
        expect(recipe.mixing_array).to eq(["properly mixed"])
      end
    end
  end

  describe 'cook_for' do
    before do
      ingredient_generator.cook_for('2 minutes')
    end

    context 'adding an ingredient instruction' do
      it 'creates an instruction' do
        expect(recipe.cooking_array).to eq(["2 minutes"])
      end
    end
  end
end
