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

All endpoints have a basic authorization scheme that depends on a simple API key that's available through the URL.

For example, if your workspace URL is `/assess/abcdefg`, your API key would be `abcdefg`.

# Endpoints

## Perform a lookup

```javascript

const url = "https://www.headlightlabs.com/api/gcpd_lookup";
var xhr = new XMLHttpRequest();
xhr.setRequestHeader('Content-Type', 'multipart/form-data')
xhr.send(params)
```

> The above command returns JSON structured like this:

```json
{ 
  "location": "https://www.myimagelocation.com/myimage.png",
  "closest_match": "Platypus Person",
  "percent_match": "100.0"
}
```

This endpoint accepts form data and returns information about the upload photo.

### HTTP Request

`POST https://www.headlightlabs.com/api/gcpd_lookup`

### POST Parameters

Parameter | Required? | Type | Description
--------- | ------- | ------- | -----------
api_key | true | String | The API key provided to you (see Authentication above)
image | true | multipart-formdata | The image data you want to analyze

## User Report

```javascript
const url = "https://www.headlightlabs.com/api/gcpd_report";
var xhr = new XMLHttpRequest();
xhr.setRequestHeader('Content-Type', 'multipart/form-data')
xhr.send(params)
```

> The above command returns JSON structured like this:

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
image | true | multipart-formdata | The image data to report
