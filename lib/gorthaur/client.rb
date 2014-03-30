module Gorthaur
  class Client
    def initialize(rate, frame, directory)
      @rate = rate
      @frame = frame
      @directory = directory
      # @logger = Logger.new
      @server = DRbObject.new_with_uri(Gorthaur::URI)
    end

    def call
      loop do
        # @logger.info "#{@frame} "
        IO.write(File.join(@directory, "#{@frame}.jpg"), @server.capture)
        sleep(@rate)
        @frame += 1
      end
    end
  end
end
