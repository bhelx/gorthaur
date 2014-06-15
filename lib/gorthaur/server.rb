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
      devices = AVCapture.devices.find(&:video?)
      if devices.nil? || devices.empty?
        raise "Could not find audio capture device"
      end
      @devices ||= devices
    end
  end
end
