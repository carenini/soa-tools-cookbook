require_relative 'spec_helper'

describe 'soa_tools::default' do
  let(:runner) { ChefSpec::Runner.new.converge(described_recipe) }

  %W[apt java soa_tools::wso2_registry soa_tools::wso2_ues 
    soa_tools::bamos_server].each do |recipe|
    it "includes the #{recipe} recipe" do
      expect(runner).to include_recipe(recipe)
    end
  end
end