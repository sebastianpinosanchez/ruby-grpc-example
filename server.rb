require 'grpc'
require_relative 'lib/calculator_services_pb.rb'

class CalculatorServer < Calculator::Calculator::Service
  def add(request, _unused_call)
    response = Calculator::AddResponse.new
    response.sum = request.a + request.b
    response
  end
end

class LoggingInterceptor < GRPC::ServerInterceptor
  def request_response(request:, call:, method:)
    start_time = Time.now
    resp = yield
    end_time = Time.now
    duration = ((end_time - start_time) * 1000.0).to_i
    puts "Request: #{method} (#{request}), Response: #{resp} (#{duration}ms)"
    resp
  end
end

server = GRPC::RpcServer.new(interceptors: [LoggingInterceptor.new])
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(CalculatorServer.new)
server.run_till_terminated
