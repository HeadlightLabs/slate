---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to the Wayne Corporation API! You can use our API to access Wayne Corporation endpoints.

# Authentication

All endpoints have a very simple authorization scheme that depends on a simple API key that's available through the URL.

For example, if your workspace URL is `/assess/gGQhTbt_O9wD2lFxRdbzPw`, your API key would be `gGQhTbt_O9wD2lFxRdbzPw`.

# Contacting Us

There are a few ways to contact us:

1) Use drift (blue icon in the lower right corner)

2) E-mail us at: team@headlightlabs.com

We'll try to be as responsive as possible, but can't guarantee anything.

If you get stuck, we recommend you stub out the API response using the sample responses below and moving on. 

If your submission ends up using the stubbed response as a result of an error on our part, we won't count it against you!

# Endpoints

## Perform a lookup

```javascript

const url = "https://www.headlightlabs.com/api/gcpd_lookup";
const api_key = "gGQhTbt_O9wD2lFxRdbzPw";

// Using form data

var myFileInput = ...; // TODO: Implement!

var formData = new FormData();
formData.append("api_key", api_key);
formData.append("image", myFileInput);

var request = new XMLHttpRequest();
request.open("POST", url);
request.send(formData);


// Using base64-encoded data

var myBase64EncodedImageData = ...; // TODO: Implement!

var formData = new FormData();
formData.append("api_key", api_key);
formData.append("image_contents", myBase64EncodedImageData));

var request = new XMLHttpRequest();
request.open("POST", url);
request.send(formData);

```

> Sample Response

```json
{
  "location":"https://headlight.s3.amazonaws.com/gGQhTbt_O9wD2lFxRdbzPw/elKtOo6L4EXKkkp2NmVXVw",
  "closest_match":"Agitator Aligator",
  "percent_match":53
}
```

This endpoint accepts either file input data or base64 image data and returns information about the upload photo.

### Sending image data

You can either send image data up as multipart/form-data or as a base64-encoded string.

If you'd like to send up file input data, use the `image` key. If you'd like to send up the image as a base64-encoded string, use the `image_contents` key.

### HTTP Request

`POST https://www.headlightlabs.com/api/gcpd_lookup`

### POST Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
api_key | true | String | The API key provided to you (see Authentication above)
image | true (if `image_contents` isn't provided) | multipart/form-data | The image data you want to analyze
image_contents | true (if `image` isn't provided) | String | The image data, encoded as a base64 string, you want to analyze

## User Report

```javascript
const url = "https://www.headlightlabs.com/api/gcpd_report";
var xhr = new XMLHttpRequest();
xhr.setRequestHeader('Content-Type', 'multipart/form-data')
xhr.send(params)
```

> The above command returns the same JSON response every time:

```json
{
  "status": "Thank you for your report!"
}
```

This endpoint allows a particular photo to be reported as a match.

### HTTP Request

`POST https://www.headlightlabs.com/api/gcpd_report`

### POST Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
api_key | true | String | The API key provided to you (see Authentication above)
image | true (if `image_contents` isn't provided) | multipart/form-data | The image data you want to report
image_contents | true (if `image` isn't provided) | String | The image data, encoded as a base64 string, you want to report
