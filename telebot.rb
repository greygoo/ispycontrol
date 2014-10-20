require 'sinatra'
require_relative './ispy'

i = ISPY.new("10.10.1.1","8150")

get '/botcontrol' do
  "Telebot control interface"
  erb :control
end

post "/commands" do
  puts " parameter is: #{params[:command]}"
  i.send(params[:command])
end
