# API Endpoints




## Register

> Registering your bot

```javascript
let data = {
  callsign: "VictorEchoNovember" // or whatever! Choose whatever you'd like
};

let cb = function(response) {
  console.log("See the JSON tab for a sample response: ", response);
}

sendPOSTRequest("/register", data, cb);
```

```python
  data = {'callsign': 'VictorEchoNovember'}
  r = send_post_request("/register", data)

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```

```json

// Response

{
  "Status": {
    "Claims": [],
    "Id": "VictorEchoNovember",
    "Location": {
      "X": 50,
      "Y": 50
    },
    "Score": 0
  },
  "Nodes": [],
  "Error" false,
  "ErrorMsg": ""
}
```

This endpoint registers you with the simulation service. 

<aside class="warning">
  None of the other endpoints will work unless you call `/register` first! You will need to call this every time the simulation restarts.
</aside>


### HTTP Request

`POST /register`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | false | String | The callsign you'd like to use. If you leave this blank, you'll be assigned a random callsign.










## Move

> Moving your bot

```javascript
let data = {
  callsign: "VictorEchoNovember",
  x: 51 + "",
  y: 51 + ""
};

let cb = function(response) {
  console.log("See the JSON tab for a sample response: ", response);
}

sendPOSTRequest("/move", data, cb);
```

```python
  data = {'callsign': 'VictorEchoNovember', 'x': str(51), 'y': str(51)}
  r = send_post_request("/move", data)

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```

```json
{
  "Status": {
    "Claims": [],
    "Id": "VictorEchoNovember",
    "Location": {
      "X": 51,
      "Y": 51
    },
    "Score": 0
  },
  "Nodes": [],
  "Error" false,
  "ErrorMsg": ""
}
```

This endpoint will update your location with the simulation server. You can move by 1 square in any direction. For example, if your location is (50,50), all of the following are valid moves:

  * `(49, 49)`
  * `(49, 50)`
  * `(49, 51)`
  * `(50, 49)`
  * `(50, 50)` (yes, you can move nowhere)
  * `(50, 51)`
  * `(51, 49)`
  * `(51, 50)`
  * `(51, 51)`

If you try to move to an invalid location (like `(1000,1000)`, or `(100,100)` in the above example), it will be ignored.

<aside class="notice">
  The grid is 100x100, so you won't be able to go above `100` or below `0` in either direction.
</aside>


### HTTP Request

`POST /move`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 
x | true | String | The x-coordinate of your new location
y | true | String | The y-coordinate of your new location

<aside class="notice">
  Notice the data types of the parameters x and y - they're strings, not integers. You also might notice that the response returns integers, even though the request only
  accepts strings. This is intentional behavior.
</aside>










## Scan

> Scanning for nodes around you

```javascript
let data = {
  callsign: "VictorEchoNovember"
};

let cb = function(response) {
  console.log("See the JSON tab for a sample response: ", response);
}

sendPOSTRequest("/scan", data, cb);
```

```python
  data = {'callsign': 'VictorEchoNovember'}
  r = send_post_request("/scan", data)

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```

```json
{
  "Status": {
    "Claims": [],
    "Id": "VictorEchoNovember",
    "Location": {
      "X": 50,
      "Y": 50
    },
    "Score": 0
  },
  "Nodes": [{
    "Id": "AlphaTango",
    "Location": {
      "X": 55,
      "Y": 55
    },
    "Value": 30,
    "Claimed": false
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

This will return information about any nodes in a 5x5 radius around your current location. 

<aside class="notice">
  If there are no nodes in your scan radius, the `nodes` property in the response will be blank.
</aside>

### HTTP Request

`POST /scan`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. If you leave this blank, your request will be ignored.










## Claim

> Claiming a node

```javascript
let data = {
  callsign: "VictorEchoNovember",
  node: "AlphaTango"
};

let cb = function(response) {
  console.log("See the JSON tab for a sample response: ", response);
}

sendPOSTRequest("/claim", data, cb);
```

```python
  data = {'callsign': 'VictorEchoNovember', 'node': 'AlphaTango'}
  r = send_post_request("/claim", data)

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```

```json
{
  "Status": {
    "Claims": ["AlphaTango"],
    "Id": "VictorEchoNovember",
    "Location": {
      "X": 50,
      "Y": 50
    },
    "Score": 0
  },
  "Nodes": [{
    "Id": "AlphaTango",
    "Location": {
      "X": 55,
      "Y": 55
    },
    "Value": 30,
    "Claimed": true,
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

You can put a claim on any node you're within scan range of. Find nodes through the [scan](#scan) endpoint.

### HTTP Request

`POST /claim`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 









## Release

> Releasing a node

```javascript
let data = {
  callsign: "VictorEchoNovember",
  node: "AlphaTango"
};

let cb = function(response) {
  console.log("See the JSON tab for a sample response: ", response);
}

sendPOSTRequest("/release", data, cb);
```

```python
  data = {'callsign': 'VictorEchoNovember', 'node': 'AlphaTango'}
  r = send_post_request("/release", data)

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```


```json

{
  "Status": {
    "Claims": [],
    "Id": "VictorEchoNovember",
    "Location": {
      "X": 50,
      "Y": 50
    },
    "Score": 30
  },
  "Nodes": [{
    "Id": "AlphaTango",
    "Location": {
      "X": 55,
      "Y": 55
    },
    "Value": 0,
    "Claimed": false
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

You can release a claim on a node you own, to free up space for more claims. Typically you would do this once you have mined a node entirely.

### HTTP Request

`POST /release`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 
node | true | String | The node you'd like to release. 










## Mine
> Mining a node

```javascript
let data = {
  callsign: "VictorEchoNovember",
  node: "AlphaTango"
};

let cb = function(response) {
  console.log("See the JSON tab for a sample response: ", response);
}

sendPOSTRequest("/mine", data, cb);
```

```python
  data = {'callsign': 'VictorEchoNovember', 'node': 'AlphaTango'}
  r = send_post_request("/mine", data)

  # Print the response
  print("See the JSON tab for a sample response: " + r.text)
```


```json
{
  "Status": {
    "Claims": ["AlphaTango"],
    "Id": "VictorEchoNovember",
    "Location": {
      "X": 50,
      "Y": 50
    },
    "Score": 1
  },
  "Nodes": [{
    "Id": "AlphaTango",
    "Location": {
      "X": 55,
      "Y": 55
    },
    "Value": 29,
    "Claimed": true
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

You can choose to mine a node you have a claim on. This will increase your resource score by 1, and also decrease the value of the node by 1.

### HTTP Request

`POST /mine`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 
node | true | String | The node you'd like to mine.
