require 'sinatra'
require 'sinatra/reloader'
require 'bootstrap'
require 'hamlit'
require 'sass'

set :bind, '0.0.0.0'
set :environment, :production

configure :production do
  enable :reloader
end

get '/' do
  haml :index
end
