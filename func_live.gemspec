# frozen_string_literal: true

require_relative "lib/func_live/version"

Gem::Specification.new do |spec|
  spec.name    = "func_live"
  spec.version = FuncLive::VERSION
  spec.authors = ['Dmitry Babenko', 'ErgoServ']
  spec.email   = ['dmitry@ergoserv.com', 'hello@ergoserv.com']

  spec.summary     = "fund(live)"
  spec.description = "Allows you to import and call the functions on www.func.live."
  spec.homepage    = "https://www.func.live/"
  spec.license     = "MIT"

  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ergoserv/func_live"
  spec.metadata["changelog_uri"]   = "https://github.com/ergoserv/func_live/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
end
