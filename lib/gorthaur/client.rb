module Gorthaur
  class Client
    def initialize(rate, directory)
      @rate = rate
      # add a prefix a datetime stamp to the directory so we have uniuqe 'client sessions'
      @directory = FileUtils.mkdir_p(File.join(directory, Time.now.strftime("%Y-%m-%d-%H:%M:%S")))
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
