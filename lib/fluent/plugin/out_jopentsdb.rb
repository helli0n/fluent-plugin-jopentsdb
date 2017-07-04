module Fluent
require 'net/http'
require 'uri'
require 'json'
class JOpenTsdbOutput < Output
  Fluent::Plugin.register_output("jopentsdb", self)

  config_param :host, :string, :default => 'localhost'
  config_param :port, :integer, :default => 4242

  def configure(conf)
    super
  end

  def start
    super
    connect
  end
  
  def connect
    @socket = TCPSocket.new(@host, @port)    
    $log.info "connected to opentsdb at #{@host}:#{@port}"
  end 

  def shutdown
    super
    @socket.shutdown(Socket::SHUT_RDWR)
  end

  def emit(tag, es, chain)
    es.each do |time,record|
      $log.debug "opentsdb output processing record #{record}"
      put_metric(record)
    end

    chain.next
  end
  
  def put_metric(record)
    $log.debug "#{record}"
    message = record
    $log.debug message
    begin
      uri = URI.parse("http://#{@host}:#{@port}/api/put")
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"
      request["Accept"] = "Application/json"
      request.body = JSON.dump(message)
    req_options = {
    use_ssl: uri.scheme == "https",
      }
                      
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
    end
                                    
    rescue Errno::EPIPE, Errno::ECONNRESET => e
      $log.warn("Connection to opentsdb server died",
                   :exception => e, :host => @host, :port => @port)
      sleep(2)
      connect
    end
  end   
end
end
