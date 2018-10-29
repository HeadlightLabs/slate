
# API Information

## Connecting to the API

The status server only accepts `GET` requests. See below for examples on how to send request to the API.

You can connect to one of our shared simulation status servers here (just pick one):

* headlight-tournament-1.herokuapp.com 
* headlight-tournament-2.herokuapp.com 
* headlight-tournament-3.herokuapp.com 
* headlight-tournament-4.herokuapp.com
* headlight-tournament-5.herokuapp.com

If you need to know the port for any reason, the port is 80.

<aside class="notice">
  The shared simulation servers will reset every 15 minutes. Resets will only take a second.

  This means bots and nodes will appear to jump suddenly every 15 minutes!
</aside>

<aside class="warning">
  Please limit your requests to once every 100ms. Nothing will change any more frequently than that.
  We understand that accidents happen, but please don't bring down our servers.  
  We reserve the right to rate-limit if you exceed that, but we would prefer not to!
</aside>

## Making a request

> Sample HTTP GET request implementation

```javascript

// Sends a GET request to a specific endpoint
function sendGETRequest(path, data, callback) {

  const options = {
    hostname: 'https://headlight-tournament-3.herokuapp.com',
    port: 80,
    path: path,
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    }
  };

  let response = [];

  req = http.request(options, (res) => {
    res.on('data', (chunk) => { response.push(chunk); });
    res.on('end', () => { 
      let finalResponse = JSON.parse(response.join(''));
      callback(finalResponse); 
    });
  });

  req.write(JSON.stringify(data));
  req.end();
}

// Sample request

let cb = function(response) {
  console.log("Here are all the bots: ", response);
}

sendGETRequest("/bots", cb);
```

```python
import requests
import json

def send_get_request(path):
    """
        Sends a GET request using the requests library to a specific endpoint.
    """
    endpoint = "https://headlight-tournament-3.herokuapp.com" + path
    return requests.get(url = endpoint)


# Sample Request
r = send_get_request("/bots")

# Print the response
print("Here are all the bots: " + r.text)
```

```json
  See another tab for a sample implementation.
```

You should make `GET` requests to the API server. You'll receive a `JSON` response.

That'll look different for different languages, but generally it should look like the examples to the right.


## What about CORS?

Don't worry! We've set everything up properly, so you'll be able to make cross-domain requests without having to do anything special.