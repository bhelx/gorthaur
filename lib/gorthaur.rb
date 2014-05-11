require "drb"
require "thread"
require "logger"
require "av_capture"

module Gorthaur
  URI = "druby://localhost:8787"
  DEFAULT_RATE = 5
  DEFAULT_PATH = File.join(Dir.home, "Pictures", "gorthaur", "frames")
  DEFAULT_PID_PATH = File.join(Dir.home, ".gorthaur")
  DEFAULT_LOG_PATH = File.join(Dir.home, ".gorthaur")
end

require_relative "gorthaur/version"
require_relative "gorthaur/server"
require_relative "gorthaur/client"
