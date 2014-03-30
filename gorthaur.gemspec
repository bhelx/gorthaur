# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gorthaur/version"

Gem::Specification.new do |spec|
  spec.name          = "gorthaur"
  spec.version       = Gorthaur::VERSION
  spec.authors       = ["Aaron Paterson", "Benjamin Eckel"]
  spec.email         = []
  spec.summary       = %q{Watch yourself coding}
  spec.description   = spec.summary
  spec.homepage      = "http://bhelx.github.io/time_lapser"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.executables   = Dir["bin/**/*"].map! { |f| f.gsub(/bin\//, "") }
  spec.test_files    = Dir["test/**/*", "spec/**/*"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "av_capture", "~> 1.0"
  spec.add_runtime_dependency "dante", "~> 0.2"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "pry", "~> 0.9"
end
