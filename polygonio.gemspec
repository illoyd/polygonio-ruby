# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "polygonio/version"

Gem::Specification.new do |spec|
  spec.name          = "polygonio"
  spec.version       = Polygonio::VERSION
  spec.authors       = ["Anthony Eufemio"]
  spec.email         = ["ace@135.io"]

  spec.license       = "MIT"

  spec.summary       = "Client library for polygon.io. Polygon IO is an API for market data. Modernized version"
  spec.description   = "Client library for polygon.io's REST and Websocket API's. Polygon IO is an API for market data. Modernized version"

  spec.metadata = {
    "homepage_uri" => "https://github.com/tymat/polygonio-ruby",
    "source_code_uri" => "https://github.com/tymat/polygonio-ruby",
    "bug_tracker_uri" => "https://github.com/tymat/polygonio-ruby/issues"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "dry-struct"
  spec.add_runtime_dependency "dry-types"
  spec.add_runtime_dependency "eventmachine"
  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_runtime_dependency "faraday_middleware-parse_oj"
  spec.add_runtime_dependency "oj"
  spec.add_runtime_dependency "permessage_deflate"
  spec.add_runtime_dependency "websocket-driver"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "bundler-audit"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "vcr"
end
