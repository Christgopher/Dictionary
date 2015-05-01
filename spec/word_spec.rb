require('rspec')
require('word')
require('definition')

describe(Word) do

  before() do
    Word.clear()
  end

  describe(".all") do
    it("makes it empty first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a word to the array") do
      test_word = Word.new({:word => "Book"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("clears the saved words from the word array") do
      test_word =  Word.new({:word => "Book"})
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#word") do
    it("returns the word called") do
      test_word = Word.new({:word => "Book"})
      expect(test_word.word()).to(eq("Book"))
    end
  end

  describe("#id") do
    it("returns the id of the word called") do
      test_word = Word.new({:word => "Book"})
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe("#add_definition") do
    it("adds the definition to a word") do
      test_word = Word.new({:word => "Book"})
      test_definition = Definition.new({:definition => "A thing that you read"})
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

  describe(".find") do
    it("finds a word based on its id") do
      test_word = Word.new({:word => "Book"})
      test_word.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end
