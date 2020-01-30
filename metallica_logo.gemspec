# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metallica_logo/version'

Gem::Specification.new do |spec|
  spec.name          = 'metallica_logo'
  spec.version       = MetallicaLogo::VERSION
  spec.authors       = ['john_farrell']
  spec.email         = ['john_farrell@symantec.com']

  spec.summary       = 'Small gem for generating a Metallica '\
                       'like logo for some provided string'
  spec.description   = 'This gem uses an existing logo generation API '\
                       'to generate a Metallica like logo for a given string'
  spec.homepage      = 'https://github.com/johnmfarrell1'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/johnmfarrell1/metallica_logo'
    spec.metadata['changelog_uri'] = 'https://github.com/johnmfarrell1/metallica_logo'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'vcr', '~> 5.0'
  spec.add_development_dependency 'webmock', '~> 3.0'
  spec.add_dependency 'rest-client', '~> 2.0'
end
