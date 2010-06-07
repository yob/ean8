$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'ean8'

describe EAN8 do
  it "should identify a valid EAN8" do
    EAN8.new("93469647").valid?.should be_true
  end

  it "should identify a valid EAN8" do
    EAN8.valid?("93469647").should be_true
    EAN8.valid?(93469647).should   be_true
  end

  it "should identify an invalid EAN8" do
    EAN8.valid?(nil).should              be_false
    EAN8.valid?("978184354916").should   be_false
    EAN8.valid?(Array).should            be_false
    EAN8.valid?(Array.new).should        be_false
    EAN8.valid?("93469648").should  be_false
  end

  it "should calculate a EAN8 check digit correctly" do
    EAN8.complete("9346964").should eql("93469647")
    EAN8.complete(9346964).should   eql("93469647")
  end

  it "should convert to an EAN-13 correctly" do
    EAN8.new("93469647").to_ean.should eql("0000093469647")
  end

  it "should convert to a GTIN-14 correctly" do
    EAN8.new("93469647").to_gtin.should eql("00000093469647")
  end
end
