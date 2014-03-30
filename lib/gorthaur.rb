require "drb"
require "thread"
require "logger"
require "av_capture"

module Gorthaur
  URI = "druby://localhost:8787"
end

require_relative "gorthaur/version"
require_relative "gorthaur/server"
require_relative "gorthaur/client"
