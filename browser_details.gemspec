# -*- encoding: utf-8 -*-
require File.expand_path('../lib/browser_details/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Garry Shutler"]
  gem.email         = ["garry@robustsoftware.co.uk"]
  gem.description   = %q{
    Browser Details is a Rack Middleware that logs information about the browser
    used to make a request
  }
  gem.summary       = %q{
    Browser Details is a Rack Middleware that logs information about the browser
    used to make a request
  }
  gem.homepage      = "https://github.com/gshutler/browser_details"

  gem.files         = Dir.glob(File.join(File.dirname(__FILE__), 'lib', '**', '*'))
  gem.name          = "browser_details"
  gem.require_paths = ["lib"]
  gem.add_dependency('useragent', '>= 0.4')
  gem.version       = BrowserDetails::VERSION
end
