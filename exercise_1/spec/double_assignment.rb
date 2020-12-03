RSpec.describe "doubles" do
  it "test knowledge of content by completing TASK 1" do
  # TASK 1. Create a double with the name "Database Connection"
  # The double should have a method called connect that returns the value true.
  # The double should also have a method called disconnect that returns the value "Goodbye".
  # The doubles methods should be assigned in the initial invocation of the double method.
  # Write two expectations, one for connect and one for disconnect, that confirms the return value of each.
  # Assign that variable to the variable db.
    db = double("Database Connection", connect: true, disconnect: "Goodbye")
    expect(db.connect).to eq(true)
    expect(db.disconnect).to eq("Goodbye")
  end
  # TASK 2. Create a double with the name "File System". Assign the double to the variable fs.
  # Using the allow method give the double a read method that returns that value "Romeo and Juliet".
  # Using the allow method, give the double a write method that returns the value false.
  it "test knowledge of content by completing TASK 2" do
    fs = double("File System")
    allow(fs).to receive(:read).and_return("Romeo and Juliet")
    allow(fs).to receive(:write).and_return(false)
  end
end