class Deck

  def self.build
    #logic to build a deck of cards
  end

end

class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build
  end

end

RSpec.describe CardGame do
  it "can only implement class methods that are defined on a class" do
    deck_klass = class_double(Deck, build: ["Ace", "Queen"]).as_stubbed_const
    # as_stubbed_const WILL REPLACE THE BUILD METHOD ON DECK WITH THE DOUBLE
    expect(deck_klass).to receive(:build)
    subject.start
    expect(subject.cards).to eq(["Ace", "Queen"])
  end
end