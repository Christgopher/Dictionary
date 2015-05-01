require('rspec')
require('word')

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
end
