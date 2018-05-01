require 'sinatra'
require 'sinatra/reloader'

set :bind, '0.0.0.0'
set :environment, :production

configure :production do
  enable :reloader
end

get '/' do
  'Put this in your pipe & smoke it!'
end
