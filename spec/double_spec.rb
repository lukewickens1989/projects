RSpec.describe "a random double" do
  it "only allows defined methods to be invoked" do

    #ALL THE BELOW SYNTAX ARE VALID THE ONLY DIFFERENCE IS ON HOW YOU TELL THE TEST THAT
    #YOU WANT IT TO RECEIVE MESSAGES

    # METHOD 1
    # stuntman = double("Mr. Danger", fall_off_ladder: "Ouch", light_on_fire: true)
    # expect(stuntman.fall_off_ladder).to eq("Ouch")
    # expect(stuntman.light_on_fire).to eq(true)
    
    # WHEN A METHOD IS INVOKED WITH NO RETURN VALUE IT WILL DEFAULT TO NIL
    # stuntman = double("Mr. Danger")
    # allow(stuntman).to receive(:fall_off_ladder)
    # expect(stuntman.fall_off_ladder).to be_nil

    # METHOD 2 - MORE DYNAMIC - NOT FIXED IN STONE LIKE METHOD 1)
    # stuntman = double("Mr. Danger")
    # allow(stuntman).to receive(:fall_off_ladder).and_return("Ouch")
    # expect(stuntman.fall_off_ladder).to eq("Ouch")
    
    # METHOD 3 - DIFFERENT SYNTAX
    stuntman = double("Mr. Danger")
    allow(stuntman).to receive_messages(fall_off_ladder: "Ouch", light_on_fire: true)
    expect(stuntman.fall_off_ladder).to eq("Ouch")
    expect(stuntman.light_on_fire).to eq(true)
  end

end
