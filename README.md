# Yabeda::Puma

Metrics for Puma server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yabeda-puma'
```

Unfortunately there is no easy way to detect whether process is running within Puma server. To enable exporter set either `PUMA_SERVER` or `YABEDA_PUMA_ENABLED` to any value.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Boostcom/yabeda-puma.
