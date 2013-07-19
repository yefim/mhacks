require 'sinatra'
require 'json'
require 'redis'

configure do
  REDIS = Redis.new
end

get '/' do
  erb :index
end

post '/register' do
  p params[:email]

  REDIS.lpush 'emails', params[:email]

  content_type :json
  {success: "You have successfully registered!"}.to_json
end

get '/emails' do
  content_type :json
  REDIS.lrange('emails', 0, -1).to_json
end
