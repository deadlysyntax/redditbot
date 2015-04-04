class Engine
  
  
  def initialize
    @commands = Commandify::process
  end
  
  
  def run
    p @commands

    case @commands['action']
    when 'get_links'
      p Reddibot::get_links( @commands['options'].sub )
    end
    
  end
  
  
  
end