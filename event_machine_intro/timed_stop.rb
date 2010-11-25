require 'eventmachine'
EM.run do 
  EM.add_timer(4) { EM.stop }
end