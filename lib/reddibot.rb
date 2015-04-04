require "./reddibot/version"
require './engine'
require './reddibot/commandify'
require 'redditkit'


module Reddibot
    

  
  def self.get_username
    'outrider_bot'
  end
  
  def self.get_password
    'AutobotsTransform123'
  end
  
  def self.get_commands
    %w(get_links)
  end
  
  
  def self.get_subscribes
    client = RedditKit::Client.new get_username, get_password
    subreddits = client.subscribed_subreddits
    return subreddits
  end
  
  
  def self.get_links( subreddit = 'rugbyunion' )
    p subreddit
    p "************"
    client = RedditKit::Client.new get_username, get_password
    links  = client.links( subreddit, { :category => 'hot', :limit => 100 } )
    return links
  end
  
  
end
