# -*- encoding: utf-8 -*-
require File.expand_path('../lib/browser_details/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Garry Shutler"]
  gem.email         = ["garry@robustsoftware.co.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = Dir.glob(File.join(File.dirname(__FILE__), 'lib', '**', '*'))
  gem.name          = "browser_details"
  gem.require_paths = ["lib"]
  gem.add_dependency('useragent', '>= 0.4')
  gem.version       = BrowserDetails::VERSION
end
