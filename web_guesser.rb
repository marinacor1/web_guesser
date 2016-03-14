require 'sinatra'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(101)

  def guess_check(guess, number)
    difference = (guess - number)
    if difference >= 5
      message = "Way too high!"
    elsif difference < 5 && difference > 0
      message = "Too high!"
    elsif difference <= -5
      message = "Way too low!"
    elsif difference < 0 && difference > -5
      message = "Too low!"
    else
      message = "You got it right!"
    end
    message
  end

get '/' do
  guess = params["guess"].to_i
  number = SECRET_NUMBER
  message = guess_check(guess, number)
    erb :index, :locals => {:number => number,
                            :message => message }
end
