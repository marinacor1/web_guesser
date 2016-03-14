require 'sinatra'
require 'sinatra/reloader'

  random = rand(101)

get '/' do
  erb :index
end
