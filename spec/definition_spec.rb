require('rspec')
require('definition')

describe(Definition) do
  describe("#Definition") do
    it("returns the definition") do
      test_definition = Definition.new({:definition => "It is a thing you read"})
      expect(test_definition.definition()).to(eq("It is a thing you read"))
    end
  end
end
