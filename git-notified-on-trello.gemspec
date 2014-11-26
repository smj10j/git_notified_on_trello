# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gnot/version'

Gem::Specification.new do |spec|
  spec.name          = "git-notified-on-trello"
  spec.version       = GNOT::VERSION
  spec.authors       = ["Stephen Johnson"]
  spec.email         = ["steve@01j.me"]
  spec.summary       = %q{Get notified of pushes to a Git Repo with updates to relevant Trello cards}
  spec.description   = %q{Makes Trello more useful when managing software development teams}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"

  spec.add_runtime_dependency "ruby-trello"
  spec.add_runtime_dependency "trollop"

end
