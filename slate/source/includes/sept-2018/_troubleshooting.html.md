
# Troubleshooting/FAQs

## Contacting Us

There are a few ways to contact us:

1. Use Drift (blue icon in the lower right corner of Headlightlabs.com)
2. E-mail us at: team@headlightlabs.com

We'll try to be as responsive as possible, but can't guarantee anything - we're people too! If you're doing the challenge at 4 AM EST, we're probably asleep.

If you get stuck, we recommend you stub out the API response using a sample response and moving on. 

If your submission ends up using the stubbed response as a result of an error on our part, we won't count it against you! We'll give you an opportunity to submit a patch for the final event.

## General FAQs

### Why did you only provide a sample implementation in JavaScript/Python and not (insert language here)?

Mostly just time. We figure that JavaScript and Python are popular enough and readable enough that most people should be able to understand what's going on even if they're not super familiar with either of those languages.

Also note that you'll get extra points for not using the sample code as a starter point.

### How can I test this out against someone else? It's just me on the server!

We'll always be running a bot we wrote on each server, so you'll never be totally alone on a simulation.

You can also run multiple instances of your bot and have it compete against itself!

## The Tournament Server

### How do I connect to the simulation servers?

You can run it locally if you'd like, or you can connect to any of the following servers we've setup:

* headlight-tournament-1.herokuapp.com
* headlight-tournament-2.herokuapp.com
* headlight-tournament-3.herokuapp.com
* headlight-tournament-4.herokuapp.com
* headlight-tournament-5.herokuapp.com

<br />


### The servers just shut down randomly! What gives?

We restart the servers every 15 minutes to give everyone a fresh start.

Just reconnect! The restart process only takes a few seconds at most.

<br />


### I can't seem to find any nodes with any value 

You might just be on a populated server. Try a different server, or try running it locally.

<br />

### How do I run it/install it locally?

It's a Go program, so you can run it by cloning the server repo somewhere along your gopath.

You can also just run the following command and it should appear in the right place:
`go get github.com/Headlightlabs/Tournament-API`

and then go to the directory:
`cd $GOPATH/github.com/Headlightlabs/Tournament-API`

and run it: 
`./run.sh`

If you don't have Go installed, [follow the instructions here](https://golang.org/dl/).

**However, if you didn't install Go before you started the challenge I would highly recommend just using our test servers. You'll spend precious time getting it setup!**

<br />


### It just crashes when I start it up locally

Take a look at the `run.sh` script to make sure those steps are all succeeding. If that's still not working, get in contact with us.

<br />


## The API

### None of the commands work, I keep getting an error about an unregistered bot

You didn't register your bot. See the [Registration](#register) command above.

<br />


### I tried to claim a node but it didn't work!

Someone else probably claimed that node! You'll get a message in the response under the `ErrorMsg` key that says something like `already_claimed_node`. 

You can try again later to see if it's been released.

<br />


### The Move endpoint isn't working! I keep getting an error that says something like "Error msg: json: invalid use of ,string..."

The Move endpoint takes coordinates as strings, *not* integers. This is intentional (doesn't every API have some funny business like this?). Convert your coordinates to strings, like the sample code!

<br />
