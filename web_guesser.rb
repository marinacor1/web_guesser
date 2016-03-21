require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
set :number, SECRET_NUMBER #defaults at initialize
set :message, ""
set :color_output, "#FFFFFF"

  def guess_check(guess)
    difference = (guess - settings.number)
    if difference >= 5
      message_assignment("Way too high!")
      color_selector("#FF0000") #red
    elsif difference < 5 && difference > 0
      message_assignment "Too high!"
      color_selector("FFCCCC") #light pink
    elsif difference <= -5
      message_assignment "Way too low!"
      color_selector("#FF0000") #red
    elsif difference < 0 && difference > -5
      message_assignment "Too low!"
      color_selector("FFCCCC") #light pink
    else
      message_assignment "You got it right!"
      color_selector("#009900") #green
    end
  end

  def message_assignment(message)
    settings.message = message
  end

  def color_selector(color_output)
    settings.color_output = color_output
  end

get '/' do #get me something from... get '/people' get'/posts'. post requests do a redirect(sends request to post, go into program and find corresponding file and redisplays to a get). get get something to display
  guess = params["guess"].to_i #takes in input. params is a hash. guess is a string turned into integer. 
  number = settings.number #is defined above and never changes
  guess_check(guess) #is run within runner and determines message and color
  erb :index, :locals => {:number => number, #erb :index renders erb file
                          :message => settings.message,
                          :color_output => settings.color_output}
end
