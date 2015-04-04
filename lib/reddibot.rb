require "./reddibot/version"
require './engine'
require 'redditkit'


module Reddibot
    

  
  def self.get_username
    'outrider_bot'
  end
  
  def self.get_password
    'AutobotsTransform123'
  end
  
  
  def self.get_subscribes
    client = RedditKit::Client.new get_username, get_password
    subreddits = client.subscribed_subreddits
    return subreddits
  end
  
  
end
