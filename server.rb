require 'socket'	# Provides TCPServer and TCPSocket classes
require 'json'


server = TCPServer.open(2000)

loop {
  Thread.start(server.accept) do |client|
    
    request = client.read_nonblock(256)

    request_header, request_body = request.split("\r\n\r\n", 2)   # splits request into header and body
    path = request_header.split[1][1..-1]                         # gets path from request header
    method = request_header.split[0]                              # gets method: GET or POST

    if File.exist?(path)
      response_body = File.read(path)
      client.puts "HTTP/1.1 200 OK\r\nContent-type:text/html\r\n\r\n"
      if method == 'GET'
        client.puts response_body
      elsif method == 'POST'
        params = JSON.parse(request_body)
        user_data = "<li>name: #{params['person']['name']}</li><li>e-mail: #{params['person']['email']}</li>"
        client.puts response_body.gsub('<%= yield %>', user_data)
      end     
    else
      client.puts "HTTP/1.1 404 Not Found\r\n\r\n"
      client.puts '404 Error, File Not Found'
    end
    client.close
  end
}