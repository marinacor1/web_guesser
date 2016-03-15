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
      color_selector("#FF0000")
    elsif difference < 5 && difference > 0
      message_assignment "Too high!"
      color_selector("#FF00FF")
    elsif difference <= -5
      message_assignment "Way too low!"
      color_selector("#FF0000")
    elsif difference < 0 && difference > -5
      message_assignment "Too low!"
      color_selector("#FF00FF")
    else
      message_assignment "You got it right!"
      color_selector("#00FF00")
    end
  end

  def message_assignment(message)
    settings.message = message
  end

  def color_selector(color_output)
    settings.color_output = color_output
  end

get '/' do
  guess = params["guess"].to_i #takes in input
  number = settings.number #is defined above and never changes
  guess_check(guess) #is run within runner and determines message and color
  erb :index, :locals => {:number => number,
                          :message => settings.message,
                          :color_output => settings.color_output}
end
