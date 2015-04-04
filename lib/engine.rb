class Engine
  
  
  def initialize
    
    
  end
  
  
  def run( user_input )
    p 'You entered: ' + user_input
    
    
    case user_input
    when 'get subscribes'
      return Reddibot::get_subscribes
    end
    
  end
  
  
  
end