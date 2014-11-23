# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'game_words/version'

Gem::Specification.new do |spec|
  spec.name          = 'game_words'
  spec.version       = GameWords::VERSION
  spec.authors       = ['Nick Aschenbach']
  spec.email         = ['nick.aschenbach@gmail.com']
  spec.summary       = %q{Find game words for pictionary, catchphrase, charades and holidays}
  spec.description   = %q{Find words, phrases, songs, movies, characters, actions and sayings for
Pictionary, Catchphrase, Charades or the holidays. Each game has several
categories including difficulty levels. This library returns a list for
some or all categories.}
  spec.homepage      = 'https://github.com/nick-aschenbach/game-words'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '>= 3.0'
end
