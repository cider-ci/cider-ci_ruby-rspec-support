# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cider_ci/rspec_support'
require 'cider_ci/rspec_support/version'
require 'cider_ci/rspec_support/collector'

Gem::Specification.new do |spec|
  spec.name          = 'cider_ci-rspec_support'
  spec.version       = ::CiderCI::RspecSupport::VERSION
  spec.authors       = ['Thomas Schank']
  spec.email         = ['DrTom@schank.ch']
  spec.summary       = 'Cider-CI support for Rspec'
  spec.description   = ''
  spec.homepage      = 'https://github.com/cider-ci/cider-ci_ruby-rspec-support'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin/) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_runtime_dependency 'rspec', '~> 3.1'

  spec.add_runtime_dependency 'rspec-core', '>= 3.0.0', '< 4.0.0'
end
