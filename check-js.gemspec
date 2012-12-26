# -*- encoding: utf-8 -*-
require File.expand_path('../lib/check-js/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Garry Shutler"]
  gem.email         = ["garry@robustsoftware.co.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "check-js"
  gem.require_paths = ["lib"]
  gem.add_dependency('useragent', '>= 0.4')
  gem.version       = Check::Js::VERSION
end
