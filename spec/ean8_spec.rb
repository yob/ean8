require 'ean8'

describe EAN8 do
  it "should identify a valid EAN8" do
    expect(EAN8.new("93469647").valid?).to be_truthy
  end

  it "should identify a valid EAN8" do
    expect(EAN8.valid?("93469647")).to be_truthy
    expect(EAN8.valid?(93469647)).to   be_truthy
  end

  it "should identify an invalid EAN8" do
    expect(EAN8.valid?(nil)).to              be_falsey
    expect(EAN8.valid?("978184354916")).to   be_falsey
    expect(EAN8.valid?(Array)).to            be_falsey
    expect(EAN8.valid?(Array.new)).to        be_falsey
    expect(EAN8.valid?("93469648")).to  be_falsey
  end

  it "should calculate a EAN8 check digit correctly" do
    expect(EAN8.complete("9346964")).to eql("93469647")
    expect(EAN8.complete(9346964)).to   eql("93469647")
  end

  it "should convert to an EAN-13 correctly" do
    expect(EAN8.new("93469647").to_ean).to eql("0000093469647")
  end

  it "should convert to a GTIN-14 correctly" do
    expect(EAN8.new("93469647").to_gtin).to eql("00000093469647")
  end
end
