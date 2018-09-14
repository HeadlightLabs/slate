
# API Information

## Connecting to the API

The simulation server only accepts `POST` requests with a `JSON` payload. All other HTTP methods and data payloads will fail. See below for examples on how to send request to the API.

You can connect to our shared simulation server here (just pick one):

* headlight-tournament-1.herokuapp.com
* headlight-tournament-2.herokuapp.com
* headlight-tournament-3.herokuapp.com
* headlight-tournament-4.herokuapp.com
* headlight-tournament-5.herokuapp.com

Or you can [download the simulation server and run it yourself here](https://github.com/HeadlightLabs/Tournament-API). Take a look at the README for instructions on how to install it.

<aside class="notice">
  The shared simulation servers will reset every 15 minutes to let people have a chance on a fresh simulation. After the restart (which will only take a second),
  you will need to re-register in order to continue.
</aside>

<aside class="warning">
  Please limit your requests to once every 100ms (10 a second). We understand that accidents happen, but please don't bring down the simulation servers.  We reserve the right to rate-limit if you exceed that, but we would prefer not to!
</aside>

## Making a request

> Sample HTTP POST request implementation

```javascript

// Sends a POST request to a specific endpoint
function SendPOSTRequest(path, data, callback) {

  const options = {
    hostname: 'localhost',
    port: 5000,
    path: path,
    method: 'POST',
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

  req.write(JSON.Stringify(data));
  req.end();
}

// Sample request

let data = {
  callsign: "VictorEchoNovember"
};

let cb = function(response) {
  console.log("Here is my response: ", response);
}

sendPOSTRequest("/register", data, cb);
```

```python
import requests
import json

def send_post_request(path, data):
    """
        Sends a POST request using the requests library to a specific endpoint.
    """
    endpoint = "http://localhost:5000" + path
    data = json.dumps(data)
    return requests.post(url = endpoint, data = data)


# Register the bot
data = {'callsign': 'VictorEchoNovember'}
r = send_post_request("/register", data)

# Print the response
print("Here is my response: " + r.text)
```

```json
  See another tab for a sample implementation.
```

You should make `POST` requests to the API server with a `JSON` payload. 

That'll look different for different languages, but generally it should look like the examples to the right.

## Response Format

> Response Format and Types

```javascript
  See the JSON tab.
```

```python
  See the JSON tab.
```

```json
{
  "Status": {
    "Id": string,
    "Location": {
      "X": int,
      "Y": int
    }
  },
  "Nodes": [{
    "Id": string,
    "Location": {
      "X": int,
      "Y": int
    }
  }],
  "Error": bool,
  "ErrorMsg": string
}
```

All responses will share the same format. See the JSON tab for more information.