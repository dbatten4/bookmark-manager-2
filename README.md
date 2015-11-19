# Bookmark Manager

This is my second attempt at this challenge

The specification of this challenge is to build a bookmark manager, similar to pineapple.io or delicious.com in spirit. The idea of this challenge is to explore how relational databases work.

A bookmark manager is a website to maintain a collection of links, organised by tags. You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse links other users have added.

The website will have the following functionality:

Show a list of links from the database
Add new links
Add tags to the links
Filter links by a tag

This project is writted in ruby with the Sinatra framwork, using the Capybara testing framework. 

## Getting started

`git clone https://github.com/dbatten4/bookmark-manager-2.git`
After running `gem install bundle` to install the bundle gem, run
`bundle`
to install the gems. 

## Usage

Run
`rackup`
to start the server and navigate to 
`http://localhost:9292/`


## Running tests

Run
`rspec`
to run the tests
