# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ramba/version'

Gem::Specification.new do |spec|
  spec.name          = "ramba"
  spec.version       = Ramba::VERSION
  spec.authors       = ["Alan Graham"]
  spec.email         = ["alan@productlab.com"]
  spec.summary       = %q{Ruby Asset Manager}
  spec.description   = %q{Ruby Asset Manager capable of working with Bower-enabled web assets hosted on Github.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "sprockets"
  spec.add_dependency "httparty"
  spec.add_dependency "colorize"
end
