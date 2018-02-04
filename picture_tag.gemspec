# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picture_tag/version'

Gem::Specification.new do |spec|
  spec.name          = 'picture_tag'
  spec.version       = PictureTag::VERSION
  spec.authors       = ['Tomas Celizna']
  spec.email         = ['tomas.celizna@gmail.com']
  spec.summary       = 'Rails helper for <picture> tag integrated with Picturefill.'
  spec.description   = 'Rails helper for <picture> tag integrated with Picturefill.'
  spec.homepage      = 'https://github.com/tomasc/picture_tag'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 3.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-spec'
  spec.add_development_dependency 'rake'
end
