#!/usr/bin/ruby

require 'socket'

class ISPY 

  def initialize(host, port)
    @socket = TCPSocket.new(host,port)
  end
 
  def disconnect
    @socket.close
  end

  def send(command)
    case command
    when "move_forward"
      puts "Moving forward"
      @socket.write [ 0x31, 0x31, 0x32, 0x31 ].pack('C*')
    when "move_backward"
      @socket.write [ 0x31, 0x32, 0x32, 0x32 ].pack('C*')
    when "move_cw"
      @socket.write [ 0x31, 0x31, 0x32, 0x32 ].pack('C*')
    when "move_ccw"
      @socket.write [ 0x31, 0x32, 0x32, 0x31 ].pack('C*')
    when "move_stop"
      @socket.write [ 0x31, 0x30, 0x32, 0x30 ].pack('C*')
    when "turret_up"
      @socket.write [ 0x33, 0x31 ].pack('C*')
    when "turret_down"
      @socket.write [ 0x33, 0x32 ].pack('C*')
    when "turret_stop"
      @socket.write [ 0x33, 0x30 ].pack('C*')
    end
  end
end 
