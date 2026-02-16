Hash Generator API
============

Hash Generator is a tool for generating cryptographic hashes from text. It supports multiple algorithms including MD5, SHA-1, SHA-256, SHA-384, SHA-512, and BLAKE2 variants for data integrity and security applications.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Hash Generator API](https://apiverve.com/marketplace/hashgenerator?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-hashgenerator
```

Using `pip3`:

```bash
pip3 install apiverve-hashgenerator
```

---

## Configuration

Before using the hashgenerator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_hashgenerator.apiClient import HashgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = HashgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "text": "Hello World",
    "algorithms": "all"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Hash Generator API documentation is found here: [https://docs.apiverve.com/ref/hashgenerator](https://docs.apiverve.com/ref/hashgenerator?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_hashgenerator.apiClient import HashgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = HashgeneratorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "text": "Hello World",
    "algorithms": "all"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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
    ],
    "available_algorithms": [
      "md5",
      "sha1",
      "sha256",
      "sha384",
      "sha512",
      "blake2b512",
      "blake2s256"
    ]
  }
}
```

---

## Error Handling

The API client provides comprehensive error handling through the `HashgeneratorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_hashgenerator.apiClient import HashgeneratorAPIClient, HashgeneratorAPIClientError

api = HashgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "text": "Hello World",
    "algorithms": "all"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except HashgeneratorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_hashgenerator.apiClient import HashgeneratorAPIClient, HashgeneratorAPIClientError

api = HashgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "text": "Hello World",
    "algorithms": "all"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except HashgeneratorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_hashgenerator.apiClient import HashgeneratorAPIClient, HashgeneratorAPIClientError

query = {
    "text": "Hello World",
    "algorithms": "all"
}

# Using context manager ensures proper cleanup
with HashgeneratorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except HashgeneratorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_hashgenerator.apiClient import HashgeneratorAPIClient

# Enable debug mode
api = HashgeneratorAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "text": "Hello World",
    "algorithms": "all"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_hashgenerator.apiClient import HashgeneratorAPIClient

api = HashgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "text": "Hello World",
    "algorithms": "all"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
