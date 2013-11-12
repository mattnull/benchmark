# Benchmarking Node

Yes, this is another post on benchmarking. It's in response to this [post](http://philsturgeon.co.uk/blog/2013/11/benchmarking-codswallop-nodejs-v-php). Read it. 

Essentially, we are testing whether "'doing multiple things at once' is faster than 'doing one thing at a time'". We are not testing whether one language is faster than another or the speed of the network. These tests are run locally using [Apache benchmark](http://httpd.apache.org/docs/2.2/programs/ab.html). Feel free to add your own tests and issue a PULL request. Thanks.

## Setup

Put simply, tests are broken into two categories - (1) ascynchronous (node) vs syncronous (all others) and (2) ascynchronous (node) vs ascynchronous (all others). 

To recreate this on your end - 
1. Clone the repo: `git clone https://github.com/mattnull/benchmark.git your_project_name`
2. Navigate to the directory: `cd your_project_name`
3. Install dependencies: `npm install`
4. Run `cake dev`
5. Install Apache Benchmark if you don't already have it

-------- divider ---- 

# Benchmark



## Dependencies
* 

## Development

The following command will watch and compile Coffeescript, Stylus, and Handlebars files. It also watches server.js for changes.

* run `cake dev`

## Deployment

* run `cake build`

## Languages
* Go - http://golang.org/
* Node.js - http://nodejs.org
