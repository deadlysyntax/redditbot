require 'trollop'

module Commandify

  
  def self.process
    sub_commands = Reddibot::command_list
    global_opts  = Trollop::options do
      banner "CLI for reddit bot tools"
      opt :dry_run, "Don't actually do anything", :short => "-n"
      stop_on sub_commands
    end

    command      = ARGV.shift
    command_opts = 
    case command
      
      when "get_links" 
        Trollop::options do
          opt :sub,      "Which subreddit",               :type    => String
          opt :category, "Which category of a subreddit", :type    => String, :default => 'hot'
          opt :limit,    "Limit",                         :default => 10
          opt :project,  "Write data to a file",          :type    => String, :default => ''
          opt :filename, "Write data to a file",          :type => String, :default => ''
        end
        
        
        
      #when "get_subscribes"
      
      
      
      when "get_comments_on_links"
         Trollop::options do
           opt :project,  "Write data to a file",     :type => String, :default => ''
           opt :filename, "Write data to a file",     :type => String, :default => ''
         end 
       
       
      when "get_link_by_name" 
        Trollop::options do
          opt :project,   "", :type => String, :default => '' 
          opt :filename,  "", :type => String, :default => '' 
          opt :linkname, "", :type => String, :default => '' 
        end
        
        
        
      else
        Trollop::die "Unknown subcommand #{command.inspect}"
      end

     return {
          :action  => command,
          :options => command_opts
      }
  end
  
  
end
