# MetallicaLogo

![Metallica Logo](https://raw.githubusercontent.com/johnmfarrell1/metallica_logo/master/examples/metallica_logo_example_cropped.png)

Get any provided text as a Metallica image logo.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'metallica_logo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metallica_logo

## Usage

You can initialize a new client for fetching logos as follows:
```ruby
client = MetallicaLogo::Client.new
```

The client has 2 public methods depending on how you wish to use it.
To fetch a logo result without downloading the image, use the following:

```ruby
logo = client.generate_logo('some text to generate')
#=> #<MetallicaLogo::Result:0x0000000000000000 @file="<url to image>", @token="<token>", @result="<result>">
```

If you wish to also save the image locally, use the following:

```ruby
logo = client.generate_and_download_logo('some text to generate', 'file.jpg')
#=> #<Pathname:file.jpg>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Note: This gem uses a 3rd party API. I do not own this 3rd party API.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johnmfarrell1/metallica_logo.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
