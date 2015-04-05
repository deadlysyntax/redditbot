require "./reddibot/version"
require './engine'
require './reddibot/commandify'
require 'redditkit'
require 'trollop'
require 'yaml'
require 'mechanize'
require 'fileutils'


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
    write_data( options[:project], options[:filename], links, 'links' ) unless options[:project] == ''
  end
  
  
  # Expects a link object or link id
  def self.get_link_comments link, limit = 100
    comments = @client.comments( link, :limit => limit )
  end

  
  #
  def self.get_comments_on_links options
    links = read_data( options[:project], options[:filename], 'links' ).results
    #p links
    links.each do |link|
      comments = get_link_comments( link )
      write_data( options[:project], link.attributes[:id], comments, 'comments' )
    end 
  end
  


  
  
  
  
  #
  #
  #
  #
  def self.write_data project, filename, data, format
    
    dirname = File.dirname(__FILE__) + "/data/#{project}/#{format}/"

    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end
    
    File.open( dirname + '/' + filename + '.data', 'w+') { |file| 
      file.write( YAML::dump(data) ) 
    }
  end
  
  
  
  def self.read_data project, filename, format
     YAML::load( File.read( File.dirname(__FILE__) + "/data/#{project}/#{format}/#{filename}.data") )
  end
  
end
