class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end

  def act
    "Lets go!"
  end

  def fall_off_ladder
    "Call my agent! No Way!"
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor
  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    if actor.ready?
      actor.act
      actor.fall_off_ladder
      actor.light_on_fire
      actor.act
    end
  end
end

# actor = Actor.new("Tom Cruise")
# movie = Movie.new(actor)
# movie.start_shooting

RSpec.describe Movie do
  # MIMIC THE ACTOR CLASS WITH THE DOUBLE
  let(:stuntman) {double("Mr. Danger", ready?: true, act: "Sure, why not!", fall_off_ladder: "No way! Call my agent!", light_on_fire: false)}
  subject { described_class.new(stuntman) }

  describe "#start_shooting" do
    # PROPERLY TESTS THAT THE MOVIE CLASS RECEIVES THE CORRECT METHODS
    it "expects and actor to perform three actions" do
      # expect(stuntman).to receive(:ready?)
      # expect(stuntman).to receive(:act)
      # expect(stuntman).to receive(:fall_off_ladder)
      # expect(stuntman).to receive(:light_on_fire)

      # QUALIFY HOW MANY TIMES YOU WANT TO SEE IT RUN
      # expect(stuntman).to receive(:light_on_fire).once
      # expect(stuntman).to receive(:light_on_fire).exactly(1).times
      # expect(stuntman).to receive(:light_on_fire).at_most(1).times

      # expect(stuntman).to receive(:act).twice
      # expect(stuntman).to receive(:act).exactly(2).times
      expect(stuntman).to receive(:act).at_least(2).times
      subject.start_shooting
    end
  end
end