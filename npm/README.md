# Hash Generator API

Hash Generator is a tool for generating cryptographic hashes from text. It supports multiple algorithms including MD5, SHA-1, SHA-256, SHA-384, SHA-512, and BLAKE2 variants for data integrity and security applications.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Javascript Wrapper for the [Hash Generator API](https://apiverve.com/marketplace/hashgenerator)

---

## Installation

Using npm:
```shell
npm install @apiverve/hashgenerator
```

Using yarn:
```shell
yarn add @apiverve/hashgenerator
```

---

## Configuration

Before using the Hash Generator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart)

The Hash Generator API documentation is found here: [https://docs.apiverve.com/ref/hashgenerator](https://docs.apiverve.com/ref/hashgenerator).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const hashgeneratorAPI = require('@apiverve/hashgenerator');
const api = new hashgeneratorAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  text: "Hello World",
  algorithms: "sha256,md5"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  text: "Hello World",
  algorithms: "sha256,md5"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  text: "Hello World",
  algorithms: "sha256,md5"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2025 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
