require 'eventmachine'

class Pass < EM::Connection
  attr_accessor :a, :b
  def receive_data(data) 
    send_data "#{@a} #{data.chomp} #{b}"
  end
end

EM.run do 
  EM.start_server("127.0.0.1", 10000, Pass) do |conn|
    conn.a = "Goodbye"
    conn.b = "world"
  end
end