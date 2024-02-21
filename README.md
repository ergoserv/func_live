# func(live)

This gem allows you to call functions available on https://func.live.

## Installation


Install the gem and add to the application's `Gemfile` by executing:

    $ bundle add func_live

Or add one of these lines to your application's `Gemfile` manually:

```ruby
# version released to RubyGems (recommended)
gem 'func_live'

# or latest version from the repository
gem 'func_live', git: 'https://github.com/ergoserv/func_live'
# or from a specific branch of the GitHub repository
gem 'func_live', git: 'https://github.com/ergoserv/func_live', branch: 'develop'
# or from a local path (for development and testing purposes)
gem 'func_live', path: '../func_live'
```

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install func_live

### Get and set the token

You can get your token at https://tokens.wakeflow.io.

Set token in environment variable `ENV["FUNC_LIVE_TOKEN"]`
or in code using the `FuncLive.token` writer:

```ruby
FuncLive.token = 'your_func_token'
```

## Usage

There are many functions available on https://www.func.live,
the code snippet below demonstrates the usage of several of them.

```ruby
# Generate UUID - https://www.func.live/functions/uuid
FuncLive.("uuid")
# => "09ccfa6a-805e-46f5-ae4d-790988bec443"

# Get currency exchange rate for USD to EUR - https://www.func.live/functions/usdToEur
FuncLive.("usdToEur", 100)
# => 92.44

# Translate text to another language - https://www.func.live/functions/translate
FuncLive.(:translate, { text: "Hello World!", to: "FR" })
# => "Bonjour le monde!"

# Access OpenAI's GPT API with single line of code - https://www.func.live/functions/askGPT
FuncLive.(:askGPT, "Who are you?")
# => "I am a language model AI developed by OpenAI, created to assist and interact with users in generating human-like text based on the prompts given to me. How can I assist you today?"
```

You can browse all available functions at https://www.func.live/functions.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ergoserv/func_live. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ergoserv/func_live/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FuncLive project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ergoserv/func_live/blob/master/CODE_OF_CONDUCT.md).

---

This gem was created and is maintained by [ErgoServ](https://www.ergoserv.com).

If you like what you see and would like to hire us or join us, [get in touch](https://www.ergoserv.com)!
