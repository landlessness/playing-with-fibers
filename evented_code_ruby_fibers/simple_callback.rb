require 'eventmachine'
require 'em-http'

EventMachine.run {
  http = EventMachine::HttpRequest.new('http://www.google.com').get :timeout => 10

  http.callback {
    p http.response_header.status
    p http.response_header
    p http.response

    EventMachine.stop
  }
}