require 'sinatra'
require_relative './ispy'
require_relative './ffmpeg'

ffserver_conf = "#{File.dirname(__FILE__)}/ffmpeg/ffserver.conf"
encoder = FFMPEG.new(ffserver_conf)


get '/botcontrol' do
  "Telebot control interface"
  erb :control
end

post "/control" do
  puts " parameter is: #{params[:command]}"
  if params[:command] == "connect"
    puts "Connecting to bot"
    $i = ISPY.new("10.10.1.1","8150")
  elsif params[:command] == "disconnect"
    puts "Disconnecting from bot"
    $i.disconnect
  end
end

post "/commands" do
  puts " parameter is: #{params[:command]}"
  $i.send(params[:command])
end

post "/video" do

  if params[:command] == "start"
    encoder.start
  elsif params[:command] == "stop"
    encoder.stop
  end

  #puts " parameter is: #{params[:command]}"
  #if params[:command] == "start"
  #  puts "starting ffmpeg"
  #  system("ffserver -f #{ffserver_conf}")
  #elsif params[:command] == "stop"
  #  puts "stopping ffmpeg"
  #  system("killall ffserver")
  #end
end
