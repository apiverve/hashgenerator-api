# Hash Generator API - PHP Package

Hash Generator is a tool for generating cryptographic hashes from text. It supports multiple algorithms including MD5, SHA-1, SHA-256, SHA-384, SHA-512, and BLAKE2 variants for data integrity and security applications.

## Installation

Install via Composer:

```bash
composer require apiverve/hashgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Hashgenerator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'text' => 'Hello World',
    'algorithms' => 'all'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Hashgenerator\Client;
use APIVerve\Hashgenerator\Exceptions\APIException;
use APIVerve\Hashgenerator\Exceptions\ValidationException;

try {
    $response = $client->execute(['text' => 'Hello World', 'algorithms' => 'all']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/hashgenerator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/hashgenerator?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/hashgenerator?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
