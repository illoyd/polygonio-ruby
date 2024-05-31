# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "polygonio/version"

Gem::Specification.new do |spec|
  spec.name          = "polygonio-ruby"
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

  spec.add_runtime_dependency "activesupport", [">= 6.0.2.2"]
  spec.add_runtime_dependency "dry-struct", [">= 1.2.0"]
  spec.add_runtime_dependency "dry-types", [">= 1.2.2"]
  spec.add_runtime_dependency "eventmachine", [">= 1.2.7"]
  spec.add_runtime_dependency "faraday", [">= 0.17.3"]
  spec.add_runtime_dependency "faraday_middleware", [">= 0.13.1"]
  spec.add_runtime_dependency "faraday_middleware-parse_oj", [">= 0.3.2"]
  spec.add_runtime_dependency "oj", [">= 3.10.1"]
  spec.add_runtime_dependency "permessage_deflate", [">= 0.1.4"]
  spec.add_runtime_dependency "websocket-driver", [">= 0.7.1"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "bundler-audit", "~> 0.6"
  spec.add_development_dependency "dotenv", "~> 2.7"
  spec.add_development_dependency "faker", "~> 2.11"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 0.80"
  spec.add_development_dependency "rubocop-performance", "~> 1.5"
  spec.add_development_dependency "vcr", "~> 5.1"
end
