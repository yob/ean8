A small class for generating and validating EAN-8's, the 8 digit codes found
on many products sold around the world.

# Installation

    gem install ean8

# Usage

    EAN8.new("93469647").valid?
    => true

    EAN8.valid?("93469647")
    => true

    EAN8.valid?("93469646")
    => false

    EAN8.complete("9346964")
    => "93469647"

    EAN8.new("93469647").to_ean
    => "0000093469647"

    EAN8.new("93469647").to_gtin
    => "00000093469647"

# Further Reading

- http://en.wikipedia.org/wiki/EAN_8

# Contributing

Source code is publicly available @ http://github.com/yob/ean8
Patches welcome, preferably via a git repo I can pull from.
