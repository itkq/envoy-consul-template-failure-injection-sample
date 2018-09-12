require 'sinatra'
require 'net/http'

get '/backend' do
  uri = URI.parse(ENV.fetch('BACKEND_URL', 'http://backend/api'))

  http = Net::HTTP.new(uri.host, uri.port)
  req = Net::HTTP::Get.new(uri.request_uri)
  req['Host'] = ENV['BACKEND_HOST'] if ENV['BACKEND_HOST']
  res = http.start do
    http.request(req)
  end
  res.value

  { status: 'ok' }.to_json
end
