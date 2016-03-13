require 'sinatra'
  random = rand(101)

get '/' do
  "The secret number is #{random}."
end
