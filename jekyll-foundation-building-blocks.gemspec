# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-foundation-building-blocks"
  spec.version       = "0.0.1"
  spec.authors       = ["Kevin Ball"]
  spec.email         = ["kmball11@gmail.com"]

  spec.summary       = %q{Add jekyll command for installing Foundation building blocks and kits}
  spec.homepage      = "https://github.com/kball/jekyll-foundation-building-blocks"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/).grep(%r{^lib/})
  spec.require_paths = %[lib]

  spec.add_runtime_dependency "jekyll", "~> 3.3"
  spec.add_development_dependency "bundler", "~> 1.12"
end
