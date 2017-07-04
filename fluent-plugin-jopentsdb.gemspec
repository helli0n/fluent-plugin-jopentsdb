# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-jopentsdb"
  gem.version       = "0.0.2"
  gem.authors       = ["Dmytro Vedetskyi"]
  gem.email         = ["dmytro.vedetskyi@gmail.com"]
  gem.description   = "Fluentd plugin to save json metrics in OpenTSDB"
  gem.summary       = "Fluentd plugin to save json metrics in OpenTSDB"
  gem.homepage      = "https://github.com/helli0n/fluent-plugin-jopentsdb"
  gem.files         = ["lib/fluent/plugin/out_jopentsdb.rb"]

  gem.require_paths = ["lib"]                                                                                                                                                                                                                         
  gem.add_development_dependency "rake"                                                                                                                                                                                                               
  gem.add_runtime_dependency "fluentd"
end
