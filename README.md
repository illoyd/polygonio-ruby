# Polygonio (Ruby)

## Table of Contents

- [Background](#background)
- [Installation](#installation)
- [Usage](#usage)

## Background

This is a client library for Polygon.io. Please see [Polygon.io](https://polygon.io)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'polygonio'
```

And then execute:

    $ bundle install


## Usage

**Create an instance of the client:**

All methods follow the documentation found [here]:https://polygon.io/docs pretty closely:



```ruby
client = Polygonio::Rest::Client.new(api_key)

# See tests for a full reference of all of methods
client.reference.tickers.list

client.stocks.list_exchanges

client.forex.historic_ticks

client.crypto.list # list exchanges

Polygonio::Websocket::Client.new("crypto", api_key).subscribe("XQ.BTC-USD") do |event|
  pp "Incoming message"
  pp event
end
```

Using delayed websockets.  If your account only supports delayed feeds you will need to use the delayed websocket endpoint

```
Polygonio::Websocket::Client.new("stocks", api_key, delayed: true).subscribe("AM.*,A.*,T.*") do |event|
  pp "Incoming message"
  pp event
end
```

