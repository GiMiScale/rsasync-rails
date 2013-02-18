require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'rsasync-rails', 'version'))

Gem::Specification.new do |gem|
  gem.authors       = ['Thomas A. de Ruiter']
  gem.email         = ['thomas.deruiter@gimiscale.com']
  gem.description   = %q{Extension to jsbn which adds facilities for asynchronous RSA key generation. Primarily created to avoid execution timeout on mobile devices. This gem integrates rsasync with Rails asset pipeline for easy of use.}
  gem.summary       = %q{Integrate rsasync javascript library with Rails asset pipeline}

  gem.executables   = []
  gem.files         = []
  gem.files        << 'lib/rsasync-rails.rb'
  gem.files        << 'lib/rsasync-rails/version.rb'
  gem.files        << 'lib/rsasync-rails/engine.rb'
  gem.files        << 'lib/rsasync-rails/railtie.rb'
  gem.files        << 'vendor/assets/javascripts/jsbn.js'
  gem.files        << 'vendor/assets/javascripts/jsbn2.js'
  gem.files        << 'vendor/assets/javascripts/rsa.js'
  gem.files        << 'vendor/assets/javascripts/rsa2.js'
  gem.files        << 'vendor/assets/javascripts/rng.js'
  gem.files        << 'vendor/assets/javascripts/prng4.js'
  gem.files        << 'vendor/assets/javascripts/base64.js'
  gem.files        << 'vendor/assets/javascripts/rsasync.js'
  gem.files        << 'vendor/assets/javascripts/jsbn-rails.js'
  gem.files        << 'vendor/assets/javascripts/jsbn-ecc-rails.js'
  gem.files        << 'vendor/assets/javascripts/jsbn-sha1-rails.js'
  gem.files        << 'vendor/assets/javascripts/rsasync-rails.js'
  gem.files        << 'vendor/assets/javascripts/ssh-format-rails.coffee'
  gem.test_files    = []
  gem.name          = 'rsasync-rails'
  gem.require_paths = ['lib']
  gem.version       = ::RSAsync::Rails::VERSION

  gem.add_dependency 'railties', '>= 3.0'
  gem.add_dependency 'coffee-rails', '~> 3.2.1'
  gem.add_development_dependency 'bundler', '>= 1.0'
  gem.add_development_dependency 'rails', '>= 3.0'
end
