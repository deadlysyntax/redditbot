require "./reddibot/version"
require './engine'
require './reddibot/commandify'
require 'redditkit'
require 'trollop'
require 'yaml'
require 'mechanize'


module Reddibot
    
  @client = RedditKit::Client.new 'outrider_bot', 'AutobotsTransform123'

  
  
  def self.command_list
    %w(get_links get_subscribes get_comments_on_links)
  end
  
  
  
  
  ############################
  # Public Interface
  ############################
  
  
  #
  def self.get_subscribes options
    @client.subscribed_subreddits
  end
  
  
  #
  def self.get_links options 
    links = @client.links( options[:sub], { :category => options[:category], :limit => options[:limit] } )
    write_data( options[:filename], links, 'links' ) unless options[:filename] == ''
  end
  
  
  # Expects a link object or link id
  def self.get_link_comments link, limit = 100
    comments = @client.comments( link, :limit => limit )
    write_data( link.attributes[:id], comments, 'comments' )
  end

  
  #
  def self.get_comments_on_links options
    links = read_data( options[:filename], 'links' ).results
    links.each do |link|
      get_link_comments( link )
    end 
  end
  
  

  
  
  
  
  #
  #
  #
  #
  def self.write_data filename, data, format
    File.open( 'data/' + format + '/' + filename + '.' + format, 'w') { |file| 
      file.write( YAML::dump(data) ) 
    }
  end
  
  def self.read_data filename, format
     YAML::load( File.read('data/'+format+'/'+filename+'.'+format) )
  end
  
end
