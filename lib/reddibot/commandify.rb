require 'trollop'

module Commandify

  
  def self.process
    sub_commands = Reddibot::get_commands
    global_opts  = Trollop::options do
      banner "CLI for reddit bot tools"
      opt :dry_run, "Don't actually do anything", :short => "-n"
      stop_on sub_commands
    end

    command      = ARGV.shift
    command_opts = case command
      when "get_links" 
        Trollop::options do
          opt :sub, "Which subreddit", :type => String
        end
      else
        Trollop::die "unknown subcommand #{command.inspect}"
      end

     return {
          'action'  => command,
          'options' => command_opts
      }
  end
  
  
end
