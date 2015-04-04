#!/usr/bin/ruby
require './reddibot.rb'

#
#
engine = Engine.new
puts "Welcome to reddibot, what would you like to do?"
#
# Start your engines
#
#
user_input = gets
while user_input
  result = engine.run(user_input.gsub(/\n/, ""))
  p result if result
  user_input = gets
end
