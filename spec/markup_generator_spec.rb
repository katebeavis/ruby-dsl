require 'spec_helper'

describe 'Markup Generator' do
  let(:markup_generator) { MarkupGenerator.new }

  it 'outputs html' do
    html = MarkupGenerator.new do
      html do
        div "this"
      end
    end
    expect(html.result).to eq "<html><div>this</div></html>"
  end
end
