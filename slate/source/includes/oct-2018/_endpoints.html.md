# API Endpoints




## Bots

> Fetch all bots

```javascript
  let cb = function(response) {
    console.log("See the JSON tab for a sample response: ", response);
  }

  sendGETRequest("/bots", cb);
```

```python
  r = send_get_request("/bots")

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```

```json

// Response

{
  "Bots": [
    {
      "Id": "VictorEchoNovember", // The bot's unique callsign
      "Location": {
        "X": 50, // The bot's x-coordinate
        "Y": 55 // The bot's y-coordinate
      },
      "Claims": ["AlphaTango", "BetaSierra"] // Any mining nodes this bot has claims on
    },
    {
      ... // Another bot's information
    }
  ]
}
```

This endpoint fetches all bots the simulation server knows about, and returns you information about them. 


### HTTP Request

`GET /bots`



## Nodes

> Fetch all nodes

```javascript
  let cb = function(response) {
    console.log("See the JSON tab for a sample response: ", response);
  }

  sendGETRequest("/nodes", cb);
```

```python
  r = send_get_request("/nodes")

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```

```json

{
  "Nodes": [
    {
      "Id": "AlphaTango", // The node's unique identifier
      "Location": {
        "X": 53, // The node's X coordinate
        "Y": 54 // The node's Y coordinate
      },
      "Value": 20, // The node's remaining mineral value
      "ClaimedBy": "VictorEchoNovember" // Who has claimed the node, if anyone
    },
    {
      ... // Another node's information would go here
    }
  ],
}

```

This endpoint fetches all nodes the simulation server knows about, and returns you information about them. 


### HTTP Request

`GET /nodes`
