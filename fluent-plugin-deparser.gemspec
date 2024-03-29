# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-deparser"
  gem.version       = "0.1.0"
  gem.authors       = ["TAGOMORI Satoshi"]
  gem.email         = ["tagomoris@gmail.com"]
  gem.description   = %q{join all values of message, and re-emit it}
  gem.summary       = %q{plugin to join all values to single attribute}
  gem.homepage      = "https://github.com/tagomoris/fluent-plugin-deparser"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "fluentd"
  gem.add_runtime_dependency "fluentd"
end
