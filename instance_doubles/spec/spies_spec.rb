# SPIES ARE AN ALTERNATE TYPE OF TEST DOUBLE
# WORKS AFTER THE FACT - PAST TENSE

RSpec.describe "spies" do
  let(:animal) { spy("animal") }

  it "confirms that a message has been received" do
    animal.eat_food
    expect(animal).to have_received(:eat_food)
    # WILL FAIL AS IT HASNT BEEN INVOKED IN TEST expect(animal).to have_received(:eat_human)
  end

  it "resets between examples" do
    expect(animal).not_to have_received(:eat_food)
  end

  it "retains the same functionality of a regular double" do
    animal.eat_food
    animal.eat_food
    animal.eat_food("Sushi")
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).with("Sushi")
    expect(animal).to have_received(:eat_food).once.with("Sushi")
  end
end