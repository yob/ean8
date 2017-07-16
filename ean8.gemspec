Gem::Specification.new do |s|
  s.name              = "ean8"
  s.version           = "1.1.0"
  s.summary           = "a (very) small library for working with EAN-8 codes"
  s.description       = "a (very) small library for working with EAN-8 codes"
  s.license           = "MIT"
  s.author            = "James Healy"
  s.email             = "jimmy@deefa.com"
  s.homepage          = "http://github.com/yob/ean8"
  s.has_rdoc          = true
  s.rdoc_options     << "--title" << "EAN-8" << "--line-numbers"
  s.test_files        = Dir.glob("spec/**/*_spec.rb")
  s.files             = Dir.glob("lib/**/*.rb") + [ "MIT-LICENSE", "README.markdown", "CHANGELOG"]
  s.required_ruby_version = ">=1.9.3"

  s.add_dependency("ean13")
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec", "~> 3.0")
end
