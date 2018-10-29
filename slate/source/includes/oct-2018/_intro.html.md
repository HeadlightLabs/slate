
# Introduction

Welcome to the Mars Mining Corporation's simulated Central Mining Service (CMS). You can use our simulated
service to test your implementation.

You'll connect to the simulation server through regular HTTP GET requests.

If you run into trouble, see the [Troubleshooting](#troubleshooting-faqs) section for some FAQs and info on how to get in touch with us.

Good luck!

# Your Task

Your task is to make a small web application that displays the location of bots and mining nodes on a grid.

Bots can move and mine nodes, so you'll have to keep making requests to keep up to date!

# Basic Information

The simuliation server simulates bots and mining nodes on a 100x100 grid. 

## About bots

<aside class="notice">
  You don't need to know this information in order to complete the application successfully - this is just for your own knowledge.
</aside>

* Bots are allowed to move around within the confines of the grid, 1 square at a time. 

* Bots can scan a 5x5 radius around them to find out more information about nodes.

* Bots can claim up to 3 nodes at a time, and can only mine 1 node at a time.

* Simulated bots start off at a random location, and move around the map in pre-determined ways. They may or may not actually mine nodes, depending
on the bot's algorithm.

## About mining nodes

<aside class="notice">
  You don't need to know this information in order to complete the application successfully - this is just for your own knowledge.
</aside>

* Nodes are stationary, and start off with some initial mineral count.

* As they're mined, that mineral count decreases.

* When a mining node hits 0 mineral count it continues to exist as a mining node with 0 minerals.