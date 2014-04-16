module Gorthaur
  class Server
    def initialize
      @request = Queue.new
      @response = Queue.new
      @mutex = Mutex.new
      @session = AVCapture::Session.new
    end

    def capture
      @mutex.synchronize do
        @request << "x"
        @response.pop
      end
    end

    def call
      @session.run_with(recorders) do |connection|
        while @request.pop
          @response.push connection.capture
        end
      end
    end

    private

    def recorders
      AVCapture.devices.find(&:video?)
    end
  end
end
