class EAN8

  class Version #:nodoc:
    Major = 1
    Minor = 1
    Tiny  = 0

    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(str)
    @number = str.to_s
  end

  def valid?
    EAN8.valid? @number
  end

  def self.valid?(ean)
    ean = ean.to_s
    ean.length == 8 && ean == EAN8.complete(ean[0,7])
  end

  # Purely for generating new ean numbers
  def self.complete(seven)
    seven = seven.to_s
    return nil unless seven.length == 7 && seven.match(/\d{7}/)

    arr = (0..6).to_a.collect do |i|
      if (i+1) % 2 == 0
        seven[i,1].to_i
      else
        seven[i,1].to_i * 3
      end
    end
    sum = arr.inject { |sum, n| sum + n }
    remainder = sum % 10
    if remainder == 0
      check = 0
    else
      check = 10 - remainder
    end

    seven + check.to_s
  end

  def to_ean
    return nil unless self.valid?
    "00000#{@number}"
  end

  def to_gtin
    return nil unless self.valid?
    "000000#{@number}"
  end

end
