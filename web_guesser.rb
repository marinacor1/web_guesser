require 'sinatra'
require 'sinatra/reloader'

  random = rand(101)

get '/' do
  "THE SECRET NUMBER IS #{random}."
end
