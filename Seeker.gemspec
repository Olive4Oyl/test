# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Seeker/version'

Gem::Specification.new do |spec|
  spec.name          = "Seeker"
  spec.version       = Seeker::VERSION
  spec.authors       = ["Kelene Chung"]
  spec.email         = ["simoy93@gmail.com"]

  spec.summary       = %q{CLI that scrapes information from IMDB}
  spec.description   = %q{It pulls the latest and upcoming box office movies}
  spec.homepage      = "https://www.youtube.com/channel/UC26M23qqZQRxsPWqBOq39hA"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] ="'https://rubygems.org'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
