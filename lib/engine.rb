class Engine
  
  attr_reader :client
  
  def initialize
    @commands = Commandify::process
  end
  
  
  def run
    
    if Reddibot::command_list.include? @commands[:action]
      
      Reddibot.send( @commands[:action], @commands[:options] )

    else
      p "Command #{@commands[:action]} not available"
    end
  end
  
  
  
end