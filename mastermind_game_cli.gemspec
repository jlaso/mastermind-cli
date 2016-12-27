# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mastermind_game_cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'mastermind_game_cli'
  spec.version       = MastermindGameCli::VERSION
  spec.authors       = ['Joseluis Laso']
  spec.email         = ['jlaso@joseluislaso.es']

  spec.summary       = 'An old (but funny) game to play on console'
  spec.description   = 'A numeric version of the well known mastermind to play on console'
  spec.homepage      = 'https://rubygems.org/gems/mastermind-game-cli'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "colorize", "~> 0.8.1"
end
