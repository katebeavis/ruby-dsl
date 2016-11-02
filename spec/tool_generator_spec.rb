require 'spec_helper'

describe 'Tool Generator' do
  let(:tool_generator) { ToolGenerator.new recipe }
  let(:recipe) { Recipe.new }

  describe 'add' do
    before do
      tool_generator.add('Microwave', 1)
    end

    context 'add' do

      it 'creates a tool with the given name' do
        expect(recipe.tools_array.first.name).to eq("Microwave")
      end

      it 'creates a tool with the given quantity' do
        expect(recipe.tools_array.first.quantity).to eq(1)
      end
    end
  end
end
