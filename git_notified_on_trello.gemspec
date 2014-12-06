# coding: utf-8
require_relative 'lib/git_notified_on_trello/version'

Gem::Specification.new do |spec|
  spec.name          = "git_notified_on_trello"
  spec.version       = GitNotifiedOnTrello::VERSION
  spec.authors       = ["Stephen Johnson"]
  spec.email         = ["steve@01j.me"]
  spec.summary       = %q{Get notified of pushes to a Git Repo with updates to relevant Trello cards}
  spec.description   = %q{Makes Trello more useful when managing software development teams}
  spec.homepage      = "https://github.com/smj10j/git_notified_on_trello"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"

  spec.add_runtime_dependency "ruby-trello", '~> 1.1.2'
  spec.add_runtime_dependency "trollop", '~> 2.0'

end
