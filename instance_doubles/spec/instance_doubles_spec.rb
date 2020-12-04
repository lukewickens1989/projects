class Person

  def a
    sleep(3)
    "Hello!"
  end
    
end

RSpec.describe Person do
  describe "regular double" do
    it "can implement any method" do
      person = double(a: "Hello!", b: 20)
      # :b IS EXTRA FUNCTIONALITY POLLUTING THE DOUBLE (NOT THE SAME AS THE ORIGINAL)
      expect(person.a).to eq("Hello!")
    end
  end

  # STRICTER THAN A NORMAL DOUBLE - RECOMMENDED
  describe "instance double - varifiing double" do
    it "can only implement methods that are defined on the class" do
      # person = instance_double(Person, a: "Hello!", b: 20)
      # THROWS ERROR BEFORE ANYTHING HAS BEEN ASSERTED AS PERSON HAS NO METHOD OF b
      # CORRECTED: person = instance_double(Person, a: "Hello!")
      person = instance_double(Person)
      # allow(person).to receive(:a).with(3, 10).and_return("Hello!")
      # THROWS ERROR AS IT EXPECTS 0 ARGUMENT BUT WE GIVE IT 2 - CHECKS ARITY(how many args you pass in)
      allow(person).to receive(:a).and_return("Hello!")
      expect(person.a).to eq("Hello!")
    end
  end
end