require 'eventmachine'
require 'em-synchrony'
require 'em-synchrony/em-http'

EventMachine.synchrony do
  page = EventMachine::HttpRequest.new("http://www.google.com").get
 
  p "No callbacks! Fetched page: #{page}"
  EventMachine.stop
end