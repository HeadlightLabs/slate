
# Introduction

Welcome to the Mars Mining Corporation's simulated Central Mining Service (CMS). You can use our simulated
service to test your mining algorithm.

You'll connect to the simulation server through regular HTTP POST requests.

If you run into trouble, see the [Troubleshooting](#troubleshooting-faqs) section for some FAQs and info on how to get in touch with us.

Good luck!

# Actions

You can take the following actions with your bot. Read each endpoint for more information.

## Registering

* [Register](#register):  This registers you and gives you a starting location.

<aside class="warning">
  Always call register first! Nothing else will work until you register.
</aside>

## Exploring

* [Move](#move): You can move 1 square per `move` call.

* [Scan](#scan): This will return information about any nodes in a 5x5 radius around you

## Mining

* [Claim](#claim): You can put a claim on any node you're within scan range of. 

* [Release](#release): You can release a claim on a node you own, to free up space for more claims.

* [Mine](#mine): You can choose to mine a node you have a claim on. 