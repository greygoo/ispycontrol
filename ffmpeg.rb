#!/usr/bin/ruby


class FFMPEG 

  def initialize(config)
    @config = config
  end

  def start
    system("ffserver -f #{@config}")
  end

  def stop
    system("killall ffserver")
  end

end 
