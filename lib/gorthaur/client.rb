module Gorthaur
  class Client
    def initialize(rate, directory)
      @rate = rate
      @directory = directory
      @server = DRbObject.new_with_uri(Gorthaur::URI)
    end

    def call
      loop do
        IO.write(File.join(@directory, "#{Time.now}.jpg"), @server.capture)
        sleep(@rate)
      end
    end
  end
end
