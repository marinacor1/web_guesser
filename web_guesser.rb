require 'sinatra'
require 'sinatra/reloader'

  number = rand(101)

get '/' do
  guess = params["guess"].to_i
  if guess > number
    message = "Too high!"
  end
    erb :index, :locals => {:number => number,
                            :message => message }
end
