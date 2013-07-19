require 'sinatra'
require 'json'
require 'redis'

configure do
  EMAILS = Redis.new
end

get '/' do
  erb :index
end

post '/register' do
  EMAILS.lpush 'emails', params[:email]

  content_type :json
  {success: "You have successfully registered!"}.to_json
end

get '/emails' do
  content_type :json
  EMAILS.lrange('emails', 0, -1).to_json
end
