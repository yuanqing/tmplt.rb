Gem::Specification.new do |spec|

  spec.name          = "tmplt"
  spec.version       = "0.0.1"
  spec.authors       = ["yuanqing"]
  spec.email         = ["hello@yuanqing.sg"]
  spec.summary       = "Interpolate values from a hash into a template string."
  spec.homepage      = "https://github.com/yuanqing/tmplt"
  spec.license       = "MIT"

  spec.files         = Dir["LICENSE", "README.md", "lib/*"]
  spec.test_files    = Dir["spec/*"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end
