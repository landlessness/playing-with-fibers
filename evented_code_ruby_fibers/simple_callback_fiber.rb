require 'eventmachine'
require 'em-http'

def http_get(url)
  f = Fiber.current
  http = EventMachine::HttpRequest.new(url).get
  
  http.callback {f.resume(http)}
  http.errback {f.resume(http)}
  
  return Fiber.yield
end

EventMachine.run do
  Fiber.new do
    page = http_get('http://www.google.com')
    puts "Fetched page: #{page.response_header.status}"
    if page
      page = http_get('http://www.google.com/search?q=eventmachine')
      puts "Fetched page 2: #{page.response_header.status}"      
    end
  end
end
