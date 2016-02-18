# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/rezli/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-rezli'
  s.version  = OmniAuth::Rezli::VERSION
  s.authors  = ['Rezli']
  s.email    = ['development@rezli.com']
  s.summary  = 'Rezli OAuth2 Strategy for OmniAuth'
  s.homepage = 'https://github.com/irongaming/omniauth-rezli'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rake'
end
