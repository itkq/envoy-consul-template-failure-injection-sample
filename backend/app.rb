require 'sinatra'
require 'json'

get '/api' do
  { status: 'ok' }.to_json
end
