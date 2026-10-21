# Hash Generator API - Ruby Gem

Hash Generator computes cryptographic hashes for any text string across algorithms such as MD5, SHA-256, SHA-512, and BLAKE2. It outputs digests for single or multiple algorithms in one request.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_hashgenerator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_hashgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_hashgenerator'

# Initialize the client
client = APIVerve::Hashgenerator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  text: "Hello World",
  algorithms: "all"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ text: "Hello World", algorithms: "all" })
  puts response["data"]
rescue APIVerve::Hashgenerator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Hashgenerator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Hashgenerator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "input_text": "Hello World",
    "input_length": 11,
    "algorithms_used": [
      "sha256",
      "md5"
    ],
    "hashes": {
      "sha256": "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e",
      "md5": "b10a8db164e0754105b7a99be72e3fe5"
    },
    "hash_details": [
      {
        "algorithm": "sha256",
        "hash": "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e",
        "length": 64,
        "uppercase": "A591A6D40BF420404A011733CFB7B190D62C65BF0BCDA32B57B277D9AD9F146E"
      },
      {
        "algorithm": "md5",
        "hash": "b10a8db164e0754105b7a99be72e3fe5",
        "length": 32,
        "uppercase": "B10A8DB164E0754105B7A99BE72E3FE5"
      }
    ]
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/hashgenerator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/hashgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/hashgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
