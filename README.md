# Hashtagged

[![Coverage Status](https://coveralls.io/repos/JamesChevalier/hashtagged/badge.png)](https://coveralls.io/r/JamesChevalier/hashtagged)
[![Build Status](https://travis-ci.org/JamesChevalier/hashtagged.png?branch=master)](https://travis-ci.org/JamesChevalier/hashtagged)
[![Code Climate](https://codeclimate.com/github/JamesChevalier/hashtagged.png)](https://codeclimate.com/github/JamesChevalier/hashtagged)

Hashtagged accepts a Twitter user name, and gives back a word cloud of that user's recent hashtags. You can use it at [http://hashtagged.herokuapp.com](http://hashtagged.herokuapp.com), or you can set it up yourself with the instructions below.

## Running Locally

Create a new Twitter application at [https://dev.twitter.com/apps/new](https://dev.twitter.com/apps/new). Make sure you generate your app's access token at the bottom of the **Details** page.

Create a `.env` file in the root directory with the following contents from your new Twitter app:

    TWITTER_CONSUMER_KEY=your_consumer_key
    TWITTER_CONSUMER_SECRET=your_consumer_secret
    TWITTER_ACCESS_TOKEN=your_access_token
    TWITTER_ACCESS_TOKEN_SECRET=your_token_secret

Run `foreman start` to start Hashtagged, and visit [http://127.0.0.1:5000]([http://127.0.0.1:5000]) to use it.

## Deploying To Heroku

You can read [Getting Started with Heroku](https://devcenter.heroku.com/articles/quickstart), and [Getting Started with Ruby on Heroku](https://devcenter.heroku.com/articles/getting-started-with-ruby) if you haven't done this before.

Set your Twitter configuration before deploying to Heroku:

    heroku config:set TWITTER_CONSUMER_KEY=your_consumer_key
    heroku config:set TWITTER_CONSUMER_SECRET=your_consumer_secret
    heroku config:set TWITTER_ACCESS_TOKEN=your_access_token
    heroku config:set TWITTER_ACCESS_TOKEN_SECRET=your_token_secret

## General Information

* [Foundation](http://foundation.zurb.com)
* [jqcloud](https://github.com/lucaong/jQCloud)
* MiniTest::Spec
* Ruby 2.0.0-p353
* Sinatra
