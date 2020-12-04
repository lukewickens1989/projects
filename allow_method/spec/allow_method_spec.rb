RSpec.describe "allow method review" do
  it "can customize return value for methods on doubles" do
    calculator = double
    allow(calculator).to receive(:add).and_return(15)

    # ALL WILL RETURN 15 AS THAT IS WHAT ADD IS EQUAL TOO REGARDLESS OF WHAT IS PASSED IN
    expect(calculator.add).to eq(15)
    expect(calculator.add(3)).to eq(15)
    expect(calculator.add(-2, -3, -5)).to eq(15)
    expect(calculator.add("hello")).to eq(15)
  end

  it "can stub one or more methods on a real object" do
    arr = [1, 2, 3]
    allow(arr).to receive(:sum).and_return(10)
    # WILL FAIL AS RSPEC HAS INTERCEPTED SUM METHOD AND CHANGED VALUE TO 10
    expect(arr.sum).to eq(10)

    # IT WILL NOT CHANGE ANY OTHER METHODS ON THE OBJECT
    arr.push(4)
    expect(arr).to eq([1, 2, 3, 4])
  end
    it "can return mutliple return values in sequence" do
      mock_array = double
      # FIRST INVOKE = :c, SECOND INVOKE = :b, EVERY OTHER TIME AFTER WILL = nil
      allow(mock_array).to receive(:pop).and_return(:c, :b, nil)
      expect(mock_array.pop).to eq(:c)
      expect(mock_array.pop).to eq(:b)
      expect(mock_array.pop).to be_nil
      expect(mock_array.pop).to be_nil
      expect(mock_array.pop).to be_nil
    end
end