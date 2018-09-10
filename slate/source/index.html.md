---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to the Mars Mining Corporation's simulated Central Mining Service (CMS). You can use our simulated
service to test your mining algorithm.

You'll connect to the simulation server through regular HTTP POST requests. 

Request formats are mostly the same, but pay attention to what each endpoint requires.

Response formats are all the same:

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


# Connecting to the API

The simulation server only accepts POST requests with a JSON payload. All other HTTP methods and data payloads will fail. See below for examples on how to send request to the API.

You can connect to our shared simulation server here (just pick one):

* headlight-tournament-1.herokuapp.com
* headlight-tournament-2.herokuapp.com
* headlight-tournament-3.herokuapp.com
* headlight-tournament-4.herokuapp.com
* headlight-tournament-5.herokuapp.com

Or you can download the simulation server and run it yourself here:



# Contacting Us

There are a few ways to contact us:

1) Use drift (blue icon in the lower right corner)

2) E-mail us at: team@headlightlabs.com

We'll try to be as responsive as possible, but can't guarantee anything - we're people too! If you're doing the challenge at 4AM, don't be surprised when no one responds quickly.

If you get stuck, we recommend you stub out the API response using a sample response and moving on. 

If your submission ends up using the stubbed response as a result of an error on our part, we won't count it against you! We'll give you an opportunity to submit a patch for the final event.



# General flow

You can take the following actions. Read each endpoint for more information.

* Register: Always call this first! This registers you and gives you a starting location.

* Move: You can move 1 square per `move` call.

* Scan: This will return information about any nodes in a 5x5 radius around you

* Claim: You can put a claim on any node you're within scan range of. 

* Release: You can release a claim on a node you own, to free up space for more claims.

* Mine: You can choose to mine a node you have a claim on. 




# General API Information

You should make POST requests to the API server with a JSON payload. That'll look different for different languages, but generally it should look like:

```javascript

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





# Endpoints






## Register

This endpoint registers you with the simulation service. *You must call this before calling anything else*.

You will need to call this every time the simulation restarts.

```javascript
let data = {
  callsign: "VictorEchoNovember"
};

let cb = function(response) {
  console.log("Here is my response: ", response);
}

sendPOSTRequest("/register", data, cb);

```

> Sample Response

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
  "Nodes": [],
  "Error" false,
  "ErrorMsg": ""
}
```

### HTTP Request

`POST /register`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | false | String | The callsign you'd like to use. If you leave this blank, you'll be assigned a random callsign.








## Move

This endpoint will update your location with the simulation server. You can move by 1 square in any direction. For example, if your location is (50,50), all of the following are valid moves:

  * `(49, 49)`
  * `(49, 50)`
  * `(49, 51)`
  * `(50, 49)`
  * `(50, 50)`
  * `(50, 51)`
  * `(51, 49)`
  * `(51, 50)`
  * `(51, 51)`

If you try to move to an invalid location (like `(100,100)` in the above example), it will be ignored.

```javascript
let data = {
  callsign: "VictorEchoNovember",
  x: "51",
  y: "51"
};

let cb = function(response) {
  console.log("Here is my response: ", response);
}

sendPOSTRequest("/move", data, cb);

```

> Sample Response

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

### HTTP Request

`POST /move`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 
x | true | String | The x-coordinate of your new location
y | true | String | The y-coordinate of your new location










## Scan

This will return information about any nodes in a 5x5 radius around your current location. If there are no nodes in your scan radius, the `nodes` property in the response will be blank.


```javascript
let data = {
  callsign: "VictorEchoNovember"
};

let cb = function(response) {
  console.log("Here is my response: ", response);
}

sendPOSTRequest("/scan", data, cb);

```

> Sample Response

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
    "Value": 30
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

### HTTP Request

`POST /scan`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. If you leave this blank, your request will be ignored.









## Claim

You can put a claim on any node you're within scan range of. Find nodes through the `scan` endpoint.


```javascript
let data = {
  callsign: "VictorEchoNovember",
  node: "AlphaTango"
};

let cb = function(response) {
  console.log("Here is my response: ", response);
}

sendPOSTRequest("/claim", data, cb);

```

> Sample Response

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
    "Value": 30
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

### HTTP Request

`POST /claim`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 








## Release

You can release a claim on a node you own, to free up space for more claims. Typically you would do this once you have mined a node entirely.

```javascript
let data = {
  callsign: "VictorEchoNovember",
  node: "AlphaTango"
};

let cb = function(response) {
  console.log("Here is my response: ", response);
}

sendPOSTRequest("/release", data, cb);

```

> Sample Response

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
    "Value": 0
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

### HTTP Request

`POST /release`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 
node | true | String | The node you'd like to release. 










## Mine

You can choose to mine a node you have a claim on. This will increase your resource score by 1, and also decrease the value of the node by 1.


```javascript
let data = {
  callsign: "VictorEchoNovember",
  node: "AlphaTango"
};

let cb = function(response) {
  console.log("Here is my response: ", response);
}

sendPOSTRequest("/mine", data, cb);

```

> Sample Response

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
    "Value": 29
  }],
  "Error" false,
  "ErrorMsg": ""
}
```

### HTTP Request

`POST /mine`

### Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
callsign | true | String | Your callsign. 
node | true | String | The node you'd like to mine.


# Troubleshooting/FAQs

## The Tournament Server

### How do I connect to the simulation servers?

You can run it locally if you'd like, or you can connect to any of the following servers we've setup:

* headlight-tournament-1.herokuapp.com
* headlight-tournament-2.herokuapp.com
* headlight-tournament-3.herokuapp.com
* headlight-tournament-4.herokuapp.com
* headlight-tournament-5.herokuapp.com

### It just shut down randomly! What gives?

We restart the servers every 15 minutes to make sure that you don't get put on a map with tapped out nodes.

Just reconnect! The restart process only takes a few seconds.

### I can't seem to find any nodes with any value 

You might just be on a populated server. Try another one, or try running it locally.

### How do I run it/install it locally?

It's a golang program, so you can run it by cloning the server repo somewhere along your gopath.

You can also just run the following command and it should appear in the right place:
`go get github.com/Headlightlabs/Tournament-API`

and then go to the directory:
`cd $GOPATH/github.com/Headlightlabs/Tournament-API`

and build it and run it: 
`./run.sh`

If you don't have golang installed, follow the instructions here: https://golang.org/dl/

**However, if you didn't install it before you started the challenge I would highly recommend just using our test servers. You'll spend a lot of time getting it setup!**

### It just crashes when I start it up locally

Take a look at the `run.sh` script to make sure those steps are all succeeding. If that's still not working, get in contact with us.

## The API

### None of the commands work, I keep getting an error about an unregistered bot

You didn't register your bot. See the `registration` command above.

### I tried to claim a node but it didn't work!

Someone else probably claimed that node! You'll get a message in the response under the `ErrorMsg` key that says something like `already_claimed_node`. 

You can try again later to see if it's been released.

### The Move endpoint isn't working! I keep getting an error that says something like "Error msg: json: invalid use of ,string..."

The Move endpoint takes coordinates as strings, *not* integers. This is intentional. Convert your coordinates to strings, like the sample code!